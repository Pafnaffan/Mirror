extends Control

@onready var buttons = [
	$VBoxContainer/HBoxContainer/PLevel1,
	$VBoxContainer/HBoxContainer/PLevel2
]


func _ready() -> void:
	for i in buttons.size():
		var level = i + 1
		buttons[i].disabled = level > LevelManager.levels_unlocked
		buttons[i].pressed.connect(func(): LevelManager.go_to_level(level))
