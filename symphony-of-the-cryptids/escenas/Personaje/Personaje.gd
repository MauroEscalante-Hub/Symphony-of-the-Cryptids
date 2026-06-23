extends CharacterBody2D
class_name Personaje



@export var UI_Encantamiento: PackedScene
@export var Velocidad: int = 250
@export var Mivida: int = 200
@onready var Barra_de_Salud = $CanvasLayer/BarraDeSalud
@onready var Animacion = $SpriteJugador
@onready var Audio_Do = $Audio_Do
@onready var Audio_Mi = $Audio_Mi
@onready var Audio_Si = $Audio_Si
@onready var Audio_Sol = $Audio_Sol
var Nota: Nota_Flauta
var Direccion
var InputFlechas = []
var criptido_actual = null
const MiVidaMaxíma: int = 200
var ui_actual = null
var EstasVivo: bool = true
var puede_moverse: bool = true
signal  entre 

func _onready():
	Mivida = MiVidaMaxíma
	Barra_de_Salud.value = Mivida


func _physics_process(_delta):
	Barra_de_Salud.value = Mivida
	
	if not puede_moverse:
		velocity = Vector2.ZERO
		Animacion.stop()
		move_and_slide()
		return
	
	var Direccion = Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo")
	if Input.is_action_just_pressed("Derecha"):
		Animacion.flip_h = true
	if Input.is_action_just_pressed("Izquierda"):
		Animacion.flip_h = false
	DetectarInput()
	
	
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
		Audio_Do.play()
		enviar_input("up")
	
	if Input.is_action_just_pressed("ui_down"):
		Audio_Mi.play()
		enviar_input("down")
		
	
	if Input.is_action_just_pressed("ui_left"):
		Audio_Si.play()
		enviar_input("left")
		
	
	if Input.is_action_just_pressed("ui_right"):
		Audio_Sol.play()
		enviar_input("right")


func enviar_input(nota):
	if criptido_actual != null:
		
		var correcta = criptido_actual.siguiente_nota(nota) 
		if ui_actual != null:
			ui_actual.mostrar_nota(nota, correcta)
		criptido_actual.mostrar_nota(nota, correcta)

func ReciboDanio(cantidaddeDanio: int):
	Mivida -= cantidaddeDanio
	print("Mi VIDA: ", Mivida)
	if Mivida <= 0:
		GameOver()
	

func recibir_aullido():
	puede_moverse = false
	print("Estoy asustado por el aullido")
	await get_tree().create_timer(1.0).timeout
	puede_moverse = true
	

func _on_area_2d_area_entered(area):
	var collider = area.get_parent()
	if collider is Criptido:
		criptido_actual = collider
		print("Entraste en rango de un Criptido", criptido_actual)
		
		criptido_actual.obtenerSecuencia()
		#if ui_actual == null:
			#ui_actual = UI_Encantamiento.instantiate()
			#add_child(ui_actual)
			#ui_actual.position = Vector2(-150,70)
	



func _on_area_2d_area_exited(area):
	if area.get_parent() == criptido_actual:
		print("Saliste del rango del Criptido")
		criptido_actual = null
		if ui_actual != null:
			ui_actual.queue_free()
			ui_actual = null
		
	
