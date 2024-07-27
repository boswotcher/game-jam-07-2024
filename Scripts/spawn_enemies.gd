extends Node

@onready var origin_position = [0, 1, 2, 3, 4, 5, 6, 7, 8];
@onready var enemy_texture = load("res://icon.svg")

@onready var enemy_template = preload("res://Scenes/EnemyTemplate.tscn")

@onready var enemy_nodes = get_node("/root/Main/Enemies")
@onready var player_node = get_node("/root/Main/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 3
	add_child(timer)
	timer.timeout.connect(func():
		print("hello")
		var enemy = enemy_template.instantiate()
		enemy.position = player_node.position
		enemy_nodes.add_child(enemy)
		#var node = Sprite2D.new()
		#node.texture = enemy_texture
		#add_child(node)
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#for now, spawn 4 enemies every 3 seconds
	pass
