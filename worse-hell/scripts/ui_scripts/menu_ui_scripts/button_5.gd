extends Button
@export var scene: PackedScene

func _ready() -> void:
	pressed.connect(_button_pressed)


func _button_pressed():
	get_tree().change_scene_to_packed(scene)
