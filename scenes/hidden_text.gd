class_name HiddenText extends Label3D

@export var color: Sight.COLORS

func _ready():
	add_to_group("hidden_text")
	hide()

func update(_color: Sight.COLORS):
	hide()
	if _color == color:
		show()
	
