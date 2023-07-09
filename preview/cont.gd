extends VBoxContainer

var delay = 5

var timer = 4;

var state = 0

func _process(delta):
	timer += delta
	if timer > delay:
		timer = 0
		next()

func next():
	state += 1
	match state:
		1:
			$line1.start()
		2:
			$line2.start()
		3:
			$line3.start()
		4: 
			$heart.start()
			timer += 4
		5:
			$line4.start()
		6:
			$line5.start()
		7:
			$line6.start()
		8:
			$line7.start()
		9:
			get_tree().change_scene_to_file("res://root.tscn")


func _on_control_gui_input(event):
	if event is InputEventMouseButton \
		and event.button_index == MOUSE_BUTTON_LEFT \
		and event.is_pressed():
		timer += 10;
		$click.play()
