extends Node

func connect_interactables():
	var interactables = get_tree().get_nodes_in_group("interactables")
	
	for item in interactables:
		if item is Interactable and item.target != "":
			var target = item.target
			for target_item in interactables:
				if target_item is Interactable and target_item.target_name == target:
					item.activated.connect(target_item.activate)
