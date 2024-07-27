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

@onready var enemy_nodes = get_node("/root/World/Enemies")
@onready var player_node = get_node("/root/World/Player")

@onready var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 3
	add_child(timer)
	timer.timeout.connect(func():
		var enemy = enemy_template.instantiate()
		#enemy.position = player_node.position
		enemy.position = origin_position_nodes[rng.randf_range(0, 7)].position
		enemy.set_player(player_node);
		enemy_nodes.add_child(enemy)
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#for now, spawn 4 enemies every 3 seconds
	pass
