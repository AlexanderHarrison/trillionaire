extends Button

var icon_n = preload("res://textures/play_text.png")
var icon_h = preload("res://textures/play_text_highlighted.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	get_tree().change_scene_to_file("res://preview/preview.tscn")


func _on_mouse_entered():
	$click.play()
	icon = icon_n
	get_parent().get_node("MarginContainer").visible = true

func _on_mouse_exited():
	icon = icon_h
	get_parent().get_node("MarginContainer").visible = false
