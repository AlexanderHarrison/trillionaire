extends Node2D

var piece = null

func _process(_delta):
	var mouse_position = get_viewport().get_mouse_position()
	global_position = mouse_position
	global_position.x += 5;
	global_position.y += 5;
	
func has_cursor():
	return visible
	
func start_cursor(new_piece):
	piece = new_piece
	add_child(piece.duplicate())
	visible = true

func clear_cursor():
	piece = null
	for n in get_children():
		remove_child(n)
		n.queue_free()
	visible = false

func get_piece():
	return piece
