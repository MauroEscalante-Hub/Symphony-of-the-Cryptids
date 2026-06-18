extends Criptido
class_name  Lobizon

@onready var TiempoDeDanio = $Timer


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
	if body == MiJugador:
		jugador_actual = body
		TiempoDeDanio.start()
	


func _on_areade_danio_body_exited(body):
	if body == jugador_actual:
		jugador_actual = null
		TiempoDeDanio.stop()


func _on_timer_timeout():
	if jugador_actual != null and encantado == false:
		jugador_actual.ReciboDanio(Danio_ataque)
	
