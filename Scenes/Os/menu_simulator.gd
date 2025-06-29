extends Control

var napis = -3

func _ready():
	$AudioStreamPlayer2D.volume_db = SaveLoad.settings_save.MasterVolume
	$BEep.volume_db = SaveLoad.settings_save.EfVolume
	
func _on_timer_timeout() -> void:
	napis += 1
	if napis == -2:
		$NapisOgolny.text = "Starting Gruppy-OS."
		$BEep.play()
	if napis == -1:
		$NapisOgolny.text = "Starting Gruppy-OS.."
	if napis == 0:
		$NapisOgolny.text = "Starting Gruppy-OS..."
	if napis == 1:
		$NapisOgolny.text = "Current date is: 12:01:2003"
		$BEep.play()
	if napis == 2:
		$NapisOgolny.text = "Current date is: 12:01:2003
		
		
UCM Personal Computer (C)"
	$BEep.play()
	if napis == 3:
		$NapisOgolny.text = "Current date is: 12:01:2003
		
		
UCM Personal Computer (C)

GruppyOS v1.2 1989,1990,1991
"
	$BEep.play()
	if napis == 4:
		$NapisOgolny.text = "Current date is: 12:01:2003
		
		
UCM Personal Computer (C)

GruppyOS v1.2 1989,1990,1991

Welcome $USER_####$,
"
	$BEep.play()
	if napis == 5:
		$NapisOgolny.text = "Current date is: 12:01:2003
		
		
UCM Personal Computer (C)

GruppyOS v1.2 1989,1990,1991

Welcome $USER_####$,



Launching Gruppy_The_Game.exe
"
	$BEep.play()
	if napis == 6:
		$NapisOgolny.text = "Current date is: 12:01:2003
		
		
UCM Personal Computer (C)

GruppyOS v1.2 1989,1990,1991

Welcome $USER_####$,



Launching Gruppy_The_Game.exe.
"
	if napis == 7:
		$NapisOgolny.text = "Current date is: 12:01:2003
		
		
UCM Personal Computer (C)

GruppyOS v1.2 1989,1990,1991

Welcome $USER_####$,



Launching Gruppy_The_Game.exe..
"
	if napis == 8:
		$NapisOgolny.text = "Current date is: 12:01:2003
		
		
UCM Personal Computer (C)

GruppyOS v1.2 1989,1990,1991

Welcome $USER_####$,



Launching Gruppy_The_Game.exe...
"
	if napis == 10:
		get_tree().change_scene_to_file("res://Scenes/Os/Loading.tscn")

func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer2D.play()
