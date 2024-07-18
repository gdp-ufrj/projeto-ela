extends Interactable

@export var is_open = false	
@export var animation_player : AnimationPlayer

@export_group("Animation Names")
@export var open_animation : StringName = "opening_chest"
@export var close_animation : StringName = "closing_chest"

var given_item : ItemResource
var has_given_item : bool = false

@onready var player : CharacterBody2D = $pedro_player

func interact(user : Node2D):
	is_open = true
	animation_player.play(open_animation)
		
	if has_given_item:
		return
		
	if Global.player_node:
		Global.find_item(given_item.Item_Unique_Key)
		
func stop_interaction(user: Node2D):
	if(is_open):
		is_open = false
		animation_player.play(close_animation)
		
func reward_item():
	Global.find_item(given_item.Item_Unique_Key)
	
func set_item_chest_should_give(item_resource: ItemResource):
	given_item = item_resource
