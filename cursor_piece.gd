extends Node2D

var piece = null
var piece_node = preload("res://piece.tscn")

func _process(_delta):
	var mouse_position = get_viewport().get_mouse_position()
	global_position = mouse_position
	global_position.x += 5;
	global_position.y += 5;
	
func has_cursor():
	return visible
	
func start_cursor(temp_p):
	print(temp_p.idx)
	piece = piece_node.instantiate()
	piece.update_arr(temp_p.arr, temp_p.width, temp_p.color - Color(0.0, 0.0, 0.0, 0.5), 
		temp_p.money_loss, temp_p.required_loss, temp_p.idx)
	add_child(piece)
	visible = true

func clear_cursor():
	piece = null
	for n in get_children():
		remove_child(n)
		n.queue_free()
	visible = false

func get_piece():
	return piece


func _on_mouse_catcher_gui_input(event):
	if event is InputEventMouseButton \
		and event.button_index == MOUSE_BUTTON_RIGHT \
		and event.is_pressed():
		clear_cursor()
