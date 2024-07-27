extends ParallaxBackground



var direction = Vector2(1, 0)


func _process(delta):
	var speed: int = 1000
	var rotation_speed = 0.4
	scroll_offset += direction * speed * delta
	direction = direction.rotated(rotation_speed * delta)
