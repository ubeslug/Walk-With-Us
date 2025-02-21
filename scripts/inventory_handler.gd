extends Node

var inventory_array : Array = [
	
]

var inventory_updated: bool = false

var all_items_array : Array[PackedScene] = [
	preload("res://scenes/items/package_item.tscn"),			#0_package
	preload("res://scenes/items/bestiary_item.tscn"),			#1_bestiary
	preload("res://scenes/items/healthpotion.tscn"),			#2_health potion
	preload("res://scenes/items/berry.tscn"),					#3_single berry
	preload("res://scenes/items/berrybundle.tscn"),				#4_berry bundle
	preload("res://scenes/items/deadfish.tscn")					#5_dead fish
]

var item_potion
var item_berry_bunch
var item_berry



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

func add_to_inventory(item: int) -> void:
	var new_item 
	inventory_array.append(item)
	inventory_updated = true
	print(inventory_array)

func remove_from_inventory(item: int) -> void:
	var n : int = 0
	for i in inventory_array:
		if i == item:
			inventory_array.remove_at(n)
			break
		else:
			n += 1
	inventory_updated = true
