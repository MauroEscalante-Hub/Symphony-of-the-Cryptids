extends Area2D

var direccion: Vector2
@export var velocidad: int = 0
var danio: int = 30

func _physics_process(delta):
	position += direccion * velocidad * delta
	
