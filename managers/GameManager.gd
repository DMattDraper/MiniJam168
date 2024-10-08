extends Node

var sight_color: Sight.COLORS = Sight.COLORS.NONE

var default_time_scale := 1.0
var paused := false

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
	
	var hidden_text = get_tree().get_nodes_in_group("hidden_text")
	for text: HiddenText in hidden_text:
		text.update(color)
	
	var false_walls = get_tree().get_nodes_in_group("false_walls")
	for wall: FalseWall in false_walls:
		wall.update(color)

func reset():
	Engine.time_scale = default_time_scale
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	update_sight_color(Sight.COLORS.NONE)

func handle_pause():
	if paused:
		unpause()
	else:
		pause()

func pause():
	Engine.time_scale = 0.0
	paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	UIManager.pause_menu.show()

func unpause():
	Engine.time_scale = default_time_scale
	paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	UIManager.pause_menu.hide()

func quit():
	get_tree().quit()

func restart():
	get_tree().call_group("instanced", "queue_free")
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func end_game():
	get_tree().call_group("instanced", "queue_free")
	Engine.time_scale = default_time_scale
	paused = false
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().change_scene_to_file("res://scenes/end_game.tscn")

func fullscreen():
	var fs = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
	if fs:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
