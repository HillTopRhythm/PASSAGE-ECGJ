extends KinematicBody2D


const movement = Vector2(0,-1)
var velocity = Vector2()
export var move_speed = 250
var gravity = 600
var jump_power = -250
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	velocity.y += gravity * delta 
	velocity.x += lerp(velocity.x, move_speed * delta, 1)
#	clamp(velocity.x, 0, 1000)
	velocity = move_and_slide(velocity, movement)
	if is_on_floor():
		$AnimationPlayer.play("run")

func _input(event):
	if event.is_action_pressed("jump") && is_on_floor():
		velocity.y = jump_power
		$AnimationPlayer.play("Jump-anim")
#
#func is_falling():
#	$AnimationPlayer.play("hang time")
#	print("fook")

func _on_winbox_body_entered(body):
	print("WIN")
	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(0.5) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child
	t.start()			# Start it
	yield(t, "timeout")
	set(move_speed, 0)
	$AnimationPlayer.play("win")
	print("anim")