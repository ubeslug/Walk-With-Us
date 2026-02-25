extends Node
@onready var animation_player = $AnimationPlayer
const Balloon = preload("res://scenes/dialogue balloons/balloon.tscn")

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_tree().current_scene.name == "The_Houses":
		$Player.position = Vector2(1001,259)
	if get_tree().current_scene.name == "The_Docks":
		$Player.position = Vector2(514,434)
	if Globals.map_active == true:
		$ColorRect.visible = true
		$ColorRect/Map/CanvasLayer.visible = true
	else:
		$ColorRect.visible = false
		$ColorRect/Map/CanvasLayer.visible = false
	pass


func _on_docks_pressed() -> void:
	animation_player.play("fade_out")
	await animation_player.animation_finished
	Globals.map_active = false
	get_tree().change_scene_to_file("res://scenes/testing/start.tscn")
	pass # Replace with function body.


func _on_houses_pressed() -> void:
	animation_player.play("fade_out")
	await animation_player.animation_finished
	Globals.map_active = false
	get_tree().change_scene_to_file("res://scenes/testing/houses.tscn")
	pass # Replace with function body.


func _on_x_pressed() -> void:
	Globals.map_active = false
	pass # Replace with function body.
