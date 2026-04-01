extends CharacterBody2D
@export var speed = 800.0
var direction: Vector2
@onready var screen_size = get_viewport().get_visible_rect().size

func _ready():
	look_at(get_global_mouse_position())
	direction = (get_global_mouse_position() - global_position)
	
func _physics_process(delta):
	velocity = direction.normalized() * speed
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_bullet_area_area_entered(area: Area2D) -> void:
	if area.name == "asteroid_area":
		queue_free()
