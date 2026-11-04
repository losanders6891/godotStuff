extends Button

@export var invgui: ScrollContainer

func _ready() -> void:
	pressed.connect(_button_pressed)
	
func _button_pressed():
	invgui.visible = !invgui.visible
