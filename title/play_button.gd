extends Button

var icon_n = preload("res://textures/play_text.png")
var icon_h = preload("res://textures/play_text_highlighted.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	icon = icon_n
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	get_tree().change_scene_to_file("res://root.tscn")

func _on_mouse_entered():
	icon = icon_h


func _on_mouse_exited():
	icon = icon_n
