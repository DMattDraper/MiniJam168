class_name Player extends CharacterBody3D

@onready var head: Node3D = $Head
@onready var character_mover: CharacterMover = $CharacterMover

@export var mouse_sensitivity_h = 0.15
@export var mouse_sensitivity_v = 0.15

@onready var interaction_manager: Interactor = %InteractionManager

@onready var red_sight: ColorRect = %RedSight
@onready var green_sight: ColorRect = %GreenSight
@onready var blue_sight: ColorRect = %BlueSight

var def_head_pos : Vector3

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	def_head_pos = head.position

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity_h
		head.rotation_degrees.x -= event.relative.y * mouse_sensitivity_v
		head.rotation_degrees.x = clamp(head.rotation_degrees.x, -90, 90)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("restart"):
		get_tree().call_group("instanced", "queue_free")
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("fullscreen"):
		var fs = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
		if fs:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var move_dir = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if Input.is_action_just_pressed("interact"):
		interaction_manager.interact()
	
	character_mover.set_move_dir(move_dir)

func _physics_process(delta: float) -> void:
	head_bob(velocity.length(), delta)

func head_bob(vel: float, delta: float):
	if head:
		if vel > 1:
			var bob_amount : float = 0.05
			var bob_freq : float = 0.01
			head.position.y = lerp(head.position.y, def_head_pos.y + sin(Time.get_ticks_msec() * bob_freq * 0.5) * bob_amount, 10 * delta)
		else:
			head.position.y = lerp(head.position.y, def_head_pos.y, 10 * delta)

func activate_sight(color: Sight.COLORS):
	for child in %Camera3D.get_children():
		child.hide()
	
	match color:
		Sight.COLORS.RED:
			red_sight.show()
		Sight.COLORS.GREEN:
			green_sight.show()
		Sight.COLORS.BLUE:
			blue_sight.show()
	
