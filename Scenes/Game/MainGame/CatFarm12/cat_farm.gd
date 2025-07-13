extends Node2D


func _ready():
	Global.current_scene = "cat_farm"
	$CanvasLayer/Panel.visible = true
	$CanvasLayer/Panel/AnimationPlayer.play("fade_out")
	$player.position = Vector2(Global.player_start_pozx, Global.player_start_pozy)
	$player/Camera2D.limit_top = 0
	$player/Camera2D.limit_bottom = 384
	$player/Camera2D.limit_right = 624
	$player/Camera2D.limit_left = 0
	

func _process(delta):
	change_scenes()

func change_scenes():
	if Global.transition_scene == true:
		print("check1")
		if Global.current_scene == "cat_farm" and Global.exit_num == 0:
			Global.player_start_pozx = 27
			Global.player_start_pozy = 207
			print("check")
			$CanvasLayer/Panel.visible = true
			$CanvasLayer/Panel/AnimationPlayer.play("fade_in")

	




func _on_exit_farm_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		Global.exit_num = 0


func _on_exit_farm_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false
		Global.exit_num = null


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_out":
		$CanvasLayer/Panel.visible = false
	if anim_name == "fade_in" and Global.exit_num == 0:
		get_tree().change_scene_to_file("res://Scenes/Game/MainGame/World/offroad11.tscn")
		Global.finish_changescenes()
