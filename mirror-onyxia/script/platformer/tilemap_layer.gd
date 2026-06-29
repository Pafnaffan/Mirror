extends TileMapLayer

# Les axes significatifs pour déterminer si on est dans le monde courant
@export var select_axis: Array[int]
# L'état de chaque axe déterminant, spécifiés respecitvement dans select_axis
@export var select_axis_states: Array[bool]
# J'aurais aimé pouvoir faire plus propre, mais les types possibles dans @export
# sont limités...

var containing_worlds: WorldManager.WorldsSet

func _ready() -> void:
	# Si cette assertion claque, c'est qu'il n'y a pas de correspondance entre
	# select_axis et select_axis_states
	assert(select_axis.size() == select_axis_states.size())
	containing_worlds = WorldManager.WorldsSet.all_worlds()
	for i in range(select_axis.size()):
		containing_worlds.take_half(WorldManager.AxisId.from_axis_num(select_axis[i]), select_axis_states[i])
		
	WorldManager.world_changed.connect(update_state)
	update_state(WorldManager.current_world)


func update_state(new_world: WorldManager.WorldId):
	print("Transition to world ", new_world.id)
	set_active(containing_worlds.matches(new_world))

func set_active(is_active: bool) -> void:
	visible = is_active
	collision_enabled = is_active
