extends Button


func _ready() -> void:
	pressed.connect(_button_pressed)


func _button_pressed():
	EnemyStats.enemyOneStats["Health"]-= PartyStats.mainCharacterAttacks["one"]
	print(EnemyStats.enemyOneStats["Health"])
	if EnemyStats.enemyOneStats["Health"] == 0 :
		print("enemy died")
		
