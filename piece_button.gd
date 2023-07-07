extends Container

@export var piece_name: String

# Called when the node enters the scene tree for the first time.
func _ready():
	$ConterContainer.$RichTextLabel.set_text(piece_name);
