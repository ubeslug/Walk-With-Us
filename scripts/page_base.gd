extends Control


@export_category("Settings")
@export var active: bool = true
@export_range(0, 3) var bookworm_level: int = 0

# bookworm nodes
@onready var level_1 = $book_worms/level_1
@onready var level_2 = $book_worms/level_2
@onready var level_3 = $book_worms/level_3



# Called when the node enters the scene tree for the first time.
func _ready():
	if active:
		visible = true
	else:
		visible = false
	
	update_worm_level(bookworm_level)
	

func update_worm_level(level: int) -> void:
	if level == 0:
		level_1.visible = false
		level_2.visible = false
		level_3.visible = false
	elif level == 1:
		level_1.visible = true
		level_2.visible = false
		level_3.visible = false
	elif level == 2:
		level_1.visible = true
		level_2.visible = true
		level_3.visible = false
	elif level == 3:
		level_1.visible = true
		level_2.visible = true
		level_3.visible = true
