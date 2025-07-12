extends CharacterBody2D

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

const speed = 30
var current_state = IDLE

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true
var is_chatting = false

var player
var player_in_chat_zone = false

func _ready():
	randomize()
	start_pos = position
	$Timer.start()

func _physics_process(delta):
	if is_roaming:
		match current_state:
			IDLE:
				velocity = Vector2.ZERO
			NEW_DIR:
				dir = choose([Vector2.RIGHT, Vector2.LEFT, Vector2.UP, Vector2.DOWN])
			MOVE:
				move(delta)
	move_and_slide()

func _process(delta):
	match current_state:
		IDLE, NEW_DIR:
			$AnimatedSprite2D.play("default")
		MOVE:
			if !is_chatting:
				if dir.x == -1:
					$AnimatedSprite2D.play("goleft")
				elif dir.x == 1:
					$AnimatedSprite2D.play("goright")
				elif dir.y == -1:
					$AnimatedSprite2D.play("goup")
				elif dir.y == 1:
					$AnimatedSprite2D.play("godown")

func choose(array):
	array.shuffle()
	return array.front()

func move(delta):
	if !is_chatting:
		velocity = dir * speed

func _on_timer_timeout() -> void:
	$Timer.wait_time = choose([1, 2, 0.5 , 0.3])
	current_state = choose([IDLE, NEW_DIR, MOVE])
