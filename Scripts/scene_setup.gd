extends Node2D

@export var level_items: ObjectSpawnListResource

func _ready():
	Global.set_level_items(level_items)
