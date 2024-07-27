extends Control

func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	pass # Replace with function body.
