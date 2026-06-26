extends StaticBody2D

func _ready() -> void:
	add_to_group("platforms")


func set_active(is_active: bool) -> void:
	visible = is_active
	$CollisionShape2D.disabled = not is_active
