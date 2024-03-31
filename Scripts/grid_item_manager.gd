extends GridContainer

@onready var grid_container = $ColorRect/MarginContainer/GridContainer

@export var stage_object_list : ObjectSpawnListResource

var is_open: bool = false

func _ready():
	var object_list = stage_object_list.ObjectArray
	var item_card_instantiable = load("res://Scenes/UI/Inventory/item_card.tscn")
	for object in object_list:
		print_debug(object.Item_Name)
		var object_card = item_card_instantiable.instantiate()
		object_card.item_resource = object
		grid_container.add_child(object_card)
