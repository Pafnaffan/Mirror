extends Node

signal world_changed(world: int)
var current_world: int = 0b00

func flip(axis):
	current_world ^= axis.id
	emit_signal("world_changed", current_world)
