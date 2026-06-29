extends TileMapLayer

@export var containing_worlds: Array[int] = [0]

func _ready() -> void:
	WorldManager.world_changed.connect(update_state)
	update_state(WorldManager.current_world)


func update_state(new_world: int):
	print("Transition to world ", new_world)
	set_active(new_world in containing_worlds)

func set_active(is_active: bool) -> void:
	visible = is_active
	collision_enabled = is_active
