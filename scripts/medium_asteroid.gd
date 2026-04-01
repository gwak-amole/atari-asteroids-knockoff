extends CharacterBody2D

@export var small_asteroid: PackedScene
@export var spawner: Node
@onready var screen_size = get_viewport().get_visible_rect().size

var texture1 = preload("res://art/small_asteroid/asteroid1.png")
var texture2 = preload("res://art/small_asteroid/asteroid2.png")
var texture3 = preload("res://art/small_asteroid/asteroid1.png")
var rng = RandomNumberGenerator.new()
var chance = rng.randi_range(1, 3)
var speed = 0.0;
var rand_pos: Vector2

func _ready():
	rng.randomize()
	if (chance == 1):
		$Sprite2D.texture = texture1
		speed = 40.0
	elif (chance == 2):
		$Sprite2D.texture = texture2
		speed = 50.0
	else:
		$Sprite2D.texture = texture3
		speed = 60.0
	var rand_pos_x = rng.randf_range(-1.0, 1.0)
	var rand_pos_y = rng.randf_range(-1.0, 1.0)
	rand_pos = Vector2(rand_pos_x, rand_pos_y).normalized()

func _physics_process(delta: float) -> void:
	velocity = rand_pos.normalized() * speed
	
	move_and_slide()
	
	if position.x > screen_size.x + 32:
		position.x = -32
	elif position.x < -32:
		position.x = screen_size.x + 32
	if position.y > screen_size.y + 32:
		position.y = -32
	elif position.y < -32:
		position.y = screen_size.y + 32

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "bullet_area":
		var instance1 = small_asteroid.instantiate()
		var instance2 = small_asteroid.instantiate()
		spawner.add_child(instance1)
		spawner.add_child(instance2)
		var space_x = rng.randi_range(-20, 20)
		var space_y = rng.randi_range(-20, 20)
		instance1.position = Vector2(position.x - space_x, position.y - space_y)
		instance2.position = Vector2(position.x + space_x, position.y + space_y)
		queue_free()
		
