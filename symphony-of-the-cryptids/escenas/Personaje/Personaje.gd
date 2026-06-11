class_name Personaje
extends CharacterBody2D

@export var UI_Encantamiento: PackedScene
@export var Velocidad: int = 200
var Direccion
var InputFlechas = []
var criptido_actual = null
@export var Mivida: int = 200
const MiVidaMaxíma: int = 200
var Nombre: String = "Lucas"
var ui_actual = null
var EstasVivo: bool = true
@onready var Barra_de_Salud = $CanvasLayer/BarraDeSalud
@onready var Animacion = $SpriteJugador

func _onready():
	Mivida = MiVidaMaxíma
	Barra_de_Salud.value = Mivida


func _physics_process(_delta):
	Barra_de_Salud.value = Mivida
	
	var Direccion = Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo")
	if Input.is_action_just_pressed("Derecha"):
		Animacion.flip_h = true
	if Input.is_action_just_pressed("Izquierda"):
		Animacion.flip_h = false
	DetectarInput()
	
	#if Mivida <= 0:
	#GameOver()
	#Esto ya no sirve
	
	if Direccion:
		velocity = Direccion * Velocidad
		Animacion.play()
	else:
		velocity = Vector2.ZERO
		Animacion.stop()
	move_and_slide()

func GameOver():
	get_tree().change_scene_to_file("res://escenas/gameover_y_pantalla_final/game_over.tscn")

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
		
		var notaDflecha = criptido_actual.siguiente_nota(nota) 
	
		if ui_actual != null:
			ui_actual.mostrar_nota(nota, notaDflecha)
	

func ReciboDanio(cantidaddeDanio: int):
	Mivida -= cantidaddeDanio
	print("Mi VIDA: ", Mivida)
	if Mivida <= 0:
		GameOver()
	

func MiNombre():
	return Nombre

func _on_area_2d_area_entered(area):
	var collider = area.get_parent()
	if collider is Criptido:
		criptido_actual = collider
		print("Entraste en rango de un Criptido", criptido_actual)

		var secuencia = criptido_actual.obtenerSecuencia()
		print("Secuencia:", secuencia)
		
		if ui_actual == null:
			ui_actual = UI_Encantamiento.instantiate()
			add_child(ui_actual)
			ui_actual.position = Vector2(-150,70)

	pass # Replace with function body.


func _on_area_2d_area_exited(area):
	if area.get_parent() == criptido_actual:
		print("Saliste del rango del Criptido")
		criptido_actual = null
		if ui_actual != null:
			ui_actual.queue_free()
			ui_actual = null
		
	pass # Replace with function body.
