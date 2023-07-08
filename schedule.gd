extends GridContainer

var cursorpiece

var piece_idx = 1

var calendar = [
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false],
	[false, false, false, false, false],
];

var pieces = [
	#[null, null, null, null, null], 
	#[null, null, null, null, null], 
	#[null, null, null, null, null], 
	#[null, null, null, null, null], 
	#[null, null, null, null, null],
	#[null, null, null, null, null]
	
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0],
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
			add_arrangement(idx, piece)
		else:
			pass
		cursorpiece.clear_cursor()
		
func box_click_r(idx):
	var x = idx % width
	var y = floori(idx as float / width)
	if calendar[y][x]:
		var piece = pieces[y][x]
		for cy in height:
			for cx in width:
				if pieces[cy][cx] == piece:
					calendar[cy][cx] = false
					var node = hour_nodes[cy][cx]
					node.clear()
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
			
func add_arrangement(idx, piece):
	var arrangement = piece.arrangement()
	var color = piece.color
	var here_x: int = idx % 5
	var here_y: int = floori(idx / 5)
	
	var new_arr_idx = arrangements.size()
	arrangements.append(arrangement)
	for y in arrangement.size():
		for x in arrangement[0].size():
			if arrangement[y][x]:
				calendar[here_y+y][here_x+x] = true
				pieces[here_y+y][here_x+x] = piece_idx
				var node = hour_nodes[here_y+y][here_x+x]
				node.set_full(color)
	piece_idx += 1
