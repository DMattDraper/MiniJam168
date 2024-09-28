class_name MultiColorObject extends MeshInstance3D

var material: StandardMaterial3D
@export var red_sprite: Texture
@export var green_sprite: Texture
@export var blue_sprite: Texture

func _ready() -> void:
	material = get_active_material(0)

func update_sprite(color: Sight.COLORS):
	material.emission_texture = null
	
	match color:
		Sight.COLORS.RED:
			if red_sprite != null:
				material.emission_texture = red_sprite
		Sight.COLORS.GREEN:
			if green_sprite != null:
				material.emission_texture = green_sprite
		Sight.COLORS.BLUE:
			if blue_sprite != null:
				material.emission_texture = blue_sprite
