extends CharacterBody2D

@export var medium_asteroid: PackedScene
@export var spawner: Node
@onready var screen_size = get_viewport().get_visible_rect().size

var texture1 = preload("res://art/large_asteroid/asteroid1.png")
var texture2 = preload("res://art/large_asteroid/asteroid2.png")
var texture3 = preload("res://art/large_asteroid/asteroid3.png")
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
	
	global_position.x = wrapf(global_position.x, -85, screen_size.x + 85)
	global_position.y = wrapf(global_position.y, -85, screen_size.y + 85)

func _on_asteroid_area_area_entered(area: Area2D) -> void:
	if area.name == "bullet_area":
		var instance1 = medium_asteroid.instantiate()
		var instance2 = medium_asteroid.instantiate()
		Signalbus.enemies_count += 1
		instance1.spawner = spawner
		instance2.spawner = spawner
		spawner.add_child(instance1)
		spawner.add_child(instance2)
		var space_x = rng.randi_range(-64, 64)
		var space_y = rng.randi_range(-64, 64)
		instance1.position = Vector2(position.x - space_x, position.y - space_y)
		instance2.position = Vector2(position.x + space_x, position.y + space_y)
		queue_free()
