extends Node

@export var heart_container: HBoxContainer
@export var cooldown_timer: Timer
var hp = 3
var gameover = false

func _ready():
	Signalbus.lose_life.connect(_lose_life)
	for heart in heart_container.get_children():
		heart.show()

func _lose_life():
	if cooldown_timer.is_stopped():
		hp -= 1
		heart_container.get_child(hp).hide()
		if (hp == 0):
			gameover = true
		cooldown_timer.start()
