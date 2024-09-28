class_name Interactor extends Node3D

@onready var player: CharacterBody3D = $"../.."
@onready var interact_ray: RayCast3D = $InteractRay

var interact_text := ""

func _ready() -> void:
	interact_ray.add_exception(player)

func _physics_process(delta: float) -> void:
	if interact_ray.is_colliding():
		var target = interact_ray.get_collider()
		
		if is_instance_valid(target) and target is Interactable:
			update_text(target.message)
		else:
			update_text("")
	else:
		update_text("")

func interact():
	if !interact_ray.is_colliding():
		return
	var target = interact_ray.get_collider()
	if is_instance_valid(target) and target is Interactable:
		target.interact()

func update_text(text: String):
	if text == interact_text:
		return
	UIManager.update_interact_text(text)
	interact_text = text
