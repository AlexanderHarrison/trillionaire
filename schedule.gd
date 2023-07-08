extends GridContainer

var cursorpiece

var calendar = [
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false],
];

var width = 5
var height = 6

var arrangements = []
var hour_nodes = [
	[null, null, null, null, null], 
	[null, null, null, null, null], 
	[null, null, null, null, null], 
	[null, null, null, null, null], 
	[null, null, null, null, null],
	[null, null, null, null, null]
]

func _ready():
	cursorpiece = get_tree().root.get_child(0).get_node("cursor_piece")

func add_child_hour(hour):
	var here_x: int = hour.idx % 5
	var here_y: int = floori(hour.idx / 5)
	hour_nodes[here_y][here_x] = hour

func box_click(idx):
	if cursorpiece.has_cursor():
		var piece = cursorpiece.get_piece()
		if valid_arrangement(idx, piece.arrangement()):
			add_arrangement(idx, piece.arrangement())
		else:
			pass
		cursorpiece.clear_cursor()

func valid_arrangement(idx, arrangement):
	var here_x: int = idx % 5
	var here_y: int = floori(idx / 5)
	
	for y in arrangement.size():
		for x in arrangement[0].size():
			if arrangement[y][x]:
				if here_x + x >= width:
					return false
				if here_y + y >= height:
					return false
				if calendar[here_y+y][here_x+x]:
					return false
	return true
			
func add_arrangement(idx, arrangement):
	var here_x: int = idx % 5
	var here_y: int = floori(idx / 5)
	
	arrangements.append(arrangement)
	for y in arrangement.size():
		for x in arrangement[0].size():
			if arrangement[y][x]:
				calendar[here_y+y][here_x+x] = true
				hour_nodes[here_y+y][here_x+x].set_full()
