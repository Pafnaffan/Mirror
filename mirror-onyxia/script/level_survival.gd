extends Node2D
class_name LevelSurvival;

@export var spawner : PackedScene;

@export var vtsPhase : float;

@export var minSpawn : float;

@export var maxSpawn : float;

@export var timeWin : float;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var inst_spawner = spawner.instantiate();
	inst_spawner.vtsPhase = vtsPhase;
	inst_spawner.minSpawn = minSpawn;
	inst_spawner.maxSpawn = maxSpawn;
	add_child(inst_spawner);
	$TimeWin.wait_time = timeWin;
	$TimeWin.start();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Countdown.text = str($TimeWin.time_left).pad_decimals(0);


func _on_time_win_timeout() -> void:
	pass
