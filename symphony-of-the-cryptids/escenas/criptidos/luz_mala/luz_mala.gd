extends Criptido
class_name LuzMala

@export var unabala: PackedScene
@onready var tiempodedanio = $Timer


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
	
	else:
		Punto_Objetivo()
	
	move_and_slide()


func disparar():
	if jugador == null:
		return
	
	var nueva_bala = unabala.instantiate()
	
	nueva_bala.global_position = global_position
	nueva_bala.direccion = (jugador.global_position - global_position).normalized()
	
	get_tree().current_scene.add_child(nueva_bala)


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
		tiempodedanio.start()
	

func _on_areade_danio_body_exited(body):
	if body == jugador_actual:
		jugador_actual = null
		tiempodedanio.stop()
	


func _on_timer_timeout():
	disparar()
