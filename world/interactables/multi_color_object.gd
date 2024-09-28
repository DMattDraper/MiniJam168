class_name MultiColorObject extends MeshInstance3D

var material: StandardMaterial3D
@export var sprite: Texture
@export var red_sprite: Texture
@export var green_sprite: Texture
@export var blue_sprite: Texture

func _ready() -> void:
	material = get_active_material(0)
	if sprite == null:
		sprite = material.albedo_texture

func update_sprite(color: Sight.COLORS):
	material.albedo_texture = sprite
	
	match color:
		Sight.COLORS.RED:
			if red_sprite != null:
				material.albedo_texture = red_sprite
		Sight.COLORS.GREEN:
			if green_sprite != null:
				material.albedo_texture = green_sprite
		Sight.COLORS.BLUE:
			if blue_sprite != null:
				material.albedo_texture = blue_sprite
