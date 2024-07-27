extends Control

const projectile = preload("res://Scenes/entities/projectiles/projectile.tscn")
@onready var shoot_timer = $ShootTimer;
@export var damage = 4;
@export var shoot_timer_wait_time = 0.3;

var dir;

func _ready():
	shoot_timer.wait_time = shoot_timer_wait_time;
	shoot_timer.start()

func toggle_pause(pause:bool):
	shoot_timer.paused = pause;
		
func _on_shoot_timer_timeout():
	var new_projectile = projectile.instantiate()
	get_tree().root.add_child(new_projectile);
	new_projectile.set_dir(dir);
	new_projectile.scale.x = 1.0
	new_projectile.scale.y = 1.0
	new_projectile.position = self.global_position

func set_dir(_dir):
	dir = _dir;
