extends GridContainer

const msg = [
	"African wells built",
	"donations to homeless shelters",
	"childrens' educations payed for",
	"bridges built over troubled water",
	"World Dart Cup sponsorships",
	"waiters tipped",
	"Nigerian princes helped",
	"sports teams bought",
	"neurosurguries performed",
	"treasures buried",
	"Dogecoin hodled",
	"yacht fleets bought",
	"pyramids built",
	"Batmans",
	"black market organs bought",
	"pizzas delivered to all New Yorkers",
	"dinosaurs reconstructed",
	"golden rockets lauched",
	"planets terraformed",
	"social media companies acquired",
]

var started = false
var timer = 0
var n = 0

func start():
	started = true
	
func _process(delta):
	if started:
		timer += delta
		
		if timer > 0.2 and n < 20:
			timer -= 0.2
			var child = get_child(n)
			child.text = "%d %s" % [Stats.calls[n], msg[n]]
			child.start()
			n += 1
