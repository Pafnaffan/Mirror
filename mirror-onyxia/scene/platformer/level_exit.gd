extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(onyxia_leaving)

func onyxia_leaving(body: Node) -> void:
	if body.is_in_group("player"):
		if LevelManager.current_level != 2:
			LevelManager.complete_level()
		if LevelManager.current_level == 2 and WorldManager.current_world.id == 3:
			LevelManager.complete_level()
		
