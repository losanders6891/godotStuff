class_name BattleFuncs extends Node


static func _enemy_turn() -> void:
	PartyStats.mainCharacterStats["Health"] -= EnemyStats.enemyOneStats["Damage"]
	print("hit you")
	BattleLogue.currentText = "it hit you (test)"
	
static func _is_dead():
	if EnemyStats.enemyOneStats["Health"] <= 0 :
		print("enemy died")
		BattleGlobals.win()
	elif PartyStats.mainCharacterStats["Health"] <= 0:
			print("player died")
			BattleGlobals.lose()
