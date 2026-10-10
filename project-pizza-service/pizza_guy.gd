extends CharacterBody2D

var max_speed: float = 1500.0     
var acceleration: float = 800.0  
var friction: float = 600.0       
var brake_force: float = 1200.0

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_axis("ui_left", "ui_right")

	if input_dir == 0.0:
		velocity.x = move_toward(velocity.x, 0.0, friction * delta)
	elif input_dir * velocity.x < 0.0:
		velocity.x = move_toward(velocity.x, 0.0, brake_force * delta)
	else:
		velocity.x = move_toward(velocity.x, input_dir * max_speed, acceleration * delta)

	velocity.y = 0.0

	move_and_slide()
