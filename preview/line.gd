extends Label

var fade = 0.5;
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func start():
	visible = true
	
func _process(delta):
	if visible:
		timer += delta
		if timer > fade:
			timer = fade
		add_theme_color_override("font_color", Color.WHITE * timer / fade)
