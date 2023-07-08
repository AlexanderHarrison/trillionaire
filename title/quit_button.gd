extends Button

var icon_n = preload("res://textures/quit_text.png")
#var icon_h = preload("res://textures/quit_text_highlighted.png")
var icon_h = preload("res://textures/quit_text.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	self.icon = icon_n
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	get_tree().quit()


func _on_mouse_entered():
	icon = icon_h


func _on_mouse_exited():
	icon = icon_n
