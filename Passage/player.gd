extends KinematicBody2D


const movement = Vector2(0,-1)
var velocity = Vector2()
export var move_speed = 210
var gravity = 500
var jump_power = -250
var is_grounded
onready var raycasts = $raycasts
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	velocity.y += gravity * delta 
	velocity.x += lerp(velocity.x, move_speed * delta, 1)
	clamp(velocity.x, 0, 2000)
	velocity = move_and_slide(velocity, movement)
	is_grounded = _check_is_grounded()

func _input(event):
	if event.is_action_pressed("jump") && is_on_floor():
		velocity.y = jump_power

func _check_is_grounded():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false