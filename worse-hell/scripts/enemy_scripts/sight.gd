extends RayCast2D

func _process(_delta: float) -> void:
	force_raycast_update()
	if is_colliding():
		print("collision detected")
		#sets the battle scene stats and then starts the battle. be sure to add any variables to the enemy stats global as well
		EnemyStats.health = get_parent().health
		EnemyStats.damage = get_parent().damage
		get_tree().change_scene_to_packed(get_parent().battle_Scene)
