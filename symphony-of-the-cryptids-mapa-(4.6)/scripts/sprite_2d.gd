extends Sprite2D

@export var VelocidadScroll = 100
@export var Tocar = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= VelocidadScroll * delta
	if position.x < 540:
		queue_free()
		
	if Input.is_action_just_pressed(Tocar) and position.x >= 555:
		queue_free()
		print(Tocar)
		
