extends CharacterBody2D

var Velocidad: int = 50
var direccion_actual
var direccion = [Vector2.ZERO, Vector2.LEFT,Vector2.RIGHT,Vector2.UP,Vector2.ZERO, Vector2.DOWN]


func _ready():
	Direccion_aleatoria()
	pass


func _physics_process(_delta):
	if Direccion_aleatoria:
		velocity = direccion_actual * Velocidad
		
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func Direccion_aleatoria():
	direccion_actual = direccion.pick_random()
	await get_tree().create_timer(1.7).timeout
	Direccion_aleatoria()
	pass
