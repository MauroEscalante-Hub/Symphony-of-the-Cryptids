extends Criptido
class_name  Lobizon


@onready var TiempoDeDanio = $Timer
var embistiendo = false
var direccion_embestida = Vector2.ZERO
var velocidad_embestida = 150
var duracion_embestida = 0.5

var _pomberito_actual = null
var comida: bool = false

func _ready():
	print("empieza")
	
	if punto_inicial.size() > 0:
		punto_actual = punto_inicial.pick_random()
	

func _physics_process(delta):
	if enjaulado:
		Estado_enjaulado()
		move_and_slide()
		return
	
	if encantado:
		print("ESTOY ENCANTADO")
		Estado_encantado(delta)
		move_and_slide()
		return
	
	if _pomberito_actual != null:
		perseguirEnemigo()
	
	else:
		Punto_Objetivo()
	
	move_and_slide()

func perseguirEnemigo():
	var nuevadireccion = (_pomberito_actual.global_position - global_position).normalized()
	if _pomberito_actual != null:
		
		velocity = nuevadireccion * velocidad
	

func Aullar():
	if jugador_actual == null:
		return
	
	print("AUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU")
	if jugador_actual != null:
		jugador_actual.recibir_aullido()
	

func _on_area_2d_area_entered(area):
	var collider = area.get_parent()
	if collider is Personaje:
		jugador_actual = collider
		print(jugador_actual)
		


func _on_area_2d_area_exited(area):
	var collider = area.get_parent()
	if collider is Personaje:
		jugador_actual = null
		print(jugador_actual)
		


func _on_areade_danio_body_entered(body):
	if body == jugador:
		jugador_actual = body
		TiempoDeDanio.start()
		Aullar()
		
	elif body is Pomberito:
		_pomberito_actual = body
		TiempoDeDanio.start()


func _on_areade_danio_body_exited(body):
	if body == jugador_actual:
		jugador_actual = null
		TiempoDeDanio.stop()
	elif body is Pomberito:
		_pomberito_actual = null
		TiempoDeDanio.stop()


func _on_timer_timeout():
	if _pomberito_actual != null:
		print("[Lobizon] El pombetiro que voy a comer ", _pomberito_actual)
		_pomberito_actual.recibir_danio(danio_de_ataque)
	elif jugador_actual != null and encantado == false:
		jugador_actual.ReciboDanio(danio_de_ataque)
