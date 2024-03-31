extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_direction : Vector2 = Vector2(0, 0.5)
# parameters/Idle/blend_position

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var inventory_canvas_reference = $InventoryUI
@onready var inventory_control_reference = $InventoryUI/InventoryDisplay

var should_walk : bool = true

func _ready():
	update_animation_parameters(starting_direction)
	Dialogic.signal_event.connect(_on_dialoc_signal)
	
	Global.set_player_reference(self)
	Global.set_player_inventory_reference(inventory_control_reference)
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_inventory"):
		inventory_canvas_reference.visible = !inventory_canvas_reference.visible

func _physics_process(_delta):
	# getting the input direction
	if(!should_walk):
		return
	
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	update_animation_parameters(input_direction)
	
	# updating pedro's velocity
	velocity = input_direction * move_speed
	
	#using the move and slide function
	move_and_slide()
	
	pick_new_animation_state()

func update_animation_parameters(move_input: Vector2):
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input) 
		animation_tree.set("parameters/Idle/blend_position", move_input)
		
func pick_new_animation_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
		
func _on_dialoc_signal(argument : String):
	if (argument == 'dialogue_started'):
		should_walk = false
	if (argument == 'dialogue_ended'):
		should_walk = true
