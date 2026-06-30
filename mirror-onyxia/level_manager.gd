extends Node

var current_level: int = 1
var levels_survival_unlocked: int = 1
var levels_puzzle_unlocked: int = 1

func complete_level_puzzle() -> void:
	if current_level >= levels_puzzle_unlocked:
		levels_puzzle_unlocked += 1
	get_tree().change_scene_to_file("res://scene/menu.tscn");

func complete_level_survival() -> void:
	if current_level >= levels_survival_unlocked:
		levels_survival_unlocked += 1
	get_tree().change_scene_to_file("res://scene/menu.tscn");
	
func go_to_level_survival(level: int) -> void:
	if level <= levels_survival_unlocked:
		current_level = level
		WorldManager.current_world = WorldManager.WorldId.new()
		get_tree().change_scene_to_file("res://scene/survival/survival_level_" + str(level) + ".tscn")

func go_to_level_puzzle(level: int) -> void:
	if level <= levels_puzzle_unlocked:
		current_level = level
		WorldManager.current_world = WorldManager.WorldId.new()
		get_tree().change_scene_to_file("res://scene/platformer/platformer_level_" + str(level) + ".tscn")

func go_to_menu() -> void:
	get_tree().change_scene_to_file("res://scene/menu.tscn")
