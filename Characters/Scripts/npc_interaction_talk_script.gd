extends Interactable

@export var animation_player : AnimationPlayer
# @export var player : CharacterBody2D

var timeline_key : StringName
var dialogue_end_key : StringName
@export var npc : NPC
@export var player : CharacterBody2D

var talking : bool = false

func _ready():
	Dialogic.signal_event.connect(_on_dialoc_signal)

func interact(user : Node2D):
	if Dialogic.current_timeline != null:
		pass
	
	npc.set_state_to_idle()
	Dialogic.start(timeline_key as String)
	
func _on_dialoc_signal(argument : String):
	if(argument == dialogue_end_key):
		npc.pick_new_state()
	
