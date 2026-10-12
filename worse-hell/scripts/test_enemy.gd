class_name enemy extends CharacterBody2D

@onready var sight: RayCast2D = $Sight #if broken, try just retyping before anything else

##if you can't figure out what this is asking for, then just ask me.
@export var battle_Scene:PackedScene


func _process(_delta: float) -> void:
	#appeasing the machine god
	sight.force_raycast_update()
	if sight.is_colliding():
		print("collision detected")
		get_tree().change_scene_to_packed(battle_Scene)
	
