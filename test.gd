extends Node

#const popup_scene = preload("res://popup_dialog.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	#var popup = popup_scene.instantiate()
	#popup.init("test string")
	#add_child(popup)
	$popup_dialog.init("test string")
	pass
