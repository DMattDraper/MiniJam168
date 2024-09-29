class_name FalseWall extends MeshInstance3D

const FALSE_WALL = preload("res://world/environment/false_wall.tres")
@onready var invisible_wall: MeshInstance3D = $InvisibleWall

func _ready() -> void:
	invisible_wall.set_surface_override_material(0, null)

func update(color: Sight.COLORS):
	invisible_wall.set_surface_override_material(0, null)
	if color == Sight.COLORS.BLUE:
		invisible_wall.set_surface_override_material(0, FALSE_WALL)
