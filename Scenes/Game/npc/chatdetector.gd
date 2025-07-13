extends Area2D

var quest1 = 0


func _process(delta: float) -> void:
	if GameSave.found_cheese == 1:
		if $CheeseQuest.quest_status == $CheeseQuest.QuestStatus.started:
			$CheeseQuest.reached_goal()
			



func interact():
	get_parent().is_chatting = true
	if quest1 == 0:
		Global.run_dialogue("mousetalk")
		Global.player.is_moving = false
	if quest1 == 1:
		if GameSave.found_cheese == 0:
			Global.run_dialogue("mousedurningquest")
		if GameSave.found_cheese == 1:
			Global.run_dialogue("MouseQuestEnd")
			Global.player.is_moving = false
	if quest1 == 2:
		Global.run_dialogue("endquestMouse")
func DialogicSignal(arg: String):
	if arg == "exit_dialog":
		Global.player.is_moving = true
		get_parent().is_chatting = false
	if arg == "quest_starting":
		Global.player.is_moving = true
		get_parent().is_chatting = false
		if $CheeseQuest.quest_status == $CheeseQuest.QuestStatus.available:
			$CheeseQuest.start_quest()
			quest1 = 1
	if arg == "end_quest":
		$CheeseQuest.finish_quest()
		quest1 = 2
func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
