class_name Jaula
extends Area2D

@onready var Animation_player = $AnimationPlayer
@onready var Centro = $CentrodeLaJaula
@export var Criptido_actual: Criptido
@export var Criptidos_Enjaulados: int = 0
@export var Cantidad_De_Criptidos: int = 1
var Dinero_Generado: int = 0
var Dinero_Suficiente: int = 200
var Cuota_cumplida: bool = false

const Fade = preload("res://escenas/nivel/escenario.gd")
var script_jaula = Fade.new()

func _ready():
	Criptido_actual = null

#func _process(delta: float) -> void:
#	Plata_Generada()
 
func Plata_Generada():
	if Dinero_Generado > Dinero_Suficiente:
		Cuota_cumplida = true

func _on_body_entered(body):
	if body is Criptido:
		Criptido_actual = body
		print("El criptido ingreso a la jaula")
		body.Estado_enjaulado()
		Criptidos_Enjaulados =+ 1
		Dinero_Generado =+ 250
		Plata_Generada()
		#print(Dinero_Generado)
		if Criptidos_Enjaulados == Cantidad_De_Criptidos and Cuota_cumplida == true:
			#script_jaula.Fadeout
			get_tree().change_scene_to_file("res://escenas/gameover_y_pantalla_final/pantalla_ganaste.tscn")
			
	
