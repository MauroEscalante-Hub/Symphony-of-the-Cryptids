extends Node2D
@onready var sprite_2d = $Sprite2D
@onready var Color_Rect = $Transicion/ColorRect
@onready var Animation_Player = $Transicion/AnimationPlayer
@onready var botonComenzar = $Control/VBoxContainer/BotonComenzar


func _ready():
	Color_Rect.visible = false
	pass

#func Transicion():
#	Color_Rect.visible = true
#	Animation_Player.play("Fadeout")

func _on_boton_comenzar_button_down() -> void:
	Color_Rect.visible = true
	Animation_Player.play("Fadeout")
	await Animation_Player.animation_finished
	get_tree().change_scene_to_file("res://escenas/menu_principal/transicion/introduccion.tscn")
	pass # Replace with function body.

#func _on_boton_instrucciones_button_down() -> void:
	#sprite_2d.visible = not sprite_2d.visible
	#ESTO LUEGO TENGO QUE VER LA FORMA DE ANIMARLO CON TWEENS PARA QUE QUEDE FACHERO
	#pass # Replace with function body.
#Eliminamos la opcion de tutorial

func _on_boton_salir_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_boton_comenzar_mouse_entered():
	print("pase por arriba [comenzar]")
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(botonComenzar, "scale", Vector2(1.1, 1.1), 3.0)
	pass # Replace with function body.


func _on_boton_comenzar_mouse_exited():
	print("pase por arriba [salir]")
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(botonComenzar, "scale", Vector2.ONE, 3.0)
	pass # Replace with function body.
