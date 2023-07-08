extends RichTextLabel

@export var money: int;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = format_text(money)

func remove_money(loss):
	money -= loss
	if money < 0:
		money = 0

func format_text(m):
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
		
