class_name Jaula
extends Area2D

@onready var Animation_player = $AnimationPlayer
@onready var Centro = $CentrodeLaJaula
@onready var Jaula_abierta = $JaulaAbierta 
@onready var Jaula_cerrada = $JaulaCerrada

@export var Cantidad_De_Criptidos: int = 4
@export var escena_nueva : PackedScene


var Criptido_actual: Criptido = null
var Criptidos_Enjaulados: int = 0

var Dinero_Generado: int = 0
var Dinero_Suficiente: int = 449
var Cuota_cumplida: bool = false

func _ready():
	Criptido_actual = null

func _process(delta: float) -> void:
	if Criptidos_Enjaulados > 0:
		Jaula_abierta.visible = false
		Jaula_cerrada.visible = true
	Plata_Generada()

func Plata_Generada():
	if Dinero_Generado > Dinero_Suficiente:
		Cuota_cumplida = true


func _on_body_entered(body):
	if body is Criptido:
		Criptido_actual = body
		print("El criptido ingresó a la jaula")
		Criptido_actual.Estado_enjaulado()
		Dinero_Generado += Criptido_actual.obtener_valor()
		Criptidos_Enjaulados += 1
		Dinero_Generado += 150
		DineroDejaula.criptido_encerrados = Criptidos_Enjaulados
		DineroDejaula.dinero_total = Dinero_Generado
		DineroDejaula.cantidad_bichos = Cantidad_De_Criptidos
		DineroDejaula.cuota = Cuota_cumplida
		print(Dinero_Generado, Cuota_cumplida)
		
		await get_tree().create_timer(0.5).timeout
		Criptido_actual = null
		
		if Criptidos_Enjaulados >= Cantidad_De_Criptidos or Cuota_cumplida == true:
			get_tree().change_scene_to_packed(escena_nueva)
