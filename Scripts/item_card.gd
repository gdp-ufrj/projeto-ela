extends ColorRect
class_name ItemCard

@export var item_resource : ItemResource

@onready var item_label
@onready var item_sprite
@onready var previous_state_of_modulation

func _ready():
	item_sprite = $Sprite2D
	item_label = $RichTextLabel
	previous_state_of_modulation = item_sprite.self_modulate
	
	item_sprite.texture = item_resource.Item_Sprite
	item_sprite.self_modulate = Color(0,0,0)
	item_label.text = "[center]???[/center]"

func update_object_attributes_when_found():
	item_label.text = "[center]" + item_resource.Item_Name + "[/center]"
	item_sprite.self_modulate = previous_state_of_modulation
	

