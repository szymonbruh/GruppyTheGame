extends Control

@onready var progress_bar = $ProgressBar

var progress = 0
var speed = 15  # jednostek na sekundę


func _ready():
	$AudioStreamPlayer2D.volume_db = SaveLoad.settings_save.MasterVolume



func _process(delta):
	if progress < 100:
		progress += speed * delta
		progress_bar.value = progress
	if progress_bar.value == 100:
		get_tree().change_scene_to_file("res://Scenes/Game/MainMenu/MainMenu.tscn")

func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer2D.play()
