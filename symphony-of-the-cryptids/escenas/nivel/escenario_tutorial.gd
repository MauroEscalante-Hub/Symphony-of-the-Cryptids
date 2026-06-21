extends TileMap

@onready var Animacion = $CanvasLayer/AnimationPlayer

func _ready() -> void:
	fade()
	pass 
	
func fade():
	Animacion.play("FadeIn")
