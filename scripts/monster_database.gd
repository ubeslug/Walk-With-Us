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
		page_list.remove_at(40)
		$toc2.visible = false

func _process(delta: float) -> void:
	load_page(current_page)
	visible = Globals.bestiary_active
	check_page_ends()
	page_buttons_check()
	if current_page == 0:
		names.visible = true
	else:
		names.visible = false
	
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
	current_page = 40

func _on_texture_button_pressed():
	Globals.bestiary_active = false
	$"Node/book close".play()

func _on_lavender_pressed() -> void:
	current_page = 1
	$Node/PageFlip.play()
func _on_nshade_pressed() -> void:
	current_page = 2
	$Node/PageFlip.play()
func _on_buckle_pressed() -> void:
	current_page = 3
	$Node/PageFlip.play()
func _on_cotton_pressed() -> void:
	current_page = 4
	$Node/PageFlip.play()
func _on_snow_pressed() -> void:
	current_page = 5
	$Node/PageFlip.play()
func _on_love_pressed() -> void:
	current_page = 6
	$Node/PageFlip.play()
func _on_whistle_pressed() -> void:
	current_page = 7
	$Node/PageFlip.play()
func _on_oak_pressed() -> void:
	current_page = 9
	$Node/PageFlip.play()
func _on_omega_pressed() -> void:
	current_page = 10
	$Node/PageFlip.play()
func _on_bookworms_pressed() -> void:
	current_page = 11
	$Node/PageFlip.play()
func _on_toads_pressed() -> void:
	current_page = 12
	$Node/PageFlip.play()
func _on_egg_pressed() -> void:
	current_page = 13
	$Node/PageFlip.play()
func _on_rats_pressed() -> void:
	current_page = 14
	$Node/PageFlip.play()
func _on_deer_pressed() -> void:
	current_page = 15
	$Node/PageFlip.play()
func _on_fox_pressed() -> void:
	current_page = 16
	$Node/PageFlip.play()
func _on_bloom_pressed() -> void:
	current_page = 17
	$Node/PageFlip.play()
func _on_tea_pressed() -> void:
	current_page = 18
	$Node/PageFlip.play()
func _on_table_pressed() -> void:
	current_page = 19
	$Node/PageFlip.play()
func _on_jack_pressed() -> void:
	current_page = 20
	$Node/PageFlip.play()
func _on_rem_pressed() -> void:
	current_page = 21
	$Node/PageFlip.play()
func _on_cups_pressed() -> void:
	current_page = 22
	$Node/PageFlip.play()
func _on_blossom_pressed() -> void:
	current_page = 23
	$Node/PageFlip.play()
func _on_gol_pressed() -> void:
	current_page = 24
	$Node/PageFlip.play()
func _on_decrepit_pressed() -> void:
	current_page = 25
	$Node/PageFlip.play()
func _on_omen_pressed() -> void:
	current_page = 26
	$Node/PageFlip.play()
func _on_cent_pressed() -> void:
	current_page = 27
	$Node/PageFlip.play()
func _on_black_pressed() -> void:
	current_page = 28
	$Node/PageFlip.play()
func _on_grizz_pressed() -> void:
	current_page = 29
	$Node/PageFlip.play()
func _on_skeleton_pressed() -> void:
	current_page = 30
	$Node/PageFlip.play()
func _on_mimic_pressed() -> void:
	current_page = 31
	$Node/PageFlip.play()
func _on_burn_pressed() -> void:
	current_page = 32
	$Node/PageFlip.play()
func _on_whisper_pressed() -> void:
	current_page = 33
	$Node/PageFlip.play()
func _on_arach_pressed() -> void:
	current_page = 34
	$Node/PageFlip.play()
func _on_treant_pressed() -> void:
	current_page = 35
	$Node/PageFlip.play()
func _on_bros_pressed() -> void:
	current_page = 36
	$Node/PageFlip.play()
func _on_sludge_pressed() -> void:
	current_page = 37
	$Node/PageFlip.play()
func _on_jester_pressed() -> void:
	current_page = 38
	$Node/PageFlip.play()
func _on_monument_pressed() -> void:
	current_page = 39
	$Node/PageFlip.play()
