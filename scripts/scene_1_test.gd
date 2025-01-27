extends Node2D

const Balloon = preload("res://scenes/dialogue balloons/balloon.tscn")

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"


# Called when the node enters the scene tree for the first time.
func _ready():
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_scene_2a_pressed():
	get_tree().change_scene_to_file("res://scenes/Test Scenes/scene_2a_test.tscn")


func _on_scene_2b_pressed():
	get_tree().change_scene_to_file("res://scenes/Test Scenes/scene_2b_test.tscn")
