extends Node2D

@onready var p_1_score = $P1_SCORE
@onready var p_2_score = $P2_SCORE
@onready var point = $point
@onready var hit_sound = $hit

var screen_center := Vector2(640, 345)

func _process(_delta):
	if Input.is_action_just_pressed("menu"):
		Main.p1_score = 0
		Main.p2_score = 0
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	p_1_score.text = str(Main.p1_score)
	p_2_score.text = str(Main.p2_score)
	
func _on_world_border_body_entered(body):
	# Play hit sound effect
	hit_sound.pitch_scale = randf_range(0.8, 1.3)
	hit_sound.play()
	body.direction.y *= -1

func _on_left_body_entered(body):
	point.play()
	Main.p2_score += 1
	body.queue_free()
	var e = preload("res://scenes/ball.tscn").instantiate()
	e.global_position = screen_center
	call_deferred("add_child", e)

func _on_right_body_entered(body):
	point.play()
	Main.p1_score += 1
	body.queue_free()
	var e = preload("res://scenes/ball.tscn").instantiate()
	e.global_position = screen_center
	call_deferred("add_child", e)
