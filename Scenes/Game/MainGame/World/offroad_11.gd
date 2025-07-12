extends Node2D


func _ready():
	Global.current_scene = "offroad11"
	$player.position = Vector2(Global.player_start_pozx, Global.player_start_pozy)
	$player/Camera2D.limit_top = 0
	$player/Camera2D.limit_bottom = 352
	$player/Camera2D.limit_right = 529
	$player/Camera2D.limit_left = 0
	$player/Camera2D.enabled = true
	$CanvasLayer/Panel.visible = true
	$CanvasLayer/Panel/AnimationPlayer.play("fade_out")

func _process(delta):
	change_scenes()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		print("suckes")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = false
		print("suckesn't")


func change_scenes():
	if Global.transition_scene == true:
		print("check1")
		Global.player_start_pozx = 136
		Global.player_start_pozy = 274
		if Global.current_scene == "offroad11":
			$CanvasLayer/Panel.visible = true
			$CanvasLayer/Panel/AnimationPlayer.play("fade_in")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_out":
		$CanvasLayer/Panel.visible = false
	if anim_name == "fade_in":
		get_tree().change_scene_to_file("res://Scenes/Game/MainGame/scene01_outhome.tscn")
		Global.finish_changescenes()
