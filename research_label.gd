extends Label

var required_loss
var piece_list
var cur_money = 1000000000000


func _ready():
	piece_list = get_parent().get_parent().get_node("piece_list")
	check_loss(cur_money)
	
func _process(_delta):
	if required_loss < 1000000000000:
		text = "%s more to lose before next idea." % format_money(required_loss)
	else:
		text = "All ideas found!"
		
	#text = "%d research days for new money loss techniques" % research_left

func check_loss(money):
	cur_money = money
	required_loss = piece_list.next_piece_loss(cur_money)

func add_research(_res):
	pass
	#research += res
	#get_parent().get_parent().get_node("piece_list").check_research(research)
	
func format_money(m):
	var segments = []
	while m > 0:
		segments.append(m % 1000)
		m = floori(m / 1000)
	
	segments.reverse()
	
	if segments.size() == 0:
		return "$0"
	else:
		var txt = "$%s" % segments[0]
		for i in segments.size()-1:
			var seg = segments[i+1]
			txt = "%s,%0*d" % [txt, 3, seg]
		return txt
