extends Control

func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/character_selection/character_selection.tscn")
	pass # Replace with function body.
