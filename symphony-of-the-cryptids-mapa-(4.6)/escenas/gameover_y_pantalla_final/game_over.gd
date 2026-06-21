extends CanvasLayer



func _on_re_intentar_button_down() -> void:
	get_tree().change_scene_to_file("res://escenas/nivel/escenario.tscn")
	pass # Replace with function body.


func _on_menu_button_down() -> void:
	get_tree().change_scene_to_file("res://escenas/menu_principal/menu_principal.tscn")
	pass # Replace with function body.


func _on_salir_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.
