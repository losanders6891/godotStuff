extends HFlowContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in PartyStats.playerInventory:
		var item = Button.new();
		item.custom_maximum_size = Vector2(150, 100)
		item.text = i["name"]
		add_child(item);
		item.owner = get_tree().edited_scene_root;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
