extends Interactable

@onready var animation_player = $"../AnimationPlayer"

var next_scene_path: String

func interact(user : Node2D):
	animation_player.play("door_open")
	await animation_player.animation_finished
	TransitionScene.load_scene(next_scene_path)



