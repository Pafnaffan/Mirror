extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(onyxia_leaving)

func onyxia_leaving(body: Node) -> void:
	if body.is_in_group("player"):
		LevelManager.complete_level()
