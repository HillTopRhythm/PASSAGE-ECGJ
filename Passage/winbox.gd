extends Area2D







func _on_winbox_body_entered(body):
	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(2) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child
	t.start()			# Start it
	yield(t, "timeout")		# Finally, make the script stop with the yield
	print("WORLD")	
	get_tree().change_scene("res://end screen.tscn")