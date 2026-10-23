extends Button

var properties

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_button_pressed)


func _button_pressed():
	print(properties["damage"])
	if properties["target"] == 0:
		PartyStats.mainCharacterStats["Health"] += properties["damage"]
	elif properties["target"] == 1:
		EnemyStats.enemyOneStats["Health"] += properties["damage"]
	queue_free()
