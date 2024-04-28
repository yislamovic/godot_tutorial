extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 500
@onready var sprite_2d = $Sprite2D


var jump_count = 2;

func _physics_process(delta):
	if(velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
		
	if is_on_floor():
		jump_count = 2
		
	if not is_on_floor():
		print("is not on floor ")
		velocity.y += gravity
		sprite_2d.animation = "jumping"
	
		
	if Input.is_action_just_pressed("jump") and jump_count > 0:
		velocity.y = -jump_force
		jump_count -= 1
		print(jump_count)
	
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	if horizontal_direction:
		velocity.x = speed * horizontal_direction
	else:
		velocity.x = move_toward(velocity.x, 0, 22)
	
	if horizontal_direction < 0.0:
		sprite_2d.flip_h = true
	elif horizontal_direction > 0.0:
		sprite_2d.flip_h = false
	else: sprite_2d.flip_h = sprite_2d.flip_h
	
		
	move_and_slide()
	print(velocity)
