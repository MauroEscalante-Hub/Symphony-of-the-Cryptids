extends CanvasLayer
@onready var label_puntuacion = $VBoxContainer2/Puntuacion

func _ready():
	pass

func _process(delta):
	label_puntuacion.text = "Dinero: " + str(DineroDejaula.dinero_total)

func _on_siguiente_nivel_button_down() -> void:
	get_tree().change_scene_to_file("res://escenas/menu_principal/transicion/IntermedioMapa1.tscn")
	pass # Replace with function body.

func _on_volver_al_menu_button_down() -> void:
	get_tree().change_scene_to_file("res://escenas/menu_principal/menu_principal.tscn")
	pass # Replace with function body.

func _on_salir_del_juego_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.
