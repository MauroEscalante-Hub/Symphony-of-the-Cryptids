class_name Jaula
extends Area2D


func _on_body_entered(body):
	var collider = body.get_parent()
	if collider is Criptido:
		
		collider.Estado_enjaulado()
		pass
	
	pass
