extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(onyxia_leaving)

func onyxia_leaving(body: Node) -> void:
	if body.is_in_group("player"):
		AudioManager.play_music(preload("res://sound/onyxia_sound.mp3"), false,100)
		LevelManager.complete_level_puzzle()
