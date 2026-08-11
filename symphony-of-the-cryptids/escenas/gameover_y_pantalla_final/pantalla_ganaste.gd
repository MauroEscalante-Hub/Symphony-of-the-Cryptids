extends CanvasLayer

@onready var GuitaIU = $VBoxContainer2/Puntuacion
@onready var label_puntuacion = $VBoxContainer2/Puntuacion
@onready var botonSiguiente = $VBoxContainer/Siguiente_Nivel
@onready var botonMenu = $VBoxContainer/Volver_Al_Menu
@onready var botonSalir = $VBoxContainer/Salir_Del_Juego

func _ready():
	pass
	
func _process(delta):
	#cuota = DineroDejaula.cuota
	#bichos = DineroDejaula.cantidad_bichos
	#dinero = DineroDejaula.dinero_total
	#bichos_capturados = DineroDejaula.criptido_encerrados
	label_puntuacion.text = "Dinero: " + str(DineroDejaula.dinero_total)
	
	

func _on_volver_al_menu_button_down() -> void:
	get_tree().change_scene_to_file("res://escenas/menu_principal/menu_principal.tscn")
	pass # Replace with function body.

func _on_salir_del_juego_button_down() -> void:
	get_tree().quit()

func _on_siguiente_nivel_button_down() -> void:
	get_tree().change_scene_to_file("res://escenas/menu_principal/transicion/intermedio_mapa2.tscn")
	pass # Replace with function body.

func _on_siguiente_nivel_mouse_entered():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_parallel()
	tween.tween_property(botonSiguiente, "scale", Vector2(1.1, 1.1), 3.0)
	tween.tween_property(botonSiguiente, "modulate", Color.RED, 1.0)
	

func _on_siguiente_nivel_mouse_exited():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_parallel()
	tween.tween_property(botonSiguiente, "scale", Vector2.ONE, 3.0)
	tween.tween_property(botonSiguiente, "modulate", Color.WHITE, 1.0) # Replace with function body.


func _on_volver_al_menu_mouse_entered():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_parallel()
	tween.tween_property(botonMenu, "scale", Vector2(1.1, 1.1), 3.0)
	tween.tween_property(botonMenu, "modulate", Color.RED, 1.0)
	pass # Replace with function body.


func _on_volver_al_menu_mouse_exited():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_parallel()
	tween.tween_property(botonMenu, "scale", Vector2.ONE, 3.0)
	tween.tween_property(botonMenu, "modulate", Color.WHITE, 1.0) 
	pass # Replace with function body.


func _on_salir_del_juego_mouse_entered():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_parallel()
	tween.tween_property(botonSalir, "scale", Vector2(1.1, 1.1), 3.0)
	tween.tween_property(botonSalir, "modulate", Color.RED, 1.0)
	pass # Replace with function body.


func _on_salir_del_juego_mouse_exited():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).set_parallel()
	tween.tween_property(botonSalir, "scale", Vector2.ONE, 3.0)
	tween.tween_property(botonSalir, "modulate", Color.WHITE, 1.0)
	pass # Replace with function body.
