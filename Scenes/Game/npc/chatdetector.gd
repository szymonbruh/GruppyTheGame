extends Area2D




func _process(delta: float) -> void:
	if GameSave.found_cheese == 1:
		if $CheeseQuest.quest_status == $CheeseQuest.QuestStatus.started:
			$CheeseQuest.reached_goal()
			



func interact():
	get_parent().is_chatting = true
	if GameSave.quest1mouse == 0:
		Global.run_dialogue("mousetalk")
		Global.player.is_moving = false
	if GameSave.quest1mouse == 1:
		if GameSave.found_cheese == 0:
			Global.run_dialogue("mousedurningquest")
		if GameSave.found_cheese == 1:
			Global.run_dialogue("MouseQuestEnd")
			Global.player.is_moving = false
	if GameSave.quest1mouse == 2:
		Global.run_dialogue("endquestMouse")
func DialogicSignal(arg: String):
	if arg == "exit_dialog":
		Global.player.is_moving = true
		get_parent().is_chatting = false
	if arg == "quest_starting":
		Global.player.is_moving = true
		get_parent().is_chatting = false
		
		if GameSave.is_quest_enabled == false:
			if $CheeseQuest.quest_status == $CheeseQuest.QuestStatus.available:
				$CheeseQuest.start_quest()
				GameSave.quest1mouse = 1
				GameSave.is_quest_enabled = true
		else:
			Global.run_dialogue("mouserefuse")
	if arg == "end_quest":
		$CheeseQuest.finish_quest()
		Global.is_quest_enabled = false
		GameSave.quest1mouse = 2
func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
