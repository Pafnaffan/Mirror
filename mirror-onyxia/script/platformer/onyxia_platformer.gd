extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _ready() -> void:
	add_to_group("player")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
			
				
	if Input.is_action_just_pressed("flip_vertical"):
		WorldManager.flip(WorldManager.Flip.from_axis_flips(
			WorldManager.AxisId.from_axis_num(0),
		))
		
	if Input.is_action_just_pressed("flip_horizontal"):
		WorldManager.flip(WorldManager.Flip.from_axis_flips(
			WorldManager.AxisId.from_axis_num(1),
		))
		
	if Input.is_action_just_pressed("flip_diagonal"):
		WorldManager.flip(WorldManager.Flip.from_axis_flips(
			WorldManager.AxisId.from_axis_num(0),
			WorldManager.AxisId.from_axis_num(1),
		))
		
	if !is_on_floor() :
		$Animation.play("air");
		AudioManager.stop_music();
	elif Input.is_action_just_pressed("ui_right"):
		$Animation.play("walk");
		AudioManager.stop_music();
	elif Input.is_action_just_pressed("ui_left"):
		$Animation.play("walk");
		AudioManager.play_music(preload("res://sound/heehee.mp3"),true,1);
	elif !Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right") :
		$Animation.play("idle");
		AudioManager.stop_music();
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
