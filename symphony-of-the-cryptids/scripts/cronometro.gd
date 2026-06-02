extends Control

@onready var tiempo = $CanvasLayer/tiempo
@onready var game_timer = $tiempo_del_juego

func _ready():
	await get_tree().create_timer(60.0).timeout
	
	pass

func _process(delta):
	
	tiempo.text = str(ceil($tiempo_del_juego.time_left))
	pass


func _on_tiempo_del_juego_timeout():
	
	get_tree().change_scene_to_file("")
	pass # Replace with function body.
