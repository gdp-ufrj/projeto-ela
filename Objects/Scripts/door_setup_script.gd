extends StaticBody2D

@onready var area_2d = $Area2D

@export var next_scene_path: String 

func _ready():
	area_2d.next_scene_path = next_scene_path
