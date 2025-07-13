extends Node



var gold = 25


func _process(delta: float) -> void:
	$CanvasLayer/Gold.text = "Money: " + str(gold)
