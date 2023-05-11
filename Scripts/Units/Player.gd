extends CharacterBody2D

@export var speed = 350
@export var rotationSpeed = 7

#Vector = (Y,X)
const NORTH = Vector2(1,0)
const SOUTH = Vector2(-1,0)
const EAST = Vector2(0,1)
const WEST = Vector2(0,-1)
var DIRECTION = global_position
var STORED = NORTH

var input_direction = Input.get_vector("player_movement_left","player_movement_right","player_movement_up","player_movement_down")

@onready var SPRITE = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (Input.is_action_pressed("player_movement_up")) and \
	Input.is_action_pressed("player_movement_left"):
		DIRECTION = global_position+WEST+NORTH
		STORED = WEST+NORTH
	elif (Input.is_action_pressed("player_movement_up")) and \
	Input.is_action_pressed("player_movement_right"):
		DIRECTION = global_position+EAST+NORTH
		STORED = EAST+NORTH
	elif (Input.is_action_pressed("player_movement_down")) and \
	Input.is_action_pressed("player_movement_left"):
		DIRECTION = global_position+WEST+SOUTH
		STORED = WEST+SOUTH
	elif (Input.is_action_pressed("player_movement_down")) and \
	Input.is_action_pressed("player_movement_right"):
		DIRECTION = global_position+EAST+SOUTH
		STORED = EAST+SOUTH
	elif Input.is_action_pressed("player_movement_left"):
		DIRECTION = global_position+WEST
		STORED = WEST
	elif Input.is_action_pressed("player_movement_right"):
		DIRECTION = global_position+EAST
		STORED = EAST
	elif Input.is_action_pressed("player_movement_up"):
		DIRECTION = global_position+NORTH
		STORED = NORTH
	elif Input.is_action_pressed("player_movement_down"):
		DIRECTION = global_position+SOUTH
		STORED = SOUTH
	else: DIRECTION = global_position+STORED
	
	# SMOOTH LOOK_AT
	var vector = DIRECTION - global_position
	var angle = vector.angle()
	var currentRotation = global_rotation
	#Set Rotation
	global_rotation = lerp_angle(currentRotation, angle, rotationSpeed * delta)
	
	input_direction = Input.get_vector("player_movement_left","player_movement_right","player_movement_up","player_movement_down")
	velocity = input_direction*(speed+delta)
	
func _process(_delta):
	move_and_slide()
