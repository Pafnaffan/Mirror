extends Node

signal world_changed(world: int)
var current_world: WorldId = WorldId.new()

func flip(flip: Flip):
	current_world.flip(flip)
	emit_signal("world_changed", current_world)


class AxisId:
	var num: int

	static func from_axis_num(num: int) -> AxisId:
		var res: AxisId = AxisId.new()
		res.num = num
		return res

	func axis_state(flipped: bool) -> int:
		return int(flipped) << num

	func mask() -> int:
		return 1 << num


func flip_all(...args) -> int:
	print("flip_all(", args, ")")
	var res: int = 0
	for i in args:
		print(i is Array)
		res |= i.axis_state(true)
	return res


class Flip:
	var mask: int

	static func from_axis_flips(...args) -> Flip:
		var res: Flip = Flip.new()
		# callv permet d'utiliser de forward les arguments variadics
		res.mask = WorldManager.flip_all.callv(args)
		return res


class WorldId:
	var id: int
	
	func flip(flip: Flip):
		id ^= flip.mask



class WorldsSet:
	var mask: int
	var worlds: int

	static func all_worlds():
		var res: WorldsSet = WorldsSet.new()
		# Avec un masque de 0 et une valeur significative de 0, on match tous les mondes
		res.mask = 0
		res.worlds = 0
		return res

	func take_half(axis: AxisId, flipped: bool):
		mask |= axis.mask()
		worlds |= axis.axis_state(flipped)
		
	func matches(world: WorldId) -> bool:
		return world.id & mask == worlds
