extends Node

var current_level: int = 1
var levels_unlocked: int = 1

func complete_level() -> void:
	if current_level >= levels_unlocked:
		levels_unlocked += 1
	WorldManager.current_world = 0b00
	go_to_next_level()
	
func go_to_next_level() -> void:
	current_level += 1
	get_tree().change_scene_to_file("res://scene/platformer/platformer_level_" + str(current_level) + ".tscn")
	
func go_to_level(level: int) -> void:
	if level <= levels_unlocked:
		current_level = level
		WorldManager.current_world = 0b00
		get_tree().change_scene_to_file("res://scene/platformer/platformer_level_" + str(level) + ".tscn")

func go_to_menu() -> void:
	get_tree().change_scene_to_file("res://scene/menu.tscn")
