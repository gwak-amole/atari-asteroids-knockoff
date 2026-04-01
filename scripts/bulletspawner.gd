extends Node
@export var bullet: PackedScene
@export var player: Node
var cooldown = 2.0

func _ready():
	Signalbus.fire.connect(_spawn_bullet)
	
func _spawn_bullet():
	var instance = bullet.instantiate()
	instance.position = player.position;
	add_child(instance)
	instance.position = player.position;
