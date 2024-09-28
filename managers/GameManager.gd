extends Node

var sight_color: Sight.COLORS = Sight.COLORS.NONE

func update_sight_color(color: Sight.COLORS):
	var orbs = get_tree().get_nodes_in_group("orb")
	for orb: Orb in orbs:
		orb.deactivate()
	
	sight_color = color
	var player: Player = get_tree().get_first_node_in_group("player")
	player.activate_sight(color)
	
	var colored_objects = get_tree().get_nodes_in_group("colored")
	for obj: MultiColorObject in colored_objects:
		obj.update_sprite(color)
