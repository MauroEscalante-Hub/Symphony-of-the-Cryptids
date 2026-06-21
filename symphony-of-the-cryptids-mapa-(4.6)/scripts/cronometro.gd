extends Control

@onready var tiempo = $CanvasLayer/tiempo
@onready var game_timer = $tiempo_del_juego

func _ready():
	await get_tree().create_timer(1).timeout
	pass

func _process(delta):
	tiempo.text = str(ceil($tiempo_del_juego.time_left))
	pass

func _on_tiempo_del_juego_timeout():
	get_tree().change_scene_to_file("res://escenas/gameover_y_pantalla_final/game_over.tscn")
	pass # Replace with function body.
	
	
	
