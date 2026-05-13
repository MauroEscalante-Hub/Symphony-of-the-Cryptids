extends Node2D




func _on_boton_comenzar_button_down() -> void:
	get_tree().change_scene_to_file("res://escenas/Nivel/Escenario.tscn")
	pass # Replace with function body.


func _on_boton_instrucciones_button_down() -> void:
	pass # Replace with function body.


func _on_boton_salir_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.
