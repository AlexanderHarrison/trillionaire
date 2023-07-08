extends Container

@export var piece_name: String;
@export var arr: Array[bool];
@export var width: int;
@export var color: Color;
@export var money_loss: int;

var mouseover = false;
var cursorpiece

# Called when the node enters the scene tree for the first time.
func _ready():
	$BoxContainer/piece.update_arr(arr, width, color, money_loss)
	$CenterContainer/RichTextLabel.set_text(piece_name);
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
		cursorpiece.start_cursor($BoxContainer/piece)
