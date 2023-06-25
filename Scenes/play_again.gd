extends Node2D


func _on_yes_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/test_main.tscn")

func _on_no_button_pressed():
	pass # Replace with function body.
