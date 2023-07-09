extends Node2D

var stay_time = 3
var timer = 0
	
var rng

var direction = Vector2(1.0, 1.0) * 50.0
var speed = 1.0

func _ready():
	global_position += Vector2(400, 150)
	rng = RandomNumberGenerator.new()
	direction = direction.rotated(rng.randfn() / 10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	global_position += direction * speed * delta
	
	if timer > stay_time:
		timer = stay_time
		queue_free()
	
	$label.modulate = Color("#99cc99") * Color(1.0, 1.0, 1.0, 1.0 - timer/stay_time)
