extends RayCast2D

func _process(_delta: float) -> void:
	force_raycast_update()
	if is_colliding():
		if get_parent().is_alive == true:
			#sets the battle scene stats and then starts the battle. be sure to add any variables to the enemy stats global as well
			EnemyStats.enemyOneStats["Health"]= get_parent().health
			EnemyStats.enemyOneStats["Damage"] = get_parent().damage
			EnemyStats.enemyOneStats["Name"] = get_parent().ename
			get_parent().is_alive = false
			var e = get_parent()
			#finds root node?
			while e.get_parent() != null:
				e = e.get_parent()
			
			#e.propagate_call("set_owner", [e])
			#var packed = PackedScene.new()
			#packed.pack(e)
			BattleGlobals.currentLevel = load(e.get_scene_file_path())
			BattleGlobals.save_scene()
			get_tree().change_scene_to_packed(get_parent().battle_Scene)

			
	if get_parent().is_alive == false:
		get_parent().queue_free()
