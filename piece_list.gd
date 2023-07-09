extends ScrollContainer

@export var research_needed: Array[int]
@export var objects: Array[Resource]

func _ready():
	next_piece_loss(1000000000000)

func check_research(_a):
	pass
	
func next_piece_loss(money):
	var loss = 1000000000000 - money
	var min_loss = 1000000000000
	for child in $VBoxContainer.get_children():
		if child.name.begins_with("piece"):
			if child.required_loss > loss:
				child.visible = false
				if child.required_loss - loss < min_loss:
					min_loss = child.required_loss - loss
			else:
				child.visible = true
	return min_loss
