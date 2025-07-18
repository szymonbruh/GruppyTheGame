extends Control



#Perfect f8c949
#Awesome 7eee63
#Good 8bddf7
#Miss cc0029

func SetTextInfo(text: String):
	$RichTextLabel.text = "[center]" + text
	
	match text:
		"PERFECT":
			$RichTextLabel.set("theme_override_colors/default_color", Color("f8c949"))
		"AWESOME":
			$RichTextLabel.set("theme_override_colors/default_color", Color("7eee63"))
		"GOOD":
			$RichTextLabel.set("theme_override_colors/default_color", Color("8bddf7"))
		_:
			$RichTextLabel.set("theme_override_colors/default_color", Color("cc0029"))
