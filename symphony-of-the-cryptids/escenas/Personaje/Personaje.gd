class_name Personaje
extends CharacterBody2D

@export var Velocidad: int = 200
var Direccion
var InputFlechas = []
var criptido_actual = null
@export var Mivida: int = 1000
var Nombre: String = "Lucas"


func _physics_process(_delta):
	
	var Direccion = Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo")
	DetectarInput()
	
	if Direccion:
		velocity = Direccion * Velocidad
	else:
		velocity = Vector2.ZERO
	move_and_slide()


func DetectarInput():
	if Input.is_action_just_pressed("ui_up"):
		enviar_input("up")
	
	if Input.is_action_just_pressed("ui_down"):
		enviar_input("down")
	
	if Input.is_action_just_pressed("ui_left"):
		enviar_input("left")
	
	if Input.is_action_just_pressed("ui_right"):
		enviar_input("right")

func enviar_input(nota):
	if criptido_actual != null:
		criptido_actual.siguiente_nota(nota)

func ReciboDanio(cantidaddeDanio: int):
	Mivida -= cantidaddeDanio
	print("Mi VIDA: ", Mivida)
	if Mivida <= 0:
		queue_free()
	

func MiNombre():
	return Nombre

func _on_area_2d_area_entered(area):
	var collider = area.get_parent()
	if collider is Criptido:
		criptido_actual = collider
		print("Entraste en rango de un Criptido", criptido_actual)

		var secuencia = criptido_actual.obtenerSecuencia()
		print("Secuencia:", secuencia)

	pass # Replace with function body.


func _on_area_2d_area_exited(area):
	if area.get_parent() == criptido_actual:
		print("Saliste del rango del Criptido")
		criptido_actual = null
	pass # Replace with function body.
