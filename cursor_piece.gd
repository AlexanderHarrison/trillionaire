extends Node2D

func _process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	global_position = mouse_position
