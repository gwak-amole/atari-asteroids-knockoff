extends CharacterBody2D

@export var player: Node
var texture1 = preload("res://art/asteroid1.png")
var texture2 = preload("res://art/asteroid2.png")
var texture3 = preload("res://art/asteroid3.png")
var rng = RandomNumberGenerator.new()
var chance = rng.randi_range(1, 3)
var speed = 0.0;


func _ready():
	rng.randomize()
	if (chance == 1):
		$Sprite2D.texture = texture1
	elif (chance == 2):
		$Sprite2D.texture = texture2
	else:
		$Sprite2D.texture = texture3

func _physics_process(delta: float) -> void:
	if chance == 1:
		speed = 40.0
	elif chance == 2:
		speed = 50.0
	else:
		speed = 60.0
	var direction = (player.position - position)
	if direction:
		velocity = direction.normalized() * speed
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "bullet_area":
		queue_free()
