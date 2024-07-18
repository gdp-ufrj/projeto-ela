extends Sprite2D

@onready var area_2d = $Area2D
@onready var collision_shape_2d = $StaticBody2D/CollisionShape2D

@export var timeline_key : String
@export var should_collide : bool = true

func _ready():
	area_2d.timeline_key = timeline_key
	if !should_collide:
		collision_shape_2d.disabled = true
