extends Area2D

var player_in_area = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
	
func interact():
	Global.player.is_moving = false
	Global.run_dialogue("informationsGruppyHouse")
	
func DialogicSignal(arg: String):
	if arg == "exit_dialog":
		Global.player.is_moving = true
