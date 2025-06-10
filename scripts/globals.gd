extends Node

#settings
var text_sounds: bool = false


var bestiary_updated: bool = false
var bestiary_active: bool = false
var bestiary1_active: bool = false
var bookworms: bool = false
var agent: bool = false
var agent_added: bool = false

var max_health: int = 5
var health: int = 5

#other
var found_my_page: bool = false
var sludge_dead: bool = false
var ending: int = 0
var matriarch: bool = false
var mark: bool = false


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_fullscreen"):
		toggle_fullscreen()

func reset_health() -> void:
	health = max_health

func change_health(amount: int) -> void:
	health += amount
	if health > max_health:
		health = max_health

func toggle_fullscreen() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN or \
		DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(Vector2(1920, 1080))
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
