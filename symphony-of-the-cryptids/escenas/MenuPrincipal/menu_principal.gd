extends Node2D
@onready var sprite_2d = $Sprite2D

func _ready():
	pass

func _on_boton_comenzar_button_down() -> void:
	get_tree().change_scene_to_file("res://escenas/Nivel/Escenario.tscn")
	pass # Replace with function body.

func _on_boton_instrucciones_button_down() -> void:
	sprite_2d.visible = not sprite_2d.visible
	#ESTO LUEGO TENGO QUE VER LA FORMA DE ANIMARLO CON TWEENS PARA QUE QUEDE FACHERO
	pass # Replace with function body.

func _on_boton_salir_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.
