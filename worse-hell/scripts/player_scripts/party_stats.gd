extends Node

var damage = 2
var mainCharacterStats = {
	"Level" : 1,
	"Health" : 10,
	"MaxHealth": 10,
}
var mainCharacterAttacks = {
	"one": 2 ,
	"two": 0
}
# target 0 = self, target 1 = enemy
var playerInventory = [
	{
		"name": "the stick",
		"damage": -3,
		"target": 1
	},
	{
		"name": "the stick 2",
		"damage": -4,
		"target": 1
	},
	{
		"name": "potion",
		"damage": 5,
		"target": 0
		
	},
	{
		"name": "the stick 3",
		"damage": -5,
		"target": 1
	}
]
	
#main character stats
