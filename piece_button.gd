extends Container

@export var piece_name: String
var mouseover = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/RichTextLabel.set_text(piece_name);

func _on_mouse_entered():
	mouseover = true

func _on_mouse_exited():
	mouseover = false

func _on_gui_input(event):
	if event is InputEventMouseButton \
		and event.button_index == MOUSE_BUTTON_LEFT \
		and event.is_pressed() \
		and mouseover:
		print(piece_name)
