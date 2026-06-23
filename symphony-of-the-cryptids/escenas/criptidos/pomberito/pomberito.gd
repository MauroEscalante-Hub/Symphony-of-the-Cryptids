extends Criptido
class_name Pomberito

@onready var TiempoDeDanio = $Timer
var miVida: int = 100

func _ready():
	print("empieza")
	
	if punto_inicial.size() > 0:
		punto_actual = punto_inicial.pick_random()
	
func _physics_process(_delta):
	if enjaulado == true:
		Estado_enjaulado()
		move_and_slide()
		return
	
	if miVida <= 0:
		queue_free()
	
	if encantado:
		Estado_encantado(_delta)
		#Animacion.play()
	
	elif punto_actual != null:
		#Animacion.play()
		Punto_Objetivo()
	
	
	else:
		print("hola soy else de pomberito")
		#Animacion.stop()
	
	move_and_slide()

func recibir_danio(cantidad: int):
	miVida -= cantidad
	if miVida <= 0:
		print("Me pegaron [soy pomberito]")
	
	return miVida
	


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
	

func _on_areade_danio_body_exited(body):
	if body == jugador_actual:
		jugador_actual = null
		TiempoDeDanio.stop()

func _on_timer_timeout():
	if jugador_actual != null and encantado == false:
		jugador_actual.ReciboDanio(danio_de_ataque)
	
