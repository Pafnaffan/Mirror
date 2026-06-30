extends Node

@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()
@onready var menu_player: AudioStreamPlayer = AudioStreamPlayer.new()
@onready var level_player: AudioStreamPlayer = AudioStreamPlayer.new()

var fade_tween: Tween

func _ready() -> void:
	add_child(music_player)
	music_player.bus = "Music"
	
	add_child(menu_player)
	add_child(level_player)
	menu_player.stream = preload("res://sound/menu_music.mp3")
	level_player.stream = preload("res://sound/platformer_music.mp3")
	menu_player.volume_db = 0
	level_player.volume_db = -80
	menu_player.play()
	level_player.play()
	
func fade_to_level() -> void:
	if fade_tween:
		fade_tween.kill()
	fade_tween = create_tween()
	fade_tween.set_parallel(true)
	#fade_tween.tween_property(menu_player, "volume_db", -80, 1)
	#fade_tween.tween_property(level_player, "volume_db", 0, 1)
	fade_tween.tween_method(_set_crossfade_progress, 0.0, 1.0, 1)
	
func _set_crossfade_progress(t: float) -> void:
	var menu_vol = cos(t * PI / 2.0)
	var level_vol = sin(t * PI / 2.0)
	menu_player.volume_db = linear_to_db(menu_vol)
	level_player.volume_db = linear_to_db(level_vol)
	
func fade_to_menu() -> void:
	if fade_tween:
		fade_tween.kill()
	fade_tween = create_tween()
	fade_tween.set_parallel(true)
	#fade_tween.tween_property(menu_player, "volume_db", 0, 0.5)
	#fade_tween.tween_property(level_player, "volume_db", -80, 0.5)
	fade_tween.tween_method(_set_crossfade_progress, 1.0, 0.0, 1)

func play_music(stream: AudioStream, loop: bool = true, vol: int = -80) -> void:
	music_player.stream = stream
	music_player.volume_db = vol
	music_player.play()

func stop_music() -> void:
	music_player.stop()
