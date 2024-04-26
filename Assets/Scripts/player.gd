extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 500

var jump_count = 2;

func _physics_process(delta):
	if is_on_floor():
		jump_count = 2
		
	if not is_on_floor():
		velocity.y += gravity
		if velocity.y >= 1000:
			velocity.y = 1000
	
	if Input.is_action_just_pressed("jump") and jump_count > 0:
		velocity.y = -jump_force
		jump_count -= 1
		print(jump_count)
	
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = speed * horizontal_direction
	move_and_slide()
	
	print(velocity)
