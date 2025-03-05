extends MenuButton

@onready var item_sprite = icon


@export_category("Misc")
@export var desc: String
@export var heal_amt: int


func _process(delta):
	pass


func _on_mouse_entered():
	item_sprite.modulate = "ff6464"



func _on_mouse_exited():
	pass # Replace with function body.
	item_sprite.modulate = "ffffff"
	
