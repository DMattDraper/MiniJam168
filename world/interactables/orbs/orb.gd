class_name Orb extends Interactable

@export var color: Sight.COLORS

var active = false

func activate(data: InteractionData):
	super(data)
	if !active:
		GameManager.update_sight_color(color)
		active = true
	else:
		GameManager.update_sight_color(Sight.COLORS.NONE)
		active = false

func deactivate():
	active = false
