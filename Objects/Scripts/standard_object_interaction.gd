extends Interactable

var item_to_give : ItemResource

@onready var player : CharacterBody2D = $pedro_player

@export var StandardObjectRoot : Sprite2D

func interact(user : Node2D):
	if Global.player_node:
		Global.find_item(item_to_give.Item_Unique_Key)
	
	StandardObjectRoot.delete_item()
