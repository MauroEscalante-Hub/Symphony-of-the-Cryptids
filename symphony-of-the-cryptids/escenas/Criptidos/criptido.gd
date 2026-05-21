class_name  Criptido
extends CharacterBody2D

@export var PuntoaSeguir : Marker2D
@export var MiJugador: Personaje
var jugador_actual = null
@export var Velocidad: int = 50
@export var Danio_ataque = 100
@export var TiempoMax = 2.5
var TiempoEncantado = 0.0
@export var secuencia = ["up", "down", "left", "right"]
var indice = 0
var velocidad_encantado:int = 20
var Perseguir: bool = false
var encantado: bool = false


func _ready():
	print("empieza")
	Perseguir = false
	encantado = false

func _physics_process(_delta):
	
	if encantado:
		Estado_encantado(_delta)
	
	elif PuntoaSeguir != null:
		Punto_Objetivo()
	
	else:
		Estado_idle()
	
	move_and_slide()


func Estado_encantado(_delta):
	TiempoEncantado -= _delta
	velocity = (MiJugador.global_position - global_position).normalized() * velocidad_encantado
	
	if TiempoEncantado <= 0:
		encantado = false

func Estado_idle():
	velocity = Vector2.ZERO

func Punto_Objetivo():
	var direccion = (PuntoaSeguir.global_position - global_position).normalized()
	
	velocity = direccion * Velocidad
	pass

func obtenerSecuencia():
	return secuencia

func fallar():
	encantado = false
	print("Se enojo el bicho")

func siguiente_nota(nota):
	print("Recibí: ", nota)
	if nota == secuencia[indice]:
		print("Bien")
		indice += 1
		
		if indice >= secuencia.size():
			print("SECUENCIA COMPLETA")
			print("Criptido encantado")
			
			encantado = true
			indice = 0
			TiempoEncantado = TiempoMax
		
	else:
		print("Mal")
		fallar()
		indice = 0



func _on_area_2d_area_entered(area):
	var collider = area.get_parent()
	if collider is Personaje:
		MiJugador = collider
		print("Algo entro: ", MiJugador.MiNombre())
	


func _on_area_2d_area_exited(area):
	var collider = area.get_parent()

	if collider == MiJugador:
		print("Algo salio")
		MiJugador = null
	




func _on_areade_danio_body_entered(body):
	if body is Personaje:
		jugador_actual = body
		print("El jugador entro: ", jugador_actual.MiNombre())
		if encantado == false:
			print("Atacando al jugador: ", jugador_actual.MiNombre())
			jugador_actual.ReciboDanio(Danio_ataque)

	pass # Replace with function body.


func _on_areade_danio_body_exited(body):
	jugador_actual = null
	pass # Replace with function body.
