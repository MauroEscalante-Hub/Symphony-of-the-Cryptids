extends TileMap
@onready var Animation_player = $CanvasLayer/AnimationPlayer
#const variable_De_Bichos = preload("res://escenas/Jaula/jaula_de_criptido.tscn")
#var CantidadBichos = variable_De_Bichos.new()

func _ready() -> void:
	Fade()
	
func Fade():
	Animation_player.play("FadeIn")
	pass

func Fadeout():
	Animation_player.play_backwards("FadeIn")
	pass

#func _physics_process(delta: float) -> void:	
