extends Control

@onready var buttons = [
	$VBoxContainer/HBoxContainer/PLevel1,
	$VBoxContainer/HBoxContainer/PLevel2
]


func _ready() -> void:
	for i in buttons.size():
		var level = i + 1
		buttons[i].disabled = level > LevelManager.levels_unlocked
		buttons[i].pressed.connect(func():
			AudioManager.fade_to_level()
			await get_tree().create_timer(0.5).timeout
			LevelManager.go_to_level(level)
		)
