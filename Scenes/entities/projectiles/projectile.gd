extends CharacterBody2D

@export var speed = 650.0;
@onready var kill_timer = $KillTimer;
@export var kill_wait = 15.0; 
var damage = 1;
var dir = "east";
var paused = false;

func _ready():
	kill_timer.wait_time = kill_wait;
	kill_timer.start()

func _physics_process(delta):
	if !paused:
		match(dir):
			"east":
				position += transform.x * speed * delta;
			"west":
				position += transform.x * speed * delta * -1;
			"south":
				position += transform.y * speed * delta;
			"north":					
				position += transform.y * speed * delta * -1;
				
		var collided = move_and_slide()
		
		if(collided):
			for i in get_slide_collision_count():
				var collision = get_slide_collision(i);
				if collision.get_collider().has_method("on_hit"):
					collision.get_collider().on_hit(damage);
					queue_free();
	
func toggle_pause(pause:bool):
	paused = pause;
	kill_timer.paused = pause;

func set_dir(_dir):
	dir = _dir;

func _on_kill_timer_timeout():
	queue_free()
