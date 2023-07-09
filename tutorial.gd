extends Node2D

var delay = 5

var timer = 0;

func _process(delta):
	timer += delta
	if timer > delay:
		get_tree().change_scene_to_file("res://root.tscn")


func _on_clicker_gui_input(event):
	if timer > 0.5:
		if event is InputEventMouseButton \
			and event.button_index == MOUSE_BUTTON_LEFT \
			and event.is_pressed():
			get_tree().change_scene_to_file("res://root.tscn")
