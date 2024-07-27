extends CharacterBody2D

var player
var speed = 200.0
var damage = 1

var paused = false;
var entityType = "enemy"

@export var max_collisions := 6

signal enemy_death(enemy)
signal touch_player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_player(playernode):
	player= playernode;
	pass
	
func set_max_health(_health):
	$Attributes.init(_health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !paused:
		var velocity = global_position.direction_to(player.global_position);
		var collision = move_and_collide(speed*velocity*delta)
		if(collision):
			var collider = collision.get_collider();
			if collider.has_method("on_hit") and collider.entityType != entityType:
				collision.get_collider().on_hit(damage);

func toggle_pause(pause: bool):
	if pause != null:
		paused = pause;
	else:
		paused = !paused;

func _on_attributes_entity_death():
	enemy_death.emit(self);

func on_hit(damage):
	$Attributes.takeDamage(damage);
