extends Area2D



func interact():
	get_parent().is_chatting = true
	Global.run_dialogue("mousetalk")
	Global.player.is_moving = false
	Global.pressE.visible = false

func DialogicSignal(arg: String):
	if arg == "exit_dialog":
		Global.player.is_moving = true
		get_parent().is_chatting = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
