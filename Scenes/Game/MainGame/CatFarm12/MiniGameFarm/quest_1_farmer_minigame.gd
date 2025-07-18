extends Node2D

var timeleft = 5




func _ready() -> void:
	$GameTime.stop()
	$FallingKey.set_process(false)
	$FallingKey2.set_process(false)
	$FallingKey3.set_process(false)
	$StartGame/AnimationPlayer.play("Fade_In")
	

func _process(delta: float) -> void:
	$GameTimeLabel.text = str(timeleft)
	if timeleft < 1:
		$GameTime.stop()
		$FallingKey.queue_free()
		$FallingKey2.queue_free()
		$FallingKey3.queue_free()
		$GameUi.visible = false
		$EndScreen.visible = true
		timeleft = 999
		$EndScreen/EndScreenAnim.play("Fade_Out")
		var score_final = $GameUi/CanvasLayer/ScoreLabel.text
		$EndScreen/RichTextLabel.text = "[center]YOUR SCORE IS: " + str(score_final)
func _on_game_time_timeout() -> void:
	timeleft -= 1
	$GameTime.start()


func _on_start_game_pressed() -> void:
	$StartGame/AnimationPlayer.play("Fade_Out")
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Fade_Out":
		$StartGame.queue_free()
		$FallingKey.set_process(true)
		$FallingKey2.set_process(true)
		$FallingKey3.set_process(true)
		$FallingKey.visible = true
		$FallingKey2.visible = true
		$FallingKey3.visible = true
		$GameTime.start()


func _on_end_screen_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Fade_Out":
		$EndScreen/Congrats.start()
