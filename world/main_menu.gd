extends Node2D

func _on_ready() -> void:
	%AnimationPlayer.play("main_menu")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world/world.tscn")
