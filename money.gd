extends RichTextLabel

@export var money: int;

var money_icon = preload("res://money_loss_anim.tscn")
var quit_next = false

func remove_money(loss):
	if quit_next:
		get_tree().change_scene_to_file("res://end/end.tscn")
		
	var prev = money
	money -= loss
	if money < 0:
		money = 0
		quit_next = true
		return
	text = format_money(money)
	var icon = money_icon.instantiate()
	icon.get_node("label").text = format_money(-loss)
	get_parent().add_child(icon)

func format_money(m):
	var txt
	if m < 0:
		txt = "-$"
		m = -m
	else:
		txt = "$"
		
	var segments = []
	while m > 0:
		segments.append(m % 1000)
		m = floori(m / 1000)
	
	segments.reverse()
	
	if segments.size() == 0:
		return "$0"
	else:
		txt = "%s%s" % [txt, segments[0]]
		for i in segments.size()-1:
			var seg = segments[i+1]
			txt = "%s,%0*d" % [txt, 3, seg]
		return txt
		
