extends CanvasLayer

@onready var GuitaIU = $VBoxContainer2/Puntuacion
var Puntuacion: Jaula
var MiPuntuacion: int = 0

#func _ready():
#	GuitaIU = Puntuacion.Dinero_Generado

func _on_volver_al_menu_button_down() -> void:
	get_tree().change_scene_to_file("res://escenas/menu_principal/menu_principal.tscn")
	pass # Replace with function body.

func _on_salir_del_juego_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_siguiente_nivel_button_down() -> void:
	get_tree().change_scene_to_file("res://escenas/nivel/Escenario.tscn")
	pass # Replace with function body.
