extends StaticBody2D

@export var select_axis: Array[int] = []
@export var select_axis_states: Array[bool] = []

var world_mask: WorldManager.WorldsSet = WorldManager.WorldsSet.from_axis_lists(select_axis, select_axis_states)

func _ready() -> void:
	add_to_group("platforms")
	WorldManager.world_changed.connect(update_state)
	update_state(WorldManager.current_world)

func update_state(new_world: WorldManager.WorldId):
	set_active(world_mask.matches(new_world))

func set_active(is_active: bool) -> void:
	visible = is_active
	$CollisionShape2D.disabled = not is_active
