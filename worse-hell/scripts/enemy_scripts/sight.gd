extends RayCast2D

func _process(_delta: float) -> void:
	force_raycast_update()
	if is_colliding():
		if get_parent().is_alive:
			#sets the battle scene stats and then starts the battle. be sure to add any variables to the enemy stats global as well
			EnemyStats.enemyOneStats["Health"]= get_parent().health
			EnemyStats.enemyOneStats["Damage"] = get_parent().damage
			EnemyStats.enemyOneStats["Name"] = get_parent().ename
			get_parent().is_alive = false
			BattleGlobals.save_scene()
			#get_parent().get_parent().propagate_call("set_owner", [get_parent().get_parent()])
			#BattleGlobals.currentLevel = 
			get_tree().change_scene_to_packed(get_parent().battle_Scene)

			
	if get_parent().is_alive == false:
		get_parent().queue_free()
