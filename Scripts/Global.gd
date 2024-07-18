extends Node

var inventory: Dictionary
var player_node: CharacterBody2D = null
var player_inventory_ui_reference

func _ready():
	pass
	
func set_level_items(level_object_spawn_resource: ObjectSpawnListResource):
	player_inventory_ui_reference.set_new_object_list(level_object_spawn_resource)
	for object in level_object_spawn_resource.ObjectArray:
		inventory[object.Item_Unique_Key] = {
			"resource": object,
			"found": false
		}
		
func set_player_reference(player):
	player_node = player
	
func set_player_inventory_reference(inventory_reference):
	player_inventory_ui_reference = inventory_reference
	
func wipe_level_inventory():
	inventory = {}
	
func find_item(item_unique_key: String):
	inventory[item_unique_key]["found"] = true
	
	player_inventory_ui_reference.item_found(item_unique_key)
		
func is_player_interacting():
	if (player_node.is_interacting):
		return true
	return false
