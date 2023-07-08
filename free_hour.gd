extends ColorRect

var mouseover = false;
var parent;
var default_color
var cur_color
var new_week_color
@export var idx: int;

var highlight_node = preload("res://date_highlight.tscn")
var highlight_obj
var highlighted = false
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

	parent = get_parent()
	if parent.add_child_hour != null:
		parent.add_child_hour(self)
	default_color = color
	cur_color = default_color
	reset_color = default_color
	#new_week_color = color + Color(0.125, 0.125, 0.125, 0.0)
	update_date(0, 0, 2030)
	highlight_obj.visible = false
	clear()
	if idx == 0:
		highlight()
	else:
		clear_highlight()
	
func update_date(_newdate, _month, _year):
	pass
	#date_counter += 1
	#if month != old_month:
		#old_month = month
		#if (idx + date_counter) % 7 == 0:
		#	reset_color = new_week_color
		#else:
		#	reset_color = default_color
		#if get_color() == new_week_color or get_color() == default_color:
		#	set_color(reset_color)

#func set_full(new_color, growth):
func set_full(new_color, growth):
	cur_color = new_color
	set_color(cur_color)	
	if highlighted:
		highlight()
	
	var dc = 0.02
	if growth[0]:
		$gd.visible = true
		$gd.color = cur_color - Color(dc, dc, dc, 0.0)
	if growth[1]:
		$gr.visible = true
		$gr.color = cur_color  - Color(dc, dc, dc, 0.0)

func clear():
	set_color(reset_color)
	cur_color = reset_color
	if highlighted:
		highlight()
	$gd.visible = false
	$gr.visible = false
	
func clear_highlight():
	highlighted = false
	set_color(cur_color)
	#highlight_obj.visible = false

func highlight():
	highlighted = true
	var hcolor = cur_color + Color(0.15, 0.15, 0.15)
	set_color(hcolor)
	
	#highlight_obj.visible = true
	
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
