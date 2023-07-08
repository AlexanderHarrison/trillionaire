extends ScrollContainer

@export var research_needed: Array[int]
@export var objects: Array[Resource]

func _ready():
	check_research(0)

func check_research(new_research):
	for child in $VBoxContainer.get_children():
		if child.name.begins_with("piece"):
			if child.research_level > new_research:
				child.visible = false
			else:
				child.visible = true
