extends Node2D
@onready var sprite_2d = $Sprite2D
@onready var Color_Rect = $Transicion/ColorRect
@onready var Animation_Player = $Transicion/AnimationPlayer
@onready var botonComenzar = $Control/VBoxContainer/BotonComenzar
@onready var botonInstrucciones = $Control/VBoxContainer/BotonInstrucciones
@onready var botonSalir = $Control/VBoxContainer/BotonSalir
@onready var nombre_Del_Titulo = $"Título"
@onready var cajaDEbotones = $Control/VBoxContainer
@onready var labelpartida = $Control/Label

func _ready():
	Color_Rect.visible = false
	mostrarTitulo()
	mostrarBotones()
	pass

func mostrarTitulo():
	var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	
	tween.tween_property(nombre_Del_Titulo,"position", Vector2(140.0, -14.0),2.0)
	cambiarColorTitulo()
	

func cambiarColorTitulo():
	var tween = create_tween().set_loops()
	
	tween.tween_property(nombre_Del_Titulo, "modulate", Color.RED, 3.0)
	tween.tween_property(nombre_Del_Titulo, "modulate", Color.BLUE, 3.0)
	tween.tween_property(nombre_Del_Titulo, "modulate", Color.AQUA, 3.0)
	tween.tween_property(nombre_Del_Titulo, "modulate", Color.YELLOW, 3.0)

func mostrarBotones():
	var tween = create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN)
	cajaDEbotones.modulate.a = 0.0
	labelpartida.modulate.a = 0.0
	tween.tween_property(cajaDEbotones,"modulate:a", 1.0,3.0)
	tween.tween_property(labelpartida,"modulate:a", 1.0,1.0)
	
	cambiarColorbotones()

func cambiarColorbotones():
	var tween = create_tween().set_loops()
	
	tween.tween_property(cajaDEbotones, "modulate", Color.RED, 3.0)
	tween.tween_property(cajaDEbotones, "modulate", Color.BLUE, 3.0)
	tween.tween_property(cajaDEbotones, "modulate", Color.AQUA, 3.0)
	tween.tween_property(cajaDEbotones, "modulate", Color.YELLOW, 3.0)


func _on_boton_comenzar_button_down() -> void:
	Color_Rect.visible = true
	Animation_Player.play("Fadeout")
	await Animation_Player.animation_finished
	get_tree().change_scene_to_file("res://escenas/menu_principal/transicion/introduccion.tscn")
	pass # Replace with function body.

func _on_boton_salir_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_boton_comenzar_mouse_entered():
	print("pase por arriba [comenzar]")
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(botonComenzar, "scale", Vector2(1.1, 1.1), 3.0)
	pass # Replace with function body.


func _on_boton_comenzar_mouse_exited():
	print("pase por arriba [salir]")
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(botonComenzar, "scale", Vector2.ONE, 3.0)
	pass # Replace with function body.


func _on_boton_instrucciones_mouse_entered():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(botonInstrucciones, "scale", Vector2(1.1, 1.1), 3.0)
	pass # Replace with function body.


func _on_boton_instrucciones_mouse_exited():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(botonInstrucciones, "scale", Vector2.ONE, 3.0)
	pass # Replace with function body.


func _on_boton_salir_mouse_entered():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(botonSalir, "scale", Vector2.ONE, 3.0)
	pass # Replace with function body.


func _on_boton_salir_mouse_exited():
	var tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(botonSalir, "scale", Vector2.ONE, 3.0)
	pass # Replace with function body.
