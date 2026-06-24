extends Area2D
class_name Onyxia

var sprite : Node;

var change : bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = get_child(1);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up") :
		scale.y = -scale.y;
		change = true;
		$changeTimer.start();
	if position.x == 0 - sprite.texture.get_width() :
		queue_free()
		#Game over


func _on_area_entered(area: Area2D) -> void:
	if area is Bloc :
		if change :
			scale.y = -scale.y;
		else :
			position.x = area.position.x - (area.position.x - position.x)


func _on_change_timer_timeout() -> void:
	change = false;
