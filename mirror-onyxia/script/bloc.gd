extends Area2D
class_name Bloc

@onready var shape : CollisionShape2D = $CollisionShape2D;

@export var vts : float;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= vts*delta
