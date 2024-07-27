extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$uiOverlay.visible=true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_player_death():
	get_tree().change_scene_to_file("res://Scenes/death/deathScreen.tscn")
	pass # Replace with function body.


func _on_player_level_up():
	_pause_entities();
	$uiOverlay.show_upgrades_modal()
	pass # Replace with function body.

func _pause_entities():
	pass;
