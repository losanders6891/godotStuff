extends Button

@export var flag: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_button_pressed) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _button_pressed():
	flag.visible = !flag.visible
	
