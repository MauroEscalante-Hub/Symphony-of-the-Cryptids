class_name Jugador
extends CharacterBody2D

@export var Velocidad: int = 50
var Direccion
var InputFlechas = []
var criptido_actual = null

func _physics_process(_delta):
	
	var Direccion = Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo")
	velocity = Direccion * Velocidad
	
	
	
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
