extends Control

var weapons: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	weapons = [];
	weapons.push_back($Weapon)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

func set_dir(dir):
	for weapon in weapons:
		weapon.set_dir(dir);

func toggle_pause(pause:bool):
	for weapon in weapons:
		weapon.toggle_pause(pause);
