extends Sprite2D


@export var fall_speed: float = 0.5
var init_y_pos: float = 0


var has_passed = false
var pass_threshold = 155.0


func _ready():
	####set_process(false)
	pass




func _process(delta):
	global_position += Vector2(0, fall_speed)
	
	
	if global_position.y > pass_threshold and not $Timer.is_stopped():
		$Timer.stop()
		has_passed = true

func Setup(target_x: float, target_frame: int):
	global_position = Vector2(target_x, init_y_pos)
	frame = target_frame
	set_process(true)


func _on_delete_obj_timeout() -> void:
	queue_free()
	print("dziala")

func Stop():
	set_process(false)
