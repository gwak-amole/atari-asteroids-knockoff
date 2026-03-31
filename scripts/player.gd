extends CharacterBody2D
@export var speed = 700.0;

func _process(delta):
	look_at(get_global_mouse_position())

func _physics_process(delta):
	var direction = (get_global_mouse_position() - global_position)
	
	if Input.is_action_pressed("thrust"): 
		velocity = direction.normalized() * speed
	else:
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
