extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_button_pressed) # Replace with function body.

func _button_pressed():
	get_parent().get_parent().visible = false
	get_tree().paused = false
	
