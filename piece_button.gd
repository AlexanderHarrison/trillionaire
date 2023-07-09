extends Container

@export_multiline var piece_name: String;
@export var arr: Array[bool];
@export var width: int;
@export var color: Color;
@export var money_loss: int;
@export var required_loss: int;
@export var idx: int

var mouseover = false;
var cursorpiece

# Called when the node enters the scene tree for the first time.
func _ready():
	$BoxContainer/CenterContainer2/piece.update_arr(
		arr, 
		width, 
		color, 
		money_loss, 
		required_loss,
		idx
	)
	$BoxContainer/CenterContainer/VBoxContainer/name.set_text(piece_name);
	$BoxContainer/CenterContainer/VBoxContainer/effect.set_text(format_money(-money_loss));
	cursorpiece = get_tree().root.get_child(1).get_node("cursor_piece")

func _on_mouse_entered():
	mouseover = true

func _on_mouse_exited():
	mouseover = false

func _on_gui_input(event):
	if event is InputEventMouseButton \
		and event.button_index == MOUSE_BUTTON_LEFT \
		and event.is_pressed() \
		and mouseover:
		$click_player.play()
		if cursorpiece.has_cursor():
			cursorpiece.clear_cursor()
		cursorpiece.start_cursor($BoxContainer/CenterContainer2/piece)
	if event is InputEventMouseButton \
		and event.button_index == MOUSE_BUTTON_RIGHT \
		and event.is_pressed() \
		and mouseover:
		cursorpiece.clear_cursor()

func format_money(m):
	var txt
	if m < 0:
		txt = "-$"
		m = -m
	else:
		txt = "$"
		
	var segments = []
	while m > 0:
		segments.append(m % 1000)
		m = floori(m / 1000)
	
	segments.reverse()
	
	if segments.size() == 0:
		return "$0"
	else:
		txt = "%s%s" % [txt, segments[0]]
		for i in segments.size()-1:
			var seg = segments[i+1]
			txt = "%s,%0*d" % [txt, 3, seg]
		return txt
