extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = 2 #wait 2 seconds
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	$Particles2D.emitting = true
	print("HELLO") 			# Code before the yield
	# Setting up the yield:
	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(2) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child
	t.start()			# Start it
	yield(t, "timeout")		# Finally, make the script stop with the yield
	print("WORLD")	
	get_tree().change_scene("res://start screen.tscn")