extends Area2D




func _on_body_entered(body: playerController) -> void:
	get_tree().change_scene_to_file("res://scenes/levels/GrantHighHallowedHalls.tscn")


func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
