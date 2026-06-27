extends Node

signal world_changed(world: int)
var current_world: int = 0b00

func flip(axis: int):
	current_world ^= axis
	emit_signal("world_changed", current_world)
