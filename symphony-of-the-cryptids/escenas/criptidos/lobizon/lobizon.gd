extends Criptido
class_name  Lobizon

@onready var animachiones = $AnimatedSprite2D
@onready var TiempoDeDanio = $Timer
@onready var Aullido = $AudioStreamPlayer2D
var me_empache = false
var cantidad_maxima_de_pomberitos = 0
var velocidad_original: int
var valorEspecial: int = 300
var _pomberito_actual = null
var comida: bool = false

func _ready():
	print("empieza")
	velocidad_original = velocidad
	
	if punto_inicial.size() > 0:
		punto_actual = punto_inicial.pick_random()
	

func _physics_process(delta):
	animachiones.play("Base")
	
	if enjaulado:
		Estado_enjaulado()
		move_and_slide()
		return
	
	if encantado:
		#print("ESTOY ENCANTADO")
		Estado_encantado(delta)
		move_and_slide()
		return
	
	if me_empache == true:
		#print("estoy empachado")
		animachiones.play("Mansito")
		estado_empachado()
		move_and_slide()
		return
	if _pomberito_actual != null:
		perseguirEnemigo()
		move_and_slide()
		return
	
	
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
	
	#print("AUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU")
	if jugador_actual != null:
		Aullido.play()
		jugador_actual.recibir_aullido()
	

func estado_empachado():
	cantidad_maxima_de_pomberitos += 1
	#print("Comidos:", cantidad_maxima_de_pomberitos)
	
	if cantidad_maxima_de_pomberitos >= 1:
		#print("ME EMPACHÉ")
		empachado()

func empachado():
	if me_empache:
		return
	
	me_empache = true
	velocidad = velocidad_original / 2
	#print("velocidad ahora: ",velocidad)
	_pomberito_actual = null
	
	await get_tree().create_timer(500.0).timeout
	
	velocidad = velocidad_original
	print("velocidad despues: ", velocidad)
	cantidad_maxima_de_pomberitos = 0
	me_empache = false

func obtener_valor():
	return valorEspecial

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
		var vida_del_enano = _pomberito_actual.recibir_danio(danio_de_ataque)
		if vida_del_enano <= 0:
			estado_empachado()
			_pomberito_actual = null
	elif jugador_actual != null and encantado == false:
		jugador_actual.ReciboDanio(danio_de_ataque)
