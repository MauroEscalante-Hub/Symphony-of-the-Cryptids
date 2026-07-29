extends PointLight2D

@onready var Luces = $AnimatedSprite2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Luces.play("Luces")
	pass
