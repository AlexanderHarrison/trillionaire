extends Node2D

var fg
var bg
var cur

var showing
var timer = 0
var anim_time = 0.5
var show_time = 1.0

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
	showing = true

func _process(delta):
	if showing:
		timer += delta
	
		var t = min(timer, anim_time) / anim_time
		var t2 = min(timer, show_time*0.85) / (show_time*0.85)
		t = 0.5 + cos(3.14159 * t)/2.0
		var alpha = 1 - pow(2*t2-1, 6)
		fg.position = offset * t
		bg.position = -offset * t
		fg.scale = Vector2(0.6, 0.6) - Vector2(0.05, 0.05) * (1-t)
		bg.scale = Vector2(1.0, 1.0) + Vector2(0.05, 0.05) * (1-t)
		fg.modulate.a = alpha
		bg.modulate.a = alpha
		
		if timer > show_time:
			clear()

func clear():
	if cur != null:
		cur.visible = false
	timer = 0
	showing = false
	for child in get_children():
		child.visible = false
