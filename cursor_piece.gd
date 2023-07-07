extends Node2D

func _process(_delta):
	var mouse_position = get_viewport().get_mouse_position()
	global_position = mouse_position
	
func start():
	self.visible = true

func end():
	self.visible = false
