extends Area2D



func _ready():
	if GameSave.seeds_collected == false:
		visible = true
	else:
		visible = false
	Dialogic.signal_event.connect(DialogicSignal)

func interact():
	if GameSave.seeds_collected == false:
		Global.player.is_moving = false
		Dialogic.VAR.set("whatquest", GameSave.what_quest)
		Global.run_dialogue("seedsfoundquesttimeline")
	else:
		pass
func DialogicSignal(arg: String):

	if arg == "exit_dialog":
		Global.player.is_moving = true
	if arg == "seeds_found":
		GameSave.current_quest += 1
		GameSave.seeds_collected  = true
		queue_free()
