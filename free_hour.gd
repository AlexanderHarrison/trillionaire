extends ColorRect

var mouseover = false;
var parent;
@export var idx: int;

func _ready():
	parent = get_parent()
	if parent.add_child_hour != null:
		parent.add_child_hour(self);

func set_full():
	self.color = "FFFFFFFF"

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
