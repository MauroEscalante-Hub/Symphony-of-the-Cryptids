extends CanvasLayer

@onready var Canvas_Layer = $CanvasLayer
#este de arriba no hacía falta
@onready var Animation_Player = $CanvasLayer/AnimationPlayer

func _ready():
	Animation_Player.play("Texto")
	await Animation_Player.animation_finished
	CambiarEscena()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("SaltarMapa"):
		Animation_Player.play("Skip")
		CambiarEscena()

func CambiarEscena():
	get_tree().change_scene_to_file("res://escenas/nivel/escenario_tutorial.tscn")
#HICE ESTA FUNCION PARA CHEQUEAR UN ERROR ME TIRABA EL SALTAR MAPA, NO SE POR QUE 
#TIRABA NULL Y CRASEHABA, AL FINAL RESULTO QUE ESTABA BIEN SOLO QUE EL "AWAIT"
#EN EL PROCESS EXPLOTABA LA ESCENA, NI IDEA POR QUE.
