extends CanvasLayer

var current_page: int = 0

@onready var pages: Control = $pages

# buttons
@onready var next_page = $Arrows/next_page
@onready var prev_page = $Arrows/prev_page


var page_list: Array[Node] = [
]


func _ready() -> void:
	process_pages()

func _process(delta: float) -> void:
	load_page(current_page)
	visible = Globals.bestiary_active
	check_page_ends()
	page_buttons_check()
	
	if current_page == 13:
		Globals.found_my_page = true

func process_pages() -> void:
	for i in pages.get_children():
		page_list.push_back(i)

func load_page(page: int) -> void:
	for i in page_list:
		i.visible = false
	page_list[page].visible = true


func check_page_ends() -> void:
	if current_page == 0:
		prev_page.disabled = true
	else:
		prev_page.disabled = false
	
	if current_page == page_list.size() - 1:
		next_page.disabled = true
	else:
		next_page.disabled = false

func page_buttons_check() -> void:
	if Input.is_action_just_pressed("page_left") and current_page > 0:
		current_page -= 1
	
	if Input.is_action_just_pressed("page_right") and current_page < page_list.size() - 1:
		current_page += 1
	
	if Input.is_action_just_pressed("close_bestiary") and Globals.bestiary_active == true:
		Globals.bestiary_active = false


func _on_next_page_pressed() -> void:
	if current_page < page_list.size() - 1:
		$Node/PageFlip.play()
		current_page += 1



func _on_prev_page_pressed() -> void:
	if current_page > 0:
		$Node/PageFlip.play()
		current_page -= 1



func _on_texture_button_pressed():
	Globals.bestiary_active = false
	$"Node/book close".play()
	
