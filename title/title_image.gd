extends TextureRect

var total_time

# Called when the node enters the scene tree for the first time.
func _ready():
	total_time = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	total_time += delta
	if total_time >= (2 * PI):
		total_time -= (2 * PI)
	self.position.y = sin(total_time) * 15
