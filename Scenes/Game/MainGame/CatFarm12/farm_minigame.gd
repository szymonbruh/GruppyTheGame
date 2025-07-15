extends Area2D



func _ready():
	
	Dialogic.signal_event.connect(DialogicSignal)

func interact():
	if GameSave.current_quest == 3 and GameSave.what_quest == "FarmerQuest1":
		print("start")
	else:
		print(GameSave.current_quest)
func DialogicSignal(arg: String):

	if arg == "exit_dialog":
		Global.player.is_moving = true
	if arg == "seeds_found":
		GameSave.current_quest += 1
		GameSave.seeds_collected  = true
		queue_free()
