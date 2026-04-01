extends CharacterBody2D
@export var speed = 500.0;

func _process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("fire") && $attack_cooldown.is_stopped():
		Signalbus.fire.emit()
		$attack_cooldown.start()

func _physics_process(delta):
	var direction = (get_global_mouse_position() - global_position)
	
	if Input.is_action_pressed("thrust"): 
		velocity = direction.normalized() * speed
	else:
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
