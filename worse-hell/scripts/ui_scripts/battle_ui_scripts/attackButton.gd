class_name AttackButton extends Button
@export var attack: String

func _ready() -> void:
	pressed.connect(_button_pressed)


func _button_pressed():
	EnemyStats.enemyOneStats["Health"]-= PartyStats.mainCharacterAttacks[attack]
	print(EnemyStats.enemyOneStats["Health"])
	BattleFuncs._enemy_turn();
	BattleFuncs._is_dead();
			
