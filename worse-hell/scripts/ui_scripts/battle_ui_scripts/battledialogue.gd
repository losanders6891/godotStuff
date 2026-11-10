class_name BattleLogue extends Label

static var currentText;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentText = "You have encountered a " + EnemyStats.enemyOneStats["Name"] + "!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = currentText;
