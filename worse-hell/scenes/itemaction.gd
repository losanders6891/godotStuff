extends Button

const invgui = preload("res://scenes/U.I-Scenes/InventoryUI.tscn")

func _ready() -> void:
	pressed.connect(_button_pressed)
	
func _button_pressed():
	var inventorygui = invgui.instantiate()
	
	
	
