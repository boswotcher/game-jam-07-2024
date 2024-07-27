extends Node

@onready var origin_position_nodes = [
	get_node("/root/World/Spawners/EnemySpawner_0"), 
	get_node("/root/World/Spawners/EnemySpawner_1"), 
	get_node("/root/World/Spawners/EnemySpawner_2"), 
	get_node("/root/World/Spawners/EnemySpawner_3"), 
	get_node("/root/World/Spawners/EnemySpawner_4"), 
	get_node("/root/World/Spawners/EnemySpawner_5"), 
	get_node("/root/World/Spawners/EnemySpawner_6"), 
	get_node("/root/World/Spawners/EnemySpawner_7")
]

@onready var enemy_template = preload("res://Scenes/entities/enemies/enemy_template.tscn")
@onready var experienceDrop = preload("res://Scenes/entities/pickup/experience/experience.tscn")

@onready var enemy_nodes = get_node("/root/World/Enemies")
@onready var player_node = get_node("/root/World/Player")

@onready var rng = RandomNumberGenerator.new()

var enemies = [];
var timer: Timer;

var monster_base_health = 5;
var bonus_health=0;

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 1
	add_child(timer)
	timer.timeout.connect(func():
		var enemy = enemy_template.instantiate()
		#enemy.position = player_node.position
		enemy.position = origin_position_nodes[rng.randf_range(0, 7)].position
		enemy.set_max_health(monster_base_health+bonus_health)
		enemy.connect("enemy_death", on_enemy_death);
		enemy.set_player(player_node);
		enemy_nodes.add_child(enemy)
		enemies.push_back(enemy)
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#for now, spawn 4 enemies every 3 seconds
	pass
	
func toggle_pause(pause: bool):
	timer.paused = pause;
	
	for enemy in enemies:
		enemy.toggle_pause(pause);
		
func adjust_buffs(minutes_elapsed):
	bonus_health = minutes_elapsed;

func on_enemy_death(enemy: CharacterBody2D):
	var enemyLoc = enemy.global_position;
	enemies.erase(enemy)
	enemy.queue_free()
	var newXP = experienceDrop.instantiate();
	enemy_nodes.add_child(newXP)
	newXP.position = enemyLoc;
	pass
