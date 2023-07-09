extends Node2D

var fg
var bg
var lbl
var lbl_pos
var cur

var showing
var timer = 0
var anim_time = 0.5
var show_time = 0.85

var offset = Vector2(20, 20)

func _ready():
	clear()

func start_anim(idx):
	print(idx)
	clear()
	cur = get_child(idx)
	cur.visible = true
	fg = cur.get_node("fg")
	bg = cur.get_node("bg")
	lbl = cur.get_node("lbl")
	lbl_pos = lbl.position
	showing = true

func _process(delta):
	if showing:
		timer += delta
	
		var t = min(timer, anim_time) / anim_time
		var t2 = min(timer, show_time) / show_time
		t = 0.5 + cos(3.14159 * t)/2.0
		var alpha = 1 - pow(2*t2-1, 6)
		fg.position = offset * t
		bg.position = -offset * t
		fg.scale = Vector2(0.6, 0.6) - Vector2(0.05, 0.05) * (1-t)
		bg.scale = Vector2(1.0, 1.0) + Vector2(0.05, 0.05) * (1-t)
		fg.modulate.a = alpha
		bg.modulate.a = alpha
		lbl.modulate.a = alpha
		lbl.position = lbl_pos + Vector2(0.0, 10*t)
		
		if timer > show_time:
			clear()

func clear():
	if cur != null:
		lbl.position = lbl_pos
		cur.visible = false
	timer = 0
	showing = false
	for child in get_children():
		child.visible = false
