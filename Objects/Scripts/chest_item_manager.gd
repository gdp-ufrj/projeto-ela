extends Sprite2D

@export var item_resource: ItemResource

@onready var interactable_area = $ChestInteractableArea

func _ready():
	interactable_area.set_item_chest_should_give(item_resource)
