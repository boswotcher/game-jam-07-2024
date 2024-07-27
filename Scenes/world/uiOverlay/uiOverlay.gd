extends Node2D

signal upgrade_modal_closed

func _on_go_to_death_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/death/deathScreen.tscn")
	pass # Replace with function body.


func _on_open_upgrades_button_pressed():
	$UpgradeModal.visible=true
	pass # Replace with function body.

func show_upgrades_modal():
	$UpgradeModal.visible=true
	pass # Replace with function body.


func _on_upgrade_modal_modal_closed():
	upgrade_modal_closed.emit();
	pass # Replace with function body.
