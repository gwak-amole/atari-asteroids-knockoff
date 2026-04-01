extends CharacterBody2D
@export var speed = 800.0
var direction: Vector2

func _ready():
	look_at(get_global_mouse_position())
	direction = (get_global_mouse_position() - global_position)
	
func _physics_process(delta):
	velocity = direction.normalized() * speed
	move_and_slide()
