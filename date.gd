extends RichTextLabel

@export var date_change_time: float = 1.0

var date_timer = 0
var date = 0
var year = 2030
var month = 0

var schedule

const months = [
	"January", "February", "March", "April", "May", "June", 
	"July", "August", "September", "October", "November", "December"
]

var date_update_objects = []

func _ready():
	var root = get_tree().root.get_node("/root/root")
	schedule = root.get_node("schedule/schedule")
	text = format_date()

func _process(delta):
	date_timer += delta;
	if date_timer >= date_change_time:
		date_timer = fmod(date_timer, date_change_time)
		date += 1
		if date == 30:
			date = 0
			month += 1
			if month == 12:
				month = 0
				year += 1
				
		text = format_date()
		schedule.update_date(date, month, year)

func call_on_date_update(obj):
	date_update_objects.append(obj)

func format_date():
	return "%s %d, %d" % [months[month], date+1, year]
