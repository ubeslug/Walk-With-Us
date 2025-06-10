extends Panel

#item ID: 13


@onready var inventory_item = $InventoryItem

func _ready():
	var popup = inventory_item.get_popup()
	
	popup.id_pressed.connect(file_menu)


func file_menu(id):
	print(id)
	match(id):
		0:
			Globals.change_health(3)
			InventoryHandler.remove_from_inventory(2)
