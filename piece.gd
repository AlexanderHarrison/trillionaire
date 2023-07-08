extends GridContainer

@export var arr: Array[bool];
@export var width: int;
@export var color: Color;
@export var money_loss: int;

var internal_arr = [];

var hour = preload("res://hour.tscn")
var free_hour = preload("res://blank_hour.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if width > 0:
		update_arr(arr, width, color, money_loss)

func update_arr(new_arr, new_width, new_color, new_money_loss):
	arr = new_arr
	width = new_width
	color = new_color
	money_loss = new_money_loss
	internal_arr = []
	for n in get_children():
		remove_child(n)
		n.queue_free()
	
	columns = width
		
	var height = floor(arr.size() as float / width)
	for y in height:
		internal_arr.append([])
		
	for i in arr.size():
		var y = floori(i as float / width)
		if arr[i]:
			internal_arr[y].append(true)
			var h = hour.instantiate()
			h.mouse_filter = MOUSE_FILTER_PASS
			h.color = color
			add_child(h)
		else:
			internal_arr[y].append(false)
			var h = free_hour.instantiate()
			h.mouse_filter = MOUSE_FILTER_PASS
			add_child(h)

func arrangement():
	return internal_arr
