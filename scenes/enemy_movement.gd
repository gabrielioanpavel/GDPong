extends CharacterBody2D

@export var SPEED = 400.0
@export var speed_up := 1.5 # value to speed up the vertical velocity of the ball
@export var speed_down := 0.92 # value to speed down the vertical velocity of the ball

@onready var hit_sound = $"../hit"

var direction := Vector2.ZERO # helper varaible for the ball's direction
var dir: int # the direction of the player
var is_moving # helper variable to record player movement
var ball_chase = false
var ball = null

func get_dir():
	var deadzone = 15
	var diff = ball.global_position.y - global_position.y
	
	if abs(diff) < deadzone:
		return 0
	elif diff > 0:
		return 1
	else:
		return -1

func _physics_process(_delta):
	if ball_chase:
		dir = get_dir()
		velocity.y = dir * SPEED
		is_moving = true
	else:
		velocity.y = 0
		is_moving = false
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	# Reflect ball
	if "direction" in body:
		body.direction.x *= -1
		
		# If ball was hit while player is moving
		if is_moving:
			if speed_up > 1.5:
				speed_up = 1.5
			if speed_up < 1:
				speed_up = 1
				
			body.direction.y *= speed_up
			body.SPEED *= 1.1
			speed_up -= 0.15
			
			# Reflect the ball based on the direction of the player's movement
			if dir == 1:
				if body.direction.y < 0:
					body.direction.y *= -1
			else:
				if body.direction.y > 0:
					body.direction.y *= -1
		else:
			body.SPEED *= speed_down
			if body.SPEED < 300:
				body.SPEED = 300
				
	# Play hit sound effect
	hit_sound.pitch_scale = randf_range(0.8, 1.3)
	hit_sound.play()

func _on_area_2d_2_body_entered(body):
	ball = body
	ball_chase = true

func _on_area_2d_2_body_exited(_body):
	ball = null
	ball_chase = false
