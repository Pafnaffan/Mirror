extends Node

@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()

func _ready() -> void:
	add_child(music_player)
	music_player.bus = "Music"

func play_music(stream: AudioStream, loop: bool = true) -> void:
	music_player.stream = stream
	music_player.play()

func stop_music() -> void:
	music_player.stop()
