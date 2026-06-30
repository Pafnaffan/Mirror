extends Control

@onready var buttonsP = [
	$b_puzzle_1,
	$b_puzzle_2,
	$b_puzzle_3
]

@onready var buttonsS = [
	$b_survival_1,
	$b_survival_2,
	$b_survival_3
]

func _ready() -> void:
	for i in buttonsP.size():
		var level = i + 1
		buttonsP[i].disabled = level > LevelManager.levels_puzzle_unlocked
		buttonsP[i].pressed.connect(func(): 
			AudioManager.fade_to_level()
			await get_tree().create_timer(0.5).timeout
			LevelManager.go_to_level_puzzle(level))
	for i in buttonsS.size():
		var level = i + 1
		buttonsS[i].disabled = level > LevelManager.levels_survival_unlocked
		buttonsS[i].pressed.connect(func(): LevelManager.go_to_level_survival(level))
