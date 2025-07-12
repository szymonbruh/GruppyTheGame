extends CharacterBody2D

var is_moving: bool = true
const speed = 50
var current_dir = "none"
func _ready():
	Global.player = self

func _physics_process(delta):
	
	if is_moving == true:
		player_movement()
		if Input.is_action_just_pressed("interact"):
			try_interact()
	else:
		pass

func _process(delta):
	try_show_gui()

func player_movement():
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("Move_D"):
		velocity.x = speed
		$RayCast2D.target_position = Vector2(16, 0)
		current_dir = "right"
		play_anim(1)
		velocity.y = 0
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("Move_A"):
		velocity.x = -speed
		$RayCast2D.target_position = Vector2(-16, 0)
		play_anim(1)
		current_dir = "left"
		velocity.y = 0
	elif Input.is_action_pressed("ui_down") or Input.is_action_pressed("Move_S"):
		velocity.x = 0
		$RayCast2D.target_position = Vector2(0, 16)
		velocity.y = speed
	elif Input.is_action_pressed("ui_up") or Input.is_action_pressed("Move_W"):
		velocity.x = 0
		$RayCast2D.target_position = Vector2(0, -14)
		velocity.y = -speed
	else:
		velocity.x = 0
		velocity.y = 0
		play_anim(0)
	
	move_and_slide()



func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	if dir == "right":
		if movement == 1:
			anim.play("cat_Right")
		elif movement == 0:
			anim.play("default")
	if dir == "left":
		if movement == 1:
			anim.play("Cat_left")
		elif movement == 0:
			anim.play("default")


func try_show_gui():
	var collider = $RayCast2D.get_collider()
	if collider and collider.is_in_group("interaction"):
		Global.pressE.visible = true
	else:
		Global.pressE.visible = false
	



func try_interact():
	if $RayCast2D.is_colliding():
		var colider = $RayCast2D.get_collider()
		if colider.has_method("interact"):
			colider.interact()
		else:
			print("brak metody interact")
	else:
		print("RayCast nie trafia nic")


func player():
	pass
