extends StaticBody2D

@export var mirror: NodePath
@export var is_primary: bool = false

func _ready() -> void:
	add_to_group("platforms")
	if not is_primary and has_node(mirror):
		visible = false
		$CollisionShape2D.disabled = true


func set_active(is_active: bool) -> void:
	visible = is_active
	$CollisionShape2D.disabled = not is_active

func flip() -> void:
	var twin = get_node(mirror)
	var curr_state = visible
	set_active(not curr_state)
	twin.set_active(curr_state)
	
