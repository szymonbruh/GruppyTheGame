extends Node

const settings_loc = "user://SettingsFile5.json"

var settings_save: Dictionary = {
	"Fullscreen" : false,
	"FirstLaunch" : false,
	"Resolution" : [1280,720],
	"MasterVolume" : 0,
	"EfVolume" : 0,
	"Vsync" : false
}
func _ready():
	if not FileAccess.file_exists(settings_loc):
		_saveset()
	else:
		_loadset()

	
	
func _loadset():
	if FileAccess.file_exists(settings_loc):
		var file = FileAccess.open(settings_loc, FileAccess.READ)
		var data = file.get_var()
		file.close()
		settings_save = data.duplicate()  # PRZYPISZ CAŁY SŁOWNIK!
		if settings_save.Fullscreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

		if settings_save.has("Resolution"):
			var res = settings_save["Resolution"]
			if res.size() == 2:
				DisplayServer.window_set_size(Vector2i(res[0], res[1]))
		if settings_save.Vsync == true:
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
		else:
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	else:
		print("brak pliku")


func _saveset():
	var file = FileAccess.open(settings_loc, FileAccess.WRITE)
	
	file.store_var(settings_save.duplicate())
	file.close()
