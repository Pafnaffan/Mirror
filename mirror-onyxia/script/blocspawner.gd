extends Node2D
class_name BlocSpawner

var random : RandomNumberGenerator;

@export var bloc : PackedScene;

@export var vtsPhase : float;

@export var minSpawn : float;

@export var maxSpawn : float;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize();
	random = RandomNumberGenerator.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	vtsPhase += 0.1;


func _on_cooldown_timeout() -> void:
	$cooldown.wait_time = random.randf_range(minSpawn,maxSpawn);
	$cooldown.start();
	if maxSpawn > 0.3 :
		maxSpawn -= 0.003;
	var inst_bloc = bloc.instantiate();
	inst_bloc.position.x = get_window().size.x+inst_bloc.get_child(1).texture.get_width();
	inst_bloc.position.y = 540;
	if random.randi_range(0,1) == 1 :
		inst_bloc.scale.y = -inst_bloc.scale.y;
	inst_bloc.vts = vtsPhase;
	$"..".add_child(inst_bloc);
