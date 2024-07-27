extends CharacterBody2D

var player
var speed = 200.0
var damage = 1

var paused = false;

@export var max_collisions := 6

signal enemy_death(enemy)
signal touch_player

# Called when the node enters the scene tree for the first time.
func _ready():
	$Attributes.init(5)
	pass # Replace with function body.

func set_player(playernode):
	player= playernode;
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !paused:
		var velocity = global_position.direction_to(player.global_position);
		var collision = move_and_collide(speed*velocity*delta)
		if(collision):
			var collider = collision.get_collider();
			if collision.get_collider().has_method("onCollision"):
				collision.get_collider().onCollision(damage);
				enemy_death.emit(self)

func toggle_pause(pause: bool):
	if pause != null:
		paused = pause;
	else:
		paused = !paused;

func _on_attributes_entity_death():
	enemy_death.emit(self)
	pass # Replace with function body.
