extends RichTextLabel

var research: int = 0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#text = "%d research days for new money loss techniques" % research_left
	text = "%d days of money loss research" % research

func add_research(res):
	research += res
	get_parent().get_parent().check_research(research)
