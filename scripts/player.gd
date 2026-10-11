extends CharacterBody2D

const SPEED = 500.0

func _physics_process(delta: float) -> void:
	# 1. Get input direction for all 4 axes (Left, Right, Up, Down)
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# 2. Handle movement and animations
	if direction != Vector2.ZERO:
		# direction.normalized() ensures diagonal movement isn't faster
		velocity = direction * SPEED
		$AnimatedSprite2D.play("default")
	else:
		# Smoothly decelerate to zero when no keys are pressed
		velocity.x = move_toward(velocity.x, 0, SPEED)


	# 3. Move the character
	move_and_slide()
