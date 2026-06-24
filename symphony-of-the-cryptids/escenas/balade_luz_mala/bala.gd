extends Area2D

var direccion: Vector2
var velocidad: int = 200
var danio: int = 30

func _physics_process(delta):
	position += direccion * velocidad * delta
	


func _on_body_entered(body):
	if body is Personaje:
		body.ReciboDanio(danio)
		queue_free()


func _on_timer_timeout():
	queue_free()
