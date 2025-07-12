extends Node2D

var confirmation



func _ready():
	launch_confirm()

func launch_confirm():
	var confirm_scene = preload("res://Scenes/Game/MainGame/UI/confirmation.tscn")
	var confirm_instance = confirm_scene.instantiate()
	add_child(confirm_instance)
	
	confirm_instance.launch()
	confirm_instance.connect("confirmed", _on_confirmed)

func _on_confirmed(value: bool):
	confirmation = value
