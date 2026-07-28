extends CanvasLayer
@onready var botonReintentar = $Control/VBoxContainer/ReIntentar
@onready var botonMenu = $Control/VBoxContainer/Menu
@onready var botonSalir = $Control/VBoxContainer/Salir

func _on_re_intentar_button_down() -> void:
	get_tree().change_scene_to_file("res://escenas/nivel/escenario.tscn")
	pass # Replace with function body.


func _on_menu_button_down() -> void:
	get_tree().change_scene_to_file("res://escenas/menu_principal/menu_principal.tscn")
	pass # Replace with function body.


func _on_salir_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.



func _on_re_intentar_mouse_entered():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_parallel()
	tween.tween_property(botonReintentar, "scale", Vector2(1.1, 1.1), 3.0)
	tween.tween_property(botonReintentar, "modulate", Color.RED, 1.0)
	
	pass # Replace with function body.


func _on_re_intentar_mouse_exited():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_parallel()
	tween.tween_property(botonReintentar, "scale", Vector2.ONE, 3.0)
	tween.tween_property(botonReintentar, "modulate", Color.WHITE, 1.0)
	pass # Replace with function body.


func _on_menu_mouse_entered():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_parallel()
	tween.tween_property(botonMenu, "scale", Vector2(1.1, 1.1), 3.0)
	tween.tween_property(botonMenu, "modulate", Color.RED, 1.0)
	pass # Replace with function body.


func _on_menu_mouse_exited():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_parallel()
	tween.tween_property(botonMenu, "scale", Vector2.ONE, 3.0)
	tween.tween_property(botonMenu, "modulate", Color.WHITE, 1.0)
	
	pass # Replace with function body.


func _on_salir_mouse_entered():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_parallel()
	tween.tween_property(botonSalir, "scale", Vector2(1.1, 1.1), 3.0)
	tween.tween_property(botonSalir, "modulate", Color.RED, 1.0)
	
	pass # Replace with function body.


func _on_salir_mouse_exited():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_parallel()
	tween.tween_property(botonSalir, "scale", Vector2.ONE, 3.0)
	tween.tween_property(botonSalir, "modulate", Color.WHITE, 1.0)
	
	pass # Replace with function body.
