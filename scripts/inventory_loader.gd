extends GridContainer




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_inventory()

func _process(delta: float) -> void:
	if InventoryHandler.inventory_updated == true:
		InventoryHandler.inventory_updated = false
		load_inventory()


func clear_inven_children() -> void:
	for i in self.get_children():
		self.remove_child(i)
		i.queue_free()

func load_inventory() -> void:
	clear_inven_children()
	for i in InventoryHandler.inventory_array:
		var new_item = InventoryHandler.all_items_array[i].instantiate()
		add_child(new_item)
