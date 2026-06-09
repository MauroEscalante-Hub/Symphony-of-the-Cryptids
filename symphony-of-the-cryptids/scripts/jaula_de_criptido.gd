class_name Jaula
extends Area2D

@onready var Centro = $CentrodeLaJaula
@export var Criptido_actual: Criptido
@export var Criptidos_Enjaulados: int = 0
@export var Cantidad_De_Criptidos: int = 1

func _ready():
	Criptido_actual = null


func _on_body_entered(body):
	if body is Criptido:
		Criptido_actual = body
		print("El criptido ingreso a la jaula")
		body.Estado_enjaulado()
		Criptidos_Enjaulados =+ 1
		if Criptidos_Enjaulados == Cantidad_De_Criptidos:
			get_tree().change_scene_to_file("res://escenas/gameover_y_pantalla_final/game_over.tscn")
	
