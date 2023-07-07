extends ColorRect

var mouseover = false;
var parent;
@export var idx: int;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	parent = get_parent()

func _on_mouse_entered():
	mouseover = true

func _on_mouse_exited():
	mouseover = false


func _on_gui_input(event):
	if event is InputEventMouseButton \
		and event.button_index == MOUSE_BUTTON_LEFT \
		and event.is_pressed() \
		and mouseover:
		parent.box_click(idx)
