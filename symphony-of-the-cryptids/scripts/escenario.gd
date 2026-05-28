extends TileMap
@onready var Animation_player = $CanvasLayer/AnimationPlayer

func _ready() -> void:
	Animation_player.play("FadeIn")
