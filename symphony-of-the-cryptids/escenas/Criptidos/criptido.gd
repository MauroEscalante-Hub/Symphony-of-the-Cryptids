extends CharacterBody2D
class_name Criptido

@onready var Animacion = $Sprite2D
@export var PuntoaSeguir: Array[Marker2D]
var punto_actual: Marker2D
@export var Unajaula: Jaula
@export var MiJugador: Personaje
var jugador_actual = null
@export var Velocidad: int = 50
@export var Danio_ataque: int
@export var TiempoMax = 2.5
var TiempoEncantado = 0.0
@export var secuencia = ["up", "down", "left", "right"]
var indice = 0
var velocidad_encantado:int = 110
var Perseguir: bool = false
var encantado: bool = false
var enjaulado: bool = false



#func _ready():
	#print("empieza")
	#
	#if PuntoaSeguir.size() > 0:
		#punto_actual = PuntoaSeguir.pick_random()
	#

#func _physics_process(_delta):
	#
	#if enjaulado == true:
		#Estado_enjaulado()
		#move_and_slide()
		#return
	#
	#if encantado:
		#Estado_encantado(_delta)
		##Animacion.play()
	#
	#elif punto_actual != null:
		##Animacion.play()
		#Punto_Objetivo()
	#
	#
	#else:
		#Estado_idle()
		##Animacion.stop()
	#
	#move_and_slide()


func Estado_encantado(_delta):
	TiempoEncantado -= _delta
	
	if MiJugador != null:
		velocity = (MiJugador.global_position - global_position).normalized() * velocidad_encantado
	
	if TiempoEncantado <= 0:
		encantado = false

func Estado_idle():
	velocity = Vector2.ZERO

func Estado_enjaulado():
	enjaulado = true
	velocity = (Unajaula.global_position - global_position).normalized() * velocidad_encantado
	
	
	if global_position.distance_to(Unajaula.Centro.global_position) < 10:
		queue_free()

func Punto_Objetivo():
	var direccion = (punto_actual.global_position - global_position).normalized()
	
	velocity = direccion * Velocidad
	
	if global_position.distance_to(punto_actual.global_position) < 10:
		siguiente_punto()
	

func siguiente_punto():
	
	var nuevo_punto = punto_actual
	
	while nuevo_punto == punto_actual and PuntoaSeguir.size() > 1:
		nuevo_punto = PuntoaSeguir.pick_random()
	
	punto_actual = nuevo_punto
	print("Nuevo destino: ", punto_actual.name)

func obtenerSecuencia():
	return secuencia

func fallar():
	encantado = false
	print("Se enojo el bicho")
	TiempoEncantado = 0
	
	if jugador_actual != null:
		jugador_actual.ReciboDanio(Danio_ataque)

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
		return true
	else:
		print("Mal")
		fallar()
		indice = 0
		return false

#func _on_area_2d_area_entered(area):
	#var collider = area.get_parent()
	#if collider is Personaje:
		#MiJugador = collider
	#
#
#func _on_area_2d_area_exited(area):
	#var collider = area.get_parent()
	#
	#if collider == MiJugador:
		#print("Algo salio")
		#MiJugador = null
	#
#
#func _on_areade_danio_body_entered(body):
	#if body is Personaje:
		#jugador_actual = body
		#$DanioTimer.start(0.5)
#
#func _on_areade_danio_body_exited(body):
	#if body == jugador_actual:
		#jugador_actual = null
		#$DanioTimer.stop()
	#
#
#func _on_danio_timer_timeout():
	#if jugador_actual != null and encantado == false:
		#jugador_actual.ReciboDanio(Danio_ataque)
	#
