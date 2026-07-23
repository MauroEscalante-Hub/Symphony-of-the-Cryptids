class_name UiBarra
extends Control

@onready var flecha_D_interaccion = $flechaInput
var twenn: Tween

func _ready():
	flecha_D_interaccion.visible = false


func mostrar_nota(nota: String, comprobarNota: bool):
	if twenn:
		twenn.kill()
		
	flecha_D_interaccion.visible = true
	flecha_D_interaccion.modulate.a = 1.0
	
	flecha_D_interaccion.position = Vector2(randf_range(0, 399),randf_range(0, 110))
	
	match nota:
		"up":
			flecha_D_interaccion.rotation_degrees = 180
		"down":
			flecha_D_interaccion.rotation_degrees = 0
		"left":
			flecha_D_interaccion.rotation_degrees = 90
		"right":
			flecha_D_interaccion.rotation_degrees = 270
	
	correctaOincorrecta(comprobarNota)
	
	animarFlecha()


func animarFlecha():
	twenn = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	twenn.tween_property(flecha_D_interaccion,"position",flecha_D_interaccion.position + Vector2(0, -80),1)
	
	twenn.parallel().tween_property(flecha_D_interaccion,"modulate:a",0.0,1)
	

func correctaOincorrecta(nota: bool):
	if nota == true:
		flecha_D_interaccion.modulate = Color.GREEN_YELLOW
		
	else:
		flecha_D_interaccion.modulate = Color.DARK_RED
		
	
