class_name Jaula
extends Area2D

@onready var Centro = $CentrodeLaJaula


func _on_body_entered(body):
	var collider = body.get_parent()
	if collider is Criptido:
		
		collider.Enjaulado(Centro)
		pass
	
	pass
