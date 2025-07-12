extends Node


var player: CharacterBody2D = null
var pressE: Label = null

#Chaning scene
var current_scene = "scene01_outhome"
var transition_scene = false
var player_exit_offroad_pozx = 0
var player_exit_offroad_pozy = 0
var player_start_pozx = 145
var player_start_pozy = 107





func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)




func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "scene01_outhome":
			current_scene = "offroad11"
		else:
			current_scene = "scene01_outhome"
