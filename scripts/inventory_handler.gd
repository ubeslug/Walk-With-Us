extends Node

var inventory_array : Array = [
	
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reset_inventory() -> void:
	inventory_array = []

func check_inventory(item) -> bool:
	for i in inventory_array:
		if i == item:
			return true
	return false

func add_to_inventory(item) -> void:
	inventory_array.append(item)

func remove_from_inventory(item) -> void:
	var n : int = 0
	for i in inventory_array:
		if i == item:
			inventory_array.remove_at(n)
			break
		else:
			n += 1
