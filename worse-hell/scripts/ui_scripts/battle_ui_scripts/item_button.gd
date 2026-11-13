extends Button

var properties

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_button_pressed)


func _button_pressed():
	print(properties["damage"])
	if properties["target"] == 0:
		PartyStats.mainCharacterStats["Health"] += properties["damage"]
		BattleLogue.currentText = "Your " + properties["name"] + " healed " + str(properties["damage"]) + " HP."
	elif properties["target"] == 1:
		EnemyStats.enemyOneStats["Health"] += properties["damage"]
		BattleLogue.currentText = "Your " + properties["name"] + " dealt " + str(abs(properties["damage"])) + " damage."
	queue_free()
	BattleFuncs._is_dead();
	await(BattleFuncs._enemy_turn())
	BattleFuncs._is_dead();
