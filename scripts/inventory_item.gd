extends MenuButton

@onready var item_sprite = $ItemSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	pass # Replace with function body.
	item_sprite.modulate = "ff6464"



func _on_mouse_exited():
	pass # Replace with function body.
	item_sprite.modulate = "ffffff"
