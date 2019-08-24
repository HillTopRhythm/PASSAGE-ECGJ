extends Node2D



func _on_Area2D_area_entered(area):
	get("Particles2D").set_emmitting(true)