class_name Orb extends Interactable

@export var color: Sight.COLORS

var active = false

func activate(data: InteractionData):
	super(data)
	if !active:
		GameManager.update_sight_color(color)
		active = true
		UIManager.update_alert_text("You are granted the power of %s sight!" % Sight.COLORS.find_key(color))
	else:
		GameManager.update_sight_color(Sight.COLORS.NONE)
		UIManager.update_alert_text("Your %s sight has faded." % Sight.COLORS.find_key(color))
		active = false

func deactivate():
	active = false
