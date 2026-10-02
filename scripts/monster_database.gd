extends CanvasLayer

var current_page: int = 0
@onready var pages: Control = $pages

@onready var gojarus: Control = $pages/gojarus

# buttons
@onready var next_page = $Arrows/next_page
@onready var prev_page = $Arrows/prev_page
@onready var names = $Names
@onready var worms = $worms
@onready var agent = $pages/agent


var page_list: Array[Node] = [
]


func _ready() -> void:
	process_pages()
	gojarus.visible = false
	if Globals.agent == false:
		page_list.remove_at(41)
		$toc2.visible = false

func _process(delta: float) -> void:
	load_page(current_page)
	visible = Globals.bestiary_active
	check_page_ends()
	page_buttons_check()
	
	if gojarus.visible == true:
		Globals.found_my_page = true
	if Globals.bookworms == true:
		worms.visible = true
	else:
		worms.visible = false
	if Globals.agent == true:
		$toc2.visible = true
		if Globals.agent_added == false:
			page_list.push_back(agent)
			Globals.agent_added = true
			
	if current_page == 0 || current_page == 1:
		$toc3.position.y = 98.0
	else:
		$toc3.position.y = 103.0

	if current_page >= 2 && current_page <= 9:
		$flora.position.y = 98.0
	else:
		$flora.position.y = 103.0

	if current_page >= 10 && current_page <= 22:
		$fauna.position.y = 98.0
	else:
		$fauna.position.y = 103.0

	if current_page >= 23 && current_page <= 28:
		$humanoid.position.y = 98.0
	else:
		$humanoid.position.y = 103.0

	if current_page >= 29 && current_page <= 34:
		$undead.position.y = 98.0
	else:
		$undead.position.y = 103.0

	if current_page >= 35 && current_page <= 37:
		$monstrosity.position.y = 98.0
	else:
		$monstrosity.position.y = 103.0

	if current_page >= 38 && current_page <= 40:
		$construct.position.y = 98.0
	else:
		$construct.position.y = 103.0
	if current_page == 41:
		$toc2.position.y = 98.0
	else:
		$toc2.position.y = 103.0

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
		$Node/PageFlip.play()
	
	if Input.is_action_just_pressed("page_right") and current_page < page_list.size() - 1:
		current_page += 1
		$Node/PageFlip.play()
	
	if Input.is_action_just_pressed("close_bestiary") and Globals.bestiary_active == true:
		Globals.bestiary_active = false
		
	if Input.is_action_just_pressed("table"):
		current_page = 0
		$Node/PageFlip.play()


func _on_next_page_pressed() -> void:
	if current_page < page_list.size() - 1:
		$Node/PageFlip.play()
		current_page += 1



func _on_prev_page_pressed() -> void:
	if current_page > 0:
		$Node/PageFlip.play()
		current_page -= 1

func _on_toc_pressed() -> void:
	$Node/PageFlip.play()
	current_page = 0

func _on_toc_2_pressed() -> void:
	$Node/PageFlip.play()
	current_page = 41

func _on_texture_button_pressed():
	Globals.bestiary_active = false
	$"Node/book close".play()

func _on_flora_pressed() -> void:
	$Node/PageFlip.play()
	current_page = 2

func _on_fauna_pressed() -> void:
	$Node/PageFlip.play()
	current_page = 10

func _on_humanoid_pressed() -> void:
	$Node/PageFlip.play()
	current_page = 23

func _on_undead_pressed() -> void:
	$Node/PageFlip.play()
	current_page = 29

func _on_monstrosity_pressed() -> void:
	$Node/PageFlip.play()
	current_page = 35

func _on_construct_pressed() -> void:
	$Node/PageFlip.play()
	current_page = 38
