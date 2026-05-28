extends CanvasLayer

@onready var Canvas_Layer = $CanvasLayer
#este de arriba no hacía falta
@onready var Animation_Player = $CanvasLayer/AnimationPlayer

func _ready():
	Animation_Player.play("Texto")
	await Animation_Player.animation_finished
	get_tree().change_scene_to_file("res://escenas/Nivel/Escenario.tscn")
