class_name MainMenu
extends Control

@onready var click = $click

func _on_vs_player_pressed():
	click.play()
	get_tree().change_scene_to_file("res://scenes/vs_player.tscn")

func _on_vs_computer_pressed():
	click.play()
	get_tree().change_scene_to_file("res://scenes/vs_computer.tscn")

func _on_quit_pressed():
	click.play()
	get_tree().quit()
