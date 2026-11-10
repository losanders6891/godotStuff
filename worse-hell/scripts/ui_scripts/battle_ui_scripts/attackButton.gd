class_name AttackButton extends Button
@export var attack: String
@export var option1: GridContainer
@export var option2: GridContainer


func _ready() -> void:
	pressed.connect(_button_pressed)


func _button_pressed():
	option2.visible = false
	EnemyStats.enemyOneStats["Health"]-= PartyStats.mainCharacterAttacks[attack]
	BattleLogue.currentText = "You dealt " + str(PartyStats.mainCharacterAttacks[attack]) + " damage."
	BattleFuncs._is_dead();
	await(BattleFuncs._enemy_turn())
	option1.visible = true
			
