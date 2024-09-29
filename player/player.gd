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
var can_step_sound := true
@onready var sight_ambience: AudioStreamPlayer = $SightAmbience
@onready var sight_activate: AudioStreamPlayer = $SightActivate

func _ready() -> void:
	def_head_pos = head.position

func _input(event: InputEvent) -> void:
	if GameManager.paused:
		return
	
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity_h
		head.rotation_degrees.x -= event.relative.y * mouse_sensitivity_v
		head.rotation_degrees.x = clamp(head.rotation_degrees.x, -90, 90)

func _process(_delta: float) -> void:	
	if Input.is_action_just_pressed("pause"):
		GameManager.handle_pause()
	if Input.is_action_just_pressed("quit"):
		GameManager.quit()
	if Input.is_action_just_pressed("restart"):
		GameManager.restart()
	if Input.is_action_just_pressed("fullscreen"):
		GameManager.fullscreen()

	if GameManager.paused:
		return

	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var move_dir = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if Input.is_action_just_pressed("interact"):
		interaction_manager.interact()
	
	character_mover.set_move_dir(move_dir)

func _physics_process(delta: float) -> void:
	head_bob(velocity.length(), delta)
	
	if velocity.length() > 2.0 and can_step_sound:
		$StepSounds.play()
		can_step_sound = false
		$StepTimer.start()

func head_bob(vel: float, delta: float):
	if head:
		if vel > 1.0:
			var bob_amount : float = 0.10
			var bob_freq : float = 0.01
			head.position.y = lerp(head.position.y, def_head_pos.y + sin(Time.get_ticks_msec() * bob_freq) * bob_amount, 10 * delta)
		else:
			head.position.y = lerp(head.position.y, def_head_pos.y, 10 * delta)

func activate_sight(color: Sight.COLORS):
	for child in %Camera3D.get_children():
		child.hide()
	
	match color:
		Sight.COLORS.RED:
			red_sight.show()
			sight_ambience.play()
			sight_activate.play()
		Sight.COLORS.GREEN:
			green_sight.show()
			sight_ambience.play()
			sight_activate.play()
		Sight.COLORS.BLUE:
			blue_sight.show()
			sight_ambience.play()
			sight_activate.play()
		Sight.COLORS.NONE:
			sight_ambience.stop()

func reset_step_sound():
	can_step_sound = true
