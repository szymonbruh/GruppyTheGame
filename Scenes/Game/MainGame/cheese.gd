extends Area2D



func _ready():
	Dialogic.signal_event.connect(DialogicSignal)


func interact():
	if GameSave.found_cheese == 0:
		Global.player.is_moving = false
		Global.run_dialogue("CheeseFound")
		visible = false
		GameSave.found_cheese = 1
	else:
		pass
func DialogicSignal(arg: String):
	if arg == "exit_dialog":
		Global.player.is_moving = true
