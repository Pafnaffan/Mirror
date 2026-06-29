extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


class AxisId:
	var id: int
	func combine(rhs) -> AxisId:
		var res: AxisId = AxisId.new()
		res.id = id | rhs.id
		return res


func axis_num_to_id(axis_num: int) -> AxisId:
	var axis_id: AxisId = AxisId.new()
	axis_id.id = 1 << axis_num
	return axis_id


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
			
				
	if Input.is_action_just_pressed("flip_vertical"):
		WorldManager.flip(axis_num_to_id(0))
		
	if Input.is_action_just_pressed("flip_horizontal"):
		WorldManager.flip(axis_num_to_id(1))
		
	if Input.is_action_just_pressed("flip_diagonal"):
		WorldManager.flip(axis_num_to_id(0).combine(axis_num_to_id(1)))
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
