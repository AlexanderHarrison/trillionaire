extends ColorRect

var mouseover = false;
var parent;
var default_color
@export var idx: int;

var highlight_node = preload("res://date_highlight.tscn")
var highlight_obj

func _ready():
	default_color = color
	highlight_obj = highlight_node.instantiate()
	add_child(highlight_obj)
	clear_highlight()
	parent = get_parent()
	if parent.add_child_hour != null:
		parent.add_child_hour(self);

func set_full(new_color):
	color = new_color

func clear():
	color = default_color
	
func clear_highlight():
	highlight_obj.visible = false

func highlight():
	highlight_obj.visible = true
	
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
	if event is InputEventMouseButton \
		and event.button_index == MOUSE_BUTTON_RIGHT \
		and event.is_pressed() \
		and mouseover:
		parent.box_click_r(idx)
