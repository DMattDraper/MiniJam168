class_name AreaTrigger extends Interactable

func _on_body_entered(_body: Node3D) -> void:
	activate(InteractionData.new())
