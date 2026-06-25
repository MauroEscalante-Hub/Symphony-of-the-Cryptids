extends CanvasLayer

@onready var GuitaIU = $VBoxContainer2/Puntuacion
@onready var label_puntuacion = $VBoxContainer2/Puntuacion
#var nivel : int = 0
#var bichos : int = 0
#var dinero : int = 0
#var cuota : bool 
#var bichos_capturados : int

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
	pass # Replace with function body.


func _on_siguiente_nivel_button_down() -> void:
	Escenario2()
	pass # Replace with function body.

func Escenario2():
	get_tree().change_scene_to_file("res://escenas/menu_principal/transicion/intermedio_mapa2.tscn")
