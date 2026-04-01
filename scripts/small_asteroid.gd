extends CharacterBody2D

@export var player: Node
@onready var screen_size = get_viewport().get_visible_rect().size

var texture1 = preload("res://art/asteroid1.png")
var texture2 = preload("res://art/asteroid2.png")
var texture3 = preload("res://art/asteroid3.png")
var rng = RandomNumberGenerator.new()
var chance = rng.randi_range(1, 3)
var speed = 0.0;
var rand_pos: Vector2

func _ready():
	rng.randomize()
	if (chance == 1):
		$Sprite2D.texture = texture1
	elif (chance == 2):
		$Sprite2D.texture = texture2
	else:
		$Sprite2D.texture = texture3
	var rand_pos_x = rng.randf_range(0, screen_size.x)
	var rand_pos_y = rng.randf_range(0, screen_size.y)
	rand_pos = Vector2(rand_pos_x, rand_pos_y)

func _physics_process(delta: float) -> void:
	if chance == 1:
		speed = 40.0
	elif chance == 2:
		speed = 50.0
	else:
		speed = 60.0
	velocity = rand_pos.normalized() * speed
	
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "bullet_area":
		queue_free()
