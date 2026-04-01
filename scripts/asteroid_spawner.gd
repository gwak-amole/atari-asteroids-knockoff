extends Node

@export var small_asteroid: PackedScene
@export var medium_asteroid: PackedScene
@export var asteroid_spawner: Node
@onready var screen_size = get_viewport().get_visible_rect().size
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()


func _on_small_timer_timeout() -> void:
	var instance = small_asteroid.instantiate()
	add_child(instance)
	var chance = rng.randi_range(1,4)
	if (chance == 1):
		instance.position = Vector2(-32, rng.randi_range(-32, screen_size.y + 32))
	elif (chance == 2):
		instance.position = Vector2(screen_size.x + 32, rng.randi_range(-32, screen_size.y+32))
	elif (chance == 3):
		instance.position = Vector2(rng.randi_range(-32, screen_size.x + 32), -32)
	else:
		instance.position = Vector2(rng.randi_range(-32, screen_size.x + 32), screen_size.y+32)


func _on_medium_timer_timeout() -> void:
	var instance = medium_asteroid.instantiate()
	instance.small_asteroid = small_asteroid
	instance.spawner = asteroid_spawner
	add_child(instance)
	var chance = rng.randi_range(1,4)
	if (chance == 1):
		instance.position = Vector2(-32, rng.randi_range(-32, screen_size.y + 32))
	elif (chance == 2):
		instance.position = Vector2(screen_size.x + 32, rng.randi_range(-32, screen_size.y+32))
	elif (chance == 3):
		instance.position = Vector2(rng.randi_range(-32, screen_size.x + 32), -32)
	else:
		instance.position = Vector2(rng.randi_range(-32, screen_size.x + 32), screen_size.y+32)
