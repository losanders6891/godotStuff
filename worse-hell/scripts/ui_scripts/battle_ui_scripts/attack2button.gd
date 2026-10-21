extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_button_pressed)


func _button_pressed():
	EnemyStats.enemyOneStats["Health"]-= PartyStats.mainCharacterAttacks["two"]
	print(EnemyStats.enemyOneStats["Health"])
	if EnemyStats.enemyOneStats["Health"] <= 0 :
		print("enemy died")
		BattleGlobals.win()
	else:
		PartyStats.mainCharacterStats["Health"] -= EnemyStats.enemyOneStats["Damage"]
		if PartyStats.mainCharacterStats["Health"] <= 0:
			print("player died")
			BattleGlobals.lose()
