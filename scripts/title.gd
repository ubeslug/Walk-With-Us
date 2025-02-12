extends Node2D

# Animation Nodes
@onready var animation_player: AnimationPlayer = $AnimationPlayers/AnimationPlayer
@onready var fade_handler: AnimationPlayer = $"AnimationPlayers/Fade handler"

@onready var quit_node: Control = $CanvasLayer/quit_node


#buttons
@onready var yes_quit: Button = $CanvasLayer/quit_node/Panel/VBoxContainer/HBoxContainer/yes_quit
@onready var no_quit: Button = $CanvasLayer/quit_node/Panel/VBoxContainer/HBoxContainer/no_quit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	disable_quit_node(true)
	#fade_handler.play("fade_in")
	#await fade_handler.animation_finished
	#print("done with fade in")
	#animation_player.play("background_shake")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func disable_quit_node(value: bool) -> void:
	yes_quit.disabled = value
	no_quit.disabled = value
	quit_node.visible = not value
	
func _on_quit_pressed() -> void:
	disable_quit_node(false)

func _on_yes_quit_pressed() -> void:
	get_tree().quit()

func _on_no_quit_pressed() -> void:
	disable_quit_node(true)


func _on_new_game_pressed():
	fade_handler.play("fade-out")
	await fade_handler.animation_finished
	get_tree().change_scene_to_file("res://scenes/encounters/berry_encounter.tscn")
