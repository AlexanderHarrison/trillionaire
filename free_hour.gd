extends ColorRect

var mouseover = false;
var parent;
var default_color
var new_week_color
@export var idx: int;

var highlight_node = preload("res://date_highlight.tscn")
var highlight_obj
var date
var old_month
var date_counter
var reset_color

func _ready():
	highlight_obj = highlight_node.instantiate()
	add_child(highlight_obj)
	var root = get_tree().root.get_child(0)
	date = root.get_node("date")
	date.call_on_date_update(self)
	old_month = -1
	date_counter = -1
	clear_highlight()
	parent = get_parent()
	if parent.add_child_hour != null:
		parent.add_child_hour(self)
	default_color = color
	new_week_color = color + Color(0.125, 0.125, 0.125, 0.0)
	update_date(0, 0, 2030)
	
func update_date(newdate, month, _year):
	date_counter += 1
	if month != old_month:
		old_month = month
		if (idx + date_counter) % 7 == 0:
			set_color(new_week_color)
		else:
			set_color(default_color)
		reset_color = color

func set_full(new_color):
	set_color(new_color)

func clear():
	set_color(reset_color)
	
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
