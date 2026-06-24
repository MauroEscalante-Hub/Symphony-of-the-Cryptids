extends CharacterBody2D
class_name Criptido

@export var jugador: Personaje
@export var secuencia = ["up", "down", "left", "right"]
@export var punto_inicial: Array[Marker2D]
@export var la_jaula: Jaula
@export var velocidad: int = 60
@export var danio_de_ataque: int
@export var nota_encantada: PackedScene
@export var TiempoMax = 3.0
@onready var Animacion = $Sprite2D

var punto_actual: Marker2D
var jugador_actual = null
var TiempoEncantado = 0.0
var indice = 0
var velocidad_encantado:int = 110
var Perseguir: bool = false
var encantado: bool = false
var enjaulado: bool = false
var ui_actual = null



func Estado_Idle():
	pass

func Estado_encantado(delta):
	TiempoEncantado -= delta  
	
	if jugador != null:
		velocity = (jugador.global_position - global_position).normalized() * velocidad_encantado
	
	if TiempoEncantado <= 0:
		encantado = false
	


func obtener_valor():
	pass


func Estado_enjaulado():
	enjaulado = true 
	velocity = (la_jaula.global_position - global_position).normalized() * velocidad_encantado
	
	
	if global_position.distance_to(la_jaula.Centro.global_position) < 10:
		queue_free()
	pass


func Punto_Objetivo():
	var direccion = (punto_actual.global_position - global_position).normalized()
	
	velocity = direccion * velocidad
	
	if global_position.distance_to(punto_actual.global_position) < 10:
		print("puntocerca")
	
		var nuevo_punto = punto_actual
		
		while nuevo_punto == punto_actual and punto_inicial.size() > 1:
			nuevo_punto = punto_inicial.pick_random()
		
		punto_actual = nuevo_punto
		print("Nuevo destino: ", punto_actual.name)

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
	pass

func obtenerSecuencia():
	return secuencia

func fallar():
	encantado = false
	print("Se enojo el bicho")
	TiempoEncantado = 0
	pass


func mostrar_nota(nota: String, correcta: bool):
	if ui_actual == null:
		ui_actual = nota_encantada.instantiate()
		add_child(ui_actual)
		ui_actual.position = Vector2(-150, 70)
	ui_actual.mostrar_nota(nota, correcta)
	
