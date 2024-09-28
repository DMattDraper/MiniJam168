extends Node

var hud: HUD

func get_hud():
	hud = get_tree().get_first_node_in_group("hud")

func update_interact_text(text: String):
	if !is_instance_valid(hud):
		return
	hud.update_interact_text(text)
