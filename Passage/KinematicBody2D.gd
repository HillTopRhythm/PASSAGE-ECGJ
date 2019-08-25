extends KinematicBody2D

const movement = Vector2(0,-1)
var velocity = Vector2()
export var move_speed = -1300
var gravity = 500

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	velocity.y += gravity * delta 
	velocity.x = move_speed
	velocity = move_and_slide(velocity, movement)
	

func _on_Area2D_area_entered(area):
	velocity.x = 0
