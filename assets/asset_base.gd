extends Node

func init(name: String, desc: String, rng_chance: float):
	self.day = 0
	self.week = 0
	self.name = name
	self.description = desc
	self.random_chance = rng_chance

func daily(player):
	self.day += 1
	
func weekly(player):
	self.week += 1
	
func random(player):
	pass
