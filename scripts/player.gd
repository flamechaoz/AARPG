extends CharacterBody2D

var walk_speed = 100
var direction = "none"

func _physics_process(delta: float) -> void:
	player_movement(delta)

func player_movement(delta: float) -> void:
	
	if Input.is_action_pressed("ui_right"):
		direction = "right"
		play_animation(1)
		velocity.x = walk_speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		direction = "left"
		play_animation(1)
		velocity.x = -walk_speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		direction = "down"
		play_animation(1)
		velocity.x = 0
		velocity.y = walk_speed
	elif Input.is_action_pressed("ui_up"):
		direction = "up"
		play_animation(1)
		velocity.x = 0
		velocity.y = -walk_speed
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
	move_and_slide()

func play_animation(movement: int):
	var dir = direction
	var anim = $AnimatedSprite2D
	
	match dir:
		"right":
			anim.flip_h = false
			if movement:
				anim.play("side_walk")
			else:
				anim.play("side_idle")
		"left":
			anim.flip_h = true
			if movement:
				anim.play("side_walk")
			else:
				anim.play("side_idle")
		"down":
			anim.flip_h = false
			if movement:
				anim.play("front_walk")
			else:
				anim.play("front_idle")
		"up":
			anim.flip_h = false
			if movement:
				anim.play("back_walk")
			else:
				anim.play("back_idle")
