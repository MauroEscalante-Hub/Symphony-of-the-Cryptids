class_name Jaula
extends Area2D

@onready var Centro = $CentrodeLaJaula
@export var Criptido_actual: Criptido

func _ready():
	Criptido_actual = null


func _on_body_entered(body):
	if body is Criptido:
		Criptido_actual = body
		print("El criptido ingreso a la jaula")
		body.Estado_enjaulado()
	
