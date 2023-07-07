extends Node

const popup_scene = preload("res://popup_dialog.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var popup = popup_scene.instantiate()
	popup.new("test string")
	add_child(popup)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
