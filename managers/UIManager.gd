extends Node

var hud: HUD
var pause_menu: Control

func get_hud():
	hud = get_tree().get_first_node_in_group("hud")
	pause_menu = get_tree().get_first_node_in_group("pause_menu")
	
	UIManager.pause_menu.hide()

func update_interact_text(text: String):
	if !is_instance_valid(hud):
		return
	hud.update_interact_text(text)

func update_alert_text(text: String):
	if !is_instance_valid(hud):
		return
	hud.update_alert_text(text)
