extends Container

@export_multiline var piece_name: String;
@export var arr: Array[bool];
@export var width: int;
@export var color: Color;
@export var money_loss: int;
@export var required_loss: int;
@export var research_gain: int;
@export var is_buy_asset: bool;
@export var asset_node_name: String;

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
	)
	$BoxContainer/CenterContainer/VBoxContainer/name.set_text(piece_name);
	if money_loss > 0:
		$BoxContainer/CenterContainer/VBoxContainer/effect.set_text(format_money(-money_loss));
	else:
		$BoxContainer/CenterContainer/VBoxContainer/effect.set_text("+%d research" % research_gain);
	cursorpiece = get_tree().root.get_child(0).get_node("cursor_piece")

func _on_mouse_entered():
	mouseover = true

func _on_mouse_exited():
	mouseover = false

func _on_gui_input(event):
	if event is InputEventMouseButton \
		and event.button_index == MOUSE_BUTTON_LEFT \
		and event.is_pressed() \
		and mouseover:
		if cursorpiece.has_cursor():
			cursorpiece.clear_cursor()
		cursorpiece.start_cursor($BoxContainer/CenterContainer2/piece)

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
