extends Sprite2D

var fade = 0.5;
var timer = 0
var played = false
var repeat = false
var repeat_timer = 0
var repeat_delay = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func start():
	visible = true

func start_repeating():
	repeat = true
	start()
	
func _process(delta):
	if visible:
		timer += delta
		if timer > fade:
			timer = fade
			
		if timer > fade / 2:
			if not played:
				$beat.play()
				played = true
			
			if repeat and played:
				repeat_timer += delta
			
				if repeat_timer > repeat_delay:
					$beat.play()
					repeat_timer = 0
		modulate = Color(1.0, 1.0, 1.0, timer * 0.9 / fade)
		
		
		#color("font_color", Color.WHITE * timer / fade)
