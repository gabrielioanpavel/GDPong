extends CharacterBody2D

@export var SPEED := 300
@export var SPEED_CAP := 400

var direction := Vector2(1, 0)

func get_side():
	pass

func _ready():
	if randf() < 0.5:
		direction.x = -1
	direction.y = randf_range(-1, 1)
	
func _physics_process(_delta):
	velocity = direction * SPEED
	move_and_slide()
