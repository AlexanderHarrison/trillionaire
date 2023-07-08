extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += Vector2(10 * delta, 0.0)
	if global_position.x >= 200:
		global_position.x -= 200
