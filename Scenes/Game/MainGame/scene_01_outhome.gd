extends Node2D


func _ready() -> void:
	$player/Camera2D.limit_top = 0
	$player/Camera2D.limit_bottom = 320
	$player/Camera2D.limit_right = 320
	$player/Camera2D.limit_left = 0
	$player.position = Vector2(Global.player_start_pozx, Global.player_start_pozy)
	Global.current_scene = "scene01_outhome"
	$CanvasLayer/Panel.visible = true
	$CanvasLayer/Panel/AnimationPlayer.play("fade_out")

func _process(float):
	change_scene()



func _on_exit_home_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true


func _on_exit_home_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false


func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "scene01_outhome":
			Global.player_start_pozx = 297
			Global.player_start_pozy = 29
			$CanvasLayer/Panel.visible = true
			$CanvasLayer/Panel/AnimationPlayer.play("fade_in")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_out":
		$CanvasLayer/Panel.visible = false
	if anim_name == "fade_in":
		get_tree().change_scene_to_file("res://Scenes/Game/MainGame/World/offroad11.tscn")
		Global.finish_changescenes()
