extends Area2D
func _ready():
	Dialogic.signal_event.connect(DialogicSignal)


func interact():
	Global.player.is_moving = false
	Global.run_dialogue("znak3")

func DialogicSignal(arg: String):
	if arg == "exit_dialog":
		Global.player.is_moving = true
