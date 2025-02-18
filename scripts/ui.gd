extends Control

@onready var book_slot = $Inventory/Inventory/Row1/BookSlot

@export var items_per_row: int = 4

# rows
@onready var row_1 = $Inventory/Inventory/Row1
@onready var row_2 = $Inventory/Inventory/Row2
@onready var row_3 = $Inventory/Inventory/Row3
@onready var row_4 = $Inventory/Inventory/Row4
@onready var row_5 = $Inventory/Inventory/Row5
@onready var row_6 = $Inventory/Inventory/Row6


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func load_inventory() -> void:
	var n : int = 0
	for i in InventoryHandler.inventory_array:
		pass
