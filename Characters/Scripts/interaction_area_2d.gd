extends Area2D

@export var interactor : Node2D
@export var interaction_action : StringName = "interact"

@onready var player_reference = $".."
@onready var interaction_indicator = $"../InteractionIndicator"
@onready var animation_player = $"../AnimationPlayer"

var selected_interactable : Interactable
var nearby_interactables : Array[Interactable]

func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	
func _input(event : InputEvent):
	if(event.is_action_pressed(interaction_action)):
		if(selected_interactable != null):
			selected_interactable.interact(interactor)

func _on_area_entered(area):
	interaction_indicator.visible = true
	
	if(area is Interactable):
		nearby_interactables.push_back(area)
		
		if(selected_interactable == null):
			selected_interactable = nearby_interactables[0]

func _on_area_exited(area):
	interaction_indicator.visible = false
		
	nearby_interactables.erase(area)
	selected_interactable.stop_interaction(interactor)
		
	if(nearby_interactables.size() > 0):
		selected_interactable = nearby_interactables[0]
	else:
		selected_interactable = null
		
