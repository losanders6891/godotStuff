extends Node
var loseScene: PackedScene = preload("res://scenes/levels/testLevel.tscn")
var currentLevel: PackedScene = preload("res://scenes/levels/testLevel.tscn")
var scene_saved = false

func save_scene():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue
		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("save")
		# JSON provides a static method to serialized JSON string.
		var json_string = JSON.stringify(node_data)
		
		# Store the save dictionary as a new line in the save file.
		save_file.store_line(json_string)
	scene_saved = true
	save_file.close()
	
		
func load_scene():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()


	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		# Creates the helper class to interact with JSON.
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object.
		var node_data = json.data
		print(node_data["filename"])
		print(node_data["parent"])
		# Firstly, we need to create the object and add it to the tree and set its position.
		
		var new_object = load(node_data["filename"]).instantiate()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])

		# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])
	save_file.close()

func win():
	PartyStats.mainCharacterStats["Health"] = PartyStats.mainCharacterStats["MaxHealth"]
	get_tree().change_scene_to_packed(BattleGlobals.currentLevel)
	
func lose():
	PartyStats.mainCharacterStats["Health"] = PartyStats.mainCharacterStats["MaxHealth"]
	get_tree().change_scene_to_packed(BattleGlobals.loseScene)
	scene_saved = false

#func _process(delta: float) -> void:
	pass
