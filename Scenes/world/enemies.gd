extends Node

@onready var enemy_template = preload("res://Scenes/enemies/enemy_template.tscn")

@onready var enemy_nodes = get_node("/root/World/Enemies")
@onready var player_node = get_node("/root/World/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 3
	add_child(timer)
	timer.timeout.connect(func():
		var enemy = enemy_template.instantiate()
		enemy.position = player_node.position
		enemy_nodes.add_child(enemy)
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#for now, spawn 4 enemies every 3 seconds
	pass
