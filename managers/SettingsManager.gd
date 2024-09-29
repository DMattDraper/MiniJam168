extends Node

var util_data =  {
	"sfx_volume": 50,
	"music_volume": 50
}

func _ready() -> void:
	update_sfx_vol(util_data["sfx_volume"])
	update_music_vol(util_data["music_volume"])

func update_sfx_vol(vol):
	var final_vol = get_db(vol)
	AudioServer.set_bus_volume_db(2, final_vol)
	util_data["sfx_volume"] = vol

func update_music_vol(vol):
	var final_vol = get_db(vol)
	AudioServer.set_bus_volume_db(1, final_vol)
	util_data["music_volume"] = vol

func update_sliders():
	var menu = get_tree().get_first_node_in_group("pause_menu")
	menu.set_sfx_slider(util_data["sfx_volume"])
	menu.set_music_slider(util_data["music_volume"])

func get_db(vol):
	if vol == 0:
		return -60
	
	return -30.0 + 0.3 * vol
