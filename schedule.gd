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

var data = [
	[null, null, null, null, null], 
	[null, null, null, null, null], 
	[null, null, null, null, null], 
	[null, null, null, null, null], 
	[null, null, null, null, null],
	[null, null, null, null, null]
]

var pieces = [
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

var date
var money
var research
var anim

func _ready():
	var root = get_tree().root.get_child(0)
	date = root.get_node("date")
	money = root.get_node("money")
	anim = root.get_node("anim")
	date.call_on_date_update(self)
	cursorpiece = root.get_node("cursor_piece")
	research = root.get_node("piece_list/VBoxContainer/research_label")

func update_date(newdate, _month, _year):
	var x = newdate % 5
	var y = floori(newdate as float / 5)
	for row in hour_nodes:
		for n in row:
			n.clear_highlight()
	
	hour_nodes[y][x].highlight()
	if calendar[y][x]:
		var loss = data[y][x][0]
		money.remove_money(loss)
		research.check_loss(money.money)
		anim.start_anim(data[y][x][1])
	

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
		#cursorpiece.clear_cursor()
		
func box_click_r(idx):
	var x = idx % width
	var y = floori(idx as float / width)
	if calendar[y][x]:
		$pickup_player.play()
		var piece = pieces[y][x]
		for cy in height:
			for cx in width:
				if pieces[cy][cx] == piece:
					calendar[cy][cx] = false
					var node = hour_nodes[cy][cx]
					node.clear()
	#cursorpiece.clear_cursor()

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
	color.a = 1.0
	var here_x: int = idx % 5
	var here_y: int = floori(idx / 5)
	
	var p_height = arrangement.size()
	var p_width = arrangement[0].size()
	
	arrangements.append(arrangement)
	print(piece.idx)
	for y in p_height:
		for x in p_width:
			if arrangement[y][x]:
				$click_player.play()
				calendar[here_y+y][here_x+x] = true
				pieces[here_y+y][here_x+x] = piece_idx
				data[here_y+y][here_x+x] = [piece.money_loss, piece.idx]
				var node = hour_nodes[here_y+y][here_x+x]
			
				var g_d = y < p_height-1 and arrangement[y+1][x]
				var g_r = x < p_width-1 and arrangement[y][x+1]
				
				node.set_full(color, [g_d, g_r])
	piece_idx += 1
