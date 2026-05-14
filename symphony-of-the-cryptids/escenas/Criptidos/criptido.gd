class_name  Criptido
extends CharacterBody2D

@export var MiJugador : Personaje
@export var Velocidad: int = 50
var velocidad_encantado:int = 20
var direccion_actual
var direccion = [Vector2.ZERO, Vector2.LEFT,Vector2.RIGHT,Vector2.UP,Vector2.ZERO, Vector2.DOWN]
var Perseguir: bool = false
@export var secuencia = ["up", "down", "left", "right"]
var indice = 0
var encantado: bool = false
var TiempoEncantado = 0.0
@export var TiempoMax = 2.5

func _ready():
	Direccion_aleatoria()
	pass


func _physics_process(_delta):
	if MiJugador == null:
		return
	if encantado:
		TiempoEncantado -= _delta
		velocity = (MiJugador.global_position - global_position).normalized() * velocidad_encantado
		
		if TiempoEncantado <= 0:
			encantado = false
			
	if Perseguir == true:
		velocity = (MiJugador.global_position - global_position).normalized() * Velocidad
	
	else:
		velocity = direccion_actual * Velocidad
	move_and_slide()



func Direccion_aleatoria():
	direccion_actual = direccion.pick_random()
	await get_tree().create_timer(1.7).timeout
	Direccion_aleatoria()
	pass

func obtenerSecuencia():
	return secuencia

func siguiente_nota(nota):
	print("Recibí:", nota)
	if nota == secuencia[indice]:
		print("Bien!")
		indice += 1
		if indice >= secuencia.size():
			print("SECUENCIA COMPLETA")
			encantar()
			indice = 0
	else:
		print("Mal")
		fallar()
		indice = 0

func encantar():
	print("Criptido encantado")
	encantado = true

func fallar():
	encantado = false
	print("Se enojo el bicho")

func _on_area_2d_area_entered(area):
	Perseguir = true
	var collider = area.get_parent()
	if collider is Personaje:
		MiJugador = collider
	print("Algo entro: ", MiJugador._Nombre())
	
	pass # Replace with function body.


func _on_area_2d_area_exited(area):
	Perseguir = false
	pass # Replace with function body.
