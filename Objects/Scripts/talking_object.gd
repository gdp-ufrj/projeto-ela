extends Interactable

var timeline_key : StringName

var dialogue_end_key : StringName = "dialogue_ended"

var talking : bool = false

func _ready():
	Dialogic.signal_event.connect(_on_dialoc_signal)

func interact(user : Node2D):
	if (talking):
		pass
	if Dialogic.current_timeline != null:
		pass
	
	Dialogic.start(timeline_key as String)
	
func _on_dialoc_signal(argument : String):
	if(argument == dialogue_end_key):
		print_debug("dialogue_ended")
