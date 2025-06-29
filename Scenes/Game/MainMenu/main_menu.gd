extends Control



func _ready():
	$RichTextLabel/AnimationPlayer.play("fall_in")
	$VBoxContainer/NewGame/AnimationPlayer.play("fadein")
	$VBoxContainer/Continue/AnimationPlayer.play("fadein")
	$VBoxContainer/Quit/AnimationPlayer.play("FadeIN")
	$VBoxContainer/Settings/AnimationPlayer.play("FadeIn")
	SaveLoad._saveset()
	SaveLoad.settings_save.FirstLaunch = true
	if SaveLoad.settings_save.Fullscreen == true:
		$VBoxContainer2/FullScreen.button_pressed = true
	elif SaveLoad.settings_save.Fullscreen == false:
		$VBoxContainer2/FullScreen.button_pressed = false
	if SaveLoad.settings_save.Resolution == [1920, 1080]:
		$VBoxContainer2/ResolutionOption.selected = 1
	elif SaveLoad.settings_save.Resolution == [2560, 1600]:
		$VBoxContainer2/ResolutionOption.selected = 0
	elif SaveLoad.settings_save.Resolution == [1600, 900]:
		$VBoxContainer2/ResolutionOption.selected = 2
	elif SaveLoad.settings_save.Resolution == [1280, 720]:
		$VBoxContainer2/ResolutionOption.selected = 3
	elif SaveLoad.settings_save.Resolution == [960, 540]:
		$VBoxContainer2/ResolutionOption.selected = 4
	$VolumesContainer/MasterVolumeSlider.value = SaveLoad.settings_save.MasterVolume
	$VolumesContainer/EffectsVolumeSlider.value = SaveLoad.settings_save.EfVolume
	if SaveLoad.settings_save.Vsync == false:
		$VBoxContainer2/Vsync.button_pressed = false
	else:
		$VBoxContainer2/Vsync.button_pressed = true
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_settings_pressed() -> void:
	$SettingsWindow.visible = true
	$SettingsWindow/AnimationPlayer.play("SettOpen")
	$SettingsWindow.visible = true
	


func _on_animation_player_animation_finished(anim_name: String) -> void:
	if anim_name == "SettOpen":
		$HBoxContainer.visible = true
		$VBoxContainer2.visible = true
	if anim_name == "SettClose":
		$SettingsWindow.visible = false
		


func _on_close_button_pressed() -> void:
	$SettingsWindow/AnimationPlayer.play("SettClose")
	$HBoxContainer.visible = false
	$VBoxContainer2.visible = false


	


func _on_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		SaveLoad.settings_save.Fullscreen = toggled_on
		SaveLoad._saveset()
	elif toggled_on == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		SaveLoad.settings_save.Fullscreen = toggled_on
		SaveLoad._saveset()
	


func _on_resolution_option_item_selected(index: int) -> void:
	match index:
		0:
			SaveLoad.settings_save.Resolution = [2560, 1600]
		1:
			SaveLoad.settings_save.Resolution = [1920, 1080]
		2:
			SaveLoad.settings_save.Resolution = [1600, 900]
		3:
			SaveLoad.settings_save.Resolution = [1280, 720]
		4:
			SaveLoad.settings_save.Resolution = [960, 540]
	SaveLoad._saveset()
	SaveLoad._loadset()


func _on_save_button_pressed() -> void:
	SaveLoad._saveset()
	print(SaveLoad.settings_save.Resolution)
	print(SaveLoad.settings_save.Fullscreen)


func _on_button_pressed() -> void:
	$VBoxContainer2.visible = false
	$HBoxContainer.visible = false
	$VolumesContainer.visible = true
	$SaveAndQuitVolume.visible = true


func _on_master_volume_slider_value_changed(value: float) -> void:
	var volume = $VolumesContainer/MasterVolumeSlider.value
	SaveLoad.settings_save.MasterVolume = volume
	SaveLoad._saveset()

func _on_h_slider_value_changed(value: float) -> void:
	var volume = $VolumesContainer/EffectsVolumeSlider.value
	SaveLoad.settings_save.EfVolume = volume
	SaveLoad._saveset()

func _on_save_and_quit_volume_pressed() -> void:

	$VBoxContainer2.visible = true
	$SaveAndQuitVolume.visible = false
	$HBoxContainer.visible = true
	$VolumesContainer.visible = false


func _on_vsync_toggled(toggled_on: bool) -> void:
	if toggled_on == false:
		SaveLoad.settings_save.Vsync = toggled_on
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	else:
		SaveLoad.settings_save.Vsync = toggled_on
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)


func _on_new_game_pressed() -> void:
	$CloseMainMenu.visible = true
	$CloseMainMenu/AnimationPlayer.play("closez")
