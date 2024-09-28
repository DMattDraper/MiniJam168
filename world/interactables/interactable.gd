class_name Interactable extends Area3D

@export var target := ""
@export var target_name := ""
@export var wait_time := 0.0
@export var message := "Press E to Interact"
@export var locked := false
@export var deactivating := false

@export var animation_player: AnimationPlayer

signal activated

func interact(data: InteractionData):
	if locked:
		return
	if wait_time > 0.0:
		await get_tree().create_timer(wait_time).timeout
		activate(data)
	else:
		activate(data)

func activate(data: InteractionData):
	activated.emit(data)

func set_lock(_locked: bool):
	locked = _locked
