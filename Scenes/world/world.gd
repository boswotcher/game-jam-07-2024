extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_player_death():
	get_tree().change_scene_to_file("res://Scenes/death/deathScreen.tscn")
	pass # Replace with function body.


func _on_player_level_up():
	_toggle_pause_entities(true);
	#$uiOverlayd.show_upgrades_modal()
	pass # Replace with function body.

func _toggle_pause_entities(pause:bool):
	$Player.toggle_pause(pause);
	$Enemies.toggle_pause(pause);
	pass;

func _on_player_pause(v):
	_toggle_pause_entities(v);


func _on_player_minute_timer(minutes):
	$Enemies.adjust_buffs(minutes)
	pass # Replace with function body.
