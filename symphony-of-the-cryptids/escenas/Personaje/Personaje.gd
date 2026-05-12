extends CharacterBody2D

@export var Velocidad: int = 50

func _physics_process(_delta):
	
	var Direccion = Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo")
	velocity = Direccion * Velocidad
	
	
	
	move_and_slide()
