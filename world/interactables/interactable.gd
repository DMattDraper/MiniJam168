class_name Interactable extends Area3D

@export var target := ""
@export var target_name := ""
@export var wait_time := 0.0
@export var message := "Press E to Interact"
@export var locked := false
@export var deactivating := false

@export var animation_player: AnimationPlayer

signal activated

func interact():
	if locked:
		return
	if wait_time > 0.0:
		await get_tree().create_timer(wait_time).timeout
		activate()
	else:
		activate()

func activate():
	activated.emit()

func set_lock(_locked: bool):
	locked = _locked
