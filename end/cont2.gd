extends VBoxContainer

var delay = 5

var timer = 4;

var state = 0

const days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
const months = [
	"January", "February", "March", "April", "May", "June", 
	"July", "August", "September", "October", "November", "December"
]

func _ready():
	$line2.text = "You have done it! On %s, %s %d, %d, you have become the world's first ethical trillionaire." \
		% [days[(Stats.g_date) % 5], months[Stats.g_month], Stats.g_date+1, Stats.g_year]

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
			$heart.start_repeating()
		5:
			$line4.start()
		6:
			$stats.start()
		8:
			pass
			#get_tree().change_scene_to_file("res://title/title_menu.tscn")


func _on_control_gui_input(event):
	if event is InputEventMouseButton \
		and event.button_index == MOUSE_BUTTON_LEFT \
		and event.is_pressed():
		timer += 10;
		$click.play()
		if state > 6:
			get_tree().change_scene_to_file("res://title/title_menu.tscn")
