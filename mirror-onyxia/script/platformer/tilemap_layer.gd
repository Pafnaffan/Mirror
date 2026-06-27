extends TileMapLayer

enum WorldState {
	ORIGINAL = 1,
	VERTICAL = 2,
	HORIZONTAL = 4,
	DIAGONAL = 8,
}

@export var world_mask: WorldState = WorldState.ORIGINAL

func _ready() -> void:
	WorldManager.world_changed.connect(update_state)
	update_state(WorldManager.current_world)


func update_state(new_world: int):
	match world_mask:
		WorldState.ORIGINAL : set_active(new_world == 0b00)
		WorldState.VERTICAL : set_active(new_world == 0b01)
		WorldState.HORIZONTAL : set_active(new_world == 0b10)
		WorldState.DIAGONAL : set_active(new_world == 0b11)

func set_active(is_active: bool) -> void:
	visible = is_active
	collision_enabled = is_active
