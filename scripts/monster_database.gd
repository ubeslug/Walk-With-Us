extends Control

var current_page: int = 0

@onready var pages: Control = $pages

@export var page_list: Array[Node] = [
	#$pages/jackalope_page,
	#$pages/red_fox_page,
	#$pages/MimeticPage,
	#$pages/oak_page,
	#$pages/omega_oak_page,
	#$pages/jester_page
]


func _ready() -> void:
	process_pages()

func _process(delta: float) -> void:
	load_page(current_page)

func process_pages() -> void:
	for i in pages.get_children():
		page_list.push_back(i)

func load_page(page: int) -> void:
	for i in page_list:
		i.visible = false
	page_list[page].visible = true

func _on_next_page_pressed() -> void:
	if current_page < page_list.size() - 1:
		current_page += 1
	


func _on_prev_page_pressed() -> void:
	if current_page > 0:
		current_page -= 1
