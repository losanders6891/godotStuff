class_name BattleFuncs extends Node

static func _enemy_turn() -> void:
	BattleGuiManager.attackOptionsVis = false
	BattleGuiManager.battleOptionsVis = false
	BattleGuiManager.invVis = false
	await Engine.get_main_loop().create_timer(1.0).timeout
	PartyStats.mainCharacterStats["Health"] -= EnemyStats.enemyOneStats["Damage"]
	BattleLogue.currentText = "it dealt " + str(EnemyStats.enemyOneStats["Damage"]) + " damage to you."
	BattleGuiManager.battleOptionsVis = true
	
		
static func _is_dead():
	if EnemyStats.enemyOneStats["Health"] <= 0 :
		print("enemy died")
		BattleGlobals.win()
	elif PartyStats.mainCharacterStats["Health"] <= 0:
			print("player died")
			BattleGlobals.lose()
