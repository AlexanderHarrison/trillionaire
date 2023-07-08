extends RichTextLabel

@export var date_change_time: float = 1.0

var date_timer = 0
var date = 0
var year = 2030
var month = 0

const months = [
	"January", "February", "March", "April", "May", "June", 
	"July", "August", "September", "October", "November", "December"
]

func _ready():
	text = format_date()

func _process(delta):
	date_timer += delta;
	if date_timer >= date_change_time:
		date_timer = fmod(date_timer, date_change_time)
		date += 1	
		if date == 30:
			date == 0
			month += 1
			if month == 12:
				month = 0
				year += 1
				
		text = format_date()

func format_date():
	return "%s %d, %d" % [months[month], date+1, year]
