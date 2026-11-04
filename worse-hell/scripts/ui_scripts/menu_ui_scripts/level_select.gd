extends Button

@export var menu: CenterContainer
@export var levelselect: CenterContainer

func _ready() -> void:
	pressed.connect(_button_pressed)



func _button_pressed():
	menu.visible = !menu.visible
	levelselect.visible = !levelselect.visible
	
