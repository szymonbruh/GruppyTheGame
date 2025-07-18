extends Sprite2D

@export var key_name: String = ""
@onready var falling_obj = preload("res://Scenes/Game/MainGame/CatFarm12/MiniGameFarm/Falling_obj.tscn")
@onready var score_text = preload("res://Scenes/Game/MainGame/CatFarm12/MiniGameFarm/ScoreText.tscn")
var falling_key_queue = []

var perfect_press_threshold: float = 18.0
var awesome_press_threshold: float = 25.0
var good_press_threshold: float = 35.0

var perfect_press_score: int = 250
var awesome_press_score: int = 150
var good_press_score: int = 50



func _process(delta):
	if falling_key_queue.size() > 0:
		if falling_key_queue.front().has_passed:
			falling_key_queue.pop_front()
	
		
		if Input.is_action_just_pressed(key_name):
			var key_to_pass = falling_key_queue.pop_front()
			var press_score_text: String = ""
			var distance_from_pop = abs(key_to_pass.pass_threshold - key_to_pass.global_position.y)
			
			if distance_from_pop < perfect_press_threshold:
				Signals.IncrementScore.emit(perfect_press_score)
				press_score_text = "PERFECT"
			elif distance_from_pop < awesome_press_threshold:
				Signals.IncrementScore.emit(awesome_press_score)
				press_score_text = "AWESOME"
			elif distance_from_pop < good_press_threshold:
				Signals.IncrementScore.emit(good_press_score)
				press_score_text = "GOOD"
			else:
				press_score_text = "MISS"
			
			key_to_pass.queue_free()
			
			var st_inst = score_text.instantiate()
			get_tree().get_root().call_deferred("add_child", st_inst)
			st_inst.SetTextInfo(press_score_text)
			st_inst.global_position = global_position

	


func CreateFallingObj():
	var fk_inst = falling_obj.instantiate()
	get_tree().get_root().call_deferred("add_child", fk_inst)
	fk_inst.Setup(position.x, frame + 3)
	falling_key_queue.push_back(fk_inst)


func _on_random_spawn_timer_timeout() -> void:
	if is_processing():
		CreateFallingObj()
		$RandomSpawnTimer.wait_time = randf_range(1, 3)
		$RandomSpawnTimer.start()
	else:
		pass
