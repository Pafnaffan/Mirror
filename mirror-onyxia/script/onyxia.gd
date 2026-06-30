extends Area2D
class_name Onyxia

var sprite : Node;

var change : bool = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = get_child(1);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_accept") :
		if change :
			scale.y = -scale.y;
	if position.x <= 0 - $CollisionShape2D.shape.size.x :
		AudioManager.play_music(preload("res://sound/petitjoueur.mp3"),false,100);
		get_tree().change_scene_to_file("res://scene/menu.tscn");


func _on_area_entered(area: Area2D) -> void:
	if area is Bloc :
		position.x = area.position.x - area.shape.shape.size.x - 5


func _on_area_2d_area_entered(area: Area2D) -> void:
	change = false


func _on_area_2d_area_exited(area: Area2D) -> void:
	change = true
