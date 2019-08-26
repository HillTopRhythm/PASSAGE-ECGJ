extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	get_node("sfx_run").play()
#
#


func _on_jump_box_detector_body_entered(body):
	get_node("sfx_run").stop()
	print("entered")
