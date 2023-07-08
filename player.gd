extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	self.money = 100000000000000  # Encoded as cents
	self.assets = []
	self.portfolio = []
	self.company_expenses = 50000
	self.company_earnings = 60000


#Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func get_profit() -> int:
	return self.company_earnings - self.company_expenses
