extends Criptido
class_name LuzMala



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
