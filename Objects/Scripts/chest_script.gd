extends Interactable

@export var is_open = false	
@export var animation_player : AnimationPlayer

@export_group("Animation Names")
@export var open_animation : StringName = "opening_chest"
@export var close_animation : StringName = "closing_chest"

func interact(user : Node2D):
	is_open = true
	animation_player.play(open_animation)
	print_debug("Chest Opened")
	
	
func stop_interaction(user: Node2D):
	if(is_open):
		is_open = false
		animation_player.play(close_animation)
		print_debug("Chest Closed")	
	
