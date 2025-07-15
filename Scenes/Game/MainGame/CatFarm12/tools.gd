extends Area2D



func _ready():
	if GameSave.tools_collected == false:
		visible = true
	else:
		visible = false
	Dialogic.signal_event.connect(DialogicSignal)

func interact():
	if GameSave.tools_collected == false:
		Dialogic.VAR.set("whatquest", GameSave.what_quest)
		Global.player.is_moving = false
		Global.run_dialogue("toolsfoundquest")
	else:
		pass
func DialogicSignal(arg: String):

	if arg == "exit_dialog":
		Global.player.is_moving = true
	if arg == "pick_tools":
		GameSave.current_quest += 1
		GameSave.tools_collected = true
		queue_free()
