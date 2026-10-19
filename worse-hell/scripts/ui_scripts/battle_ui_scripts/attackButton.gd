extends Button 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_button_pressed)


func _button_pressed():
	
	get_parent().visible = false
	#get_parent().get_children().enabled = false
	get_parent().menu1.visible = true
