extends CharacterBody2D

enum NPC_STATE { IDLE, WALK }

@export var move_speed : float = 20
@export var idle_time : float
@export var walk_time : float

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var npc_colision_shape = $CollisionShape2D
@onready var npc_sprite = $Sprite2D
@onready var timer = $Timer

var move_direction : Vector2 = Vector2.ZERO
var current_state : NPC_STATE = NPC_STATE.IDLE

func _ready():
	select_new_direction()
	pick_new_state()

func flip_colision_shape(x_direction):
	if x_direction >= 0:
		npc_colision_shape.position = Vector2(-2,10)
		if(npc_sprite.flip_h):
			npc_sprite.flip_h = false
	else:
		npc_colision_shape.position = Vector2(2,10)
		if(!npc_sprite.flip_h):
			npc_sprite.flip_h = true

func select_new_direction():
	var x_coords = randi_range(-1,1)
	var y_coords = randi_range(-1,1)
	
	flip_colision_shape(x_coords)
	
	move_direction = Vector2(x_coords, y_coords)

func _physics_process(_delta):
	if(current_state == NPC_STATE.WALK):
		# updating npc's velocity
		velocity = move_direction * move_speed
	
		#using the move and slide function
		move_and_slide()

# state switching
func pick_new_state():
	if(current_state == NPC_STATE.IDLE):
		state_machine.travel("Walk")
		current_state = NPC_STATE.WALK
		select_new_direction()
		timer.start(randi_range(1,10))
	elif(current_state == NPC_STATE.WALK):
		state_machine.travel("Idle")
		current_state = NPC_STATE.IDLE
		timer.start(randi_range(2,20))


func _on_timer_timeout():
	pick_new_state()
