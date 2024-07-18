extends Sprite2D

@onready var tree_root = get_parent()
@onready var object_interactable_area = $ObjectInteractableArea

@export var item_resource: ItemResource

func delete_item():
	queue_free()

func _ready():
	object_interactable_area.item_to_give = item_resource
