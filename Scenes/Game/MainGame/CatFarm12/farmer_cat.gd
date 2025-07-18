extends Area2D



func _process(delta: float) -> void:
	pass



func interact():
	Dialogic.VAR.set("questenabled", GameSave.is_quest_enabled)
	if GameSave.done_farmer_quest == false:
		Global.player.is_moving = false
		if GameSave.farmer_quest == 0:
				if GameSave.current_quest == 0:
					Global.run_dialogue("FirstMeetCatFarmer")
				if GameSave.current_quest == 1 or GameSave.current_quest == 2:
					Global.run_dialogue("FarmerDurningQuest")
				if GameSave.current_quest == 3:
					print("dzial")
		if GameSave.farmer_quest == 1:
			print("quest2")
	else:
		pass
func DialogicSignal(arg: String):
	if arg == "exit_dialog":
		Global.player.is_moving = true
	if arg == "start_quest_farmer" and GameSave.is_quest_enabled == false:
		
		GameSave.is_quest_enabled = true
		arg = ""
		if GameSave.farmer_quest == 0:
			$FarmQuest1.start_quest()
			GameSave.what_quest = "FarmerQuest1"
			GameSave.current_quest = 1
	if arg == "start_quest_farmer" and GameSave.is_quest_enabled == true:
		Global.run_dialogue("FarmerCatRerfuse")
		
func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
