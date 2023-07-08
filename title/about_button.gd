extends Button

var icon_h = preload("res://textures/about_text.png")
var icon_n = preload("res://textures/about_text_highlighted.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	$about_text.visible = true

func _on_mouse_entered():
	icon = icon_h

func _on_mouse_exited():
	icon = icon_n
