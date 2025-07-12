extends Panel

signal confirmed(value: bool)

func _on_yes_pressed() -> void:
	emit_signal("confirmed", true)
	$VBoxContainer.visible = false

func _on_no_pressed() -> void:
	emit_signal("confirmed", false)
	$VBoxContainer.visible = false

func launch():
	$VBoxContainer.visible = true
