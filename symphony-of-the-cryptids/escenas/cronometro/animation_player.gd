extends AnimationPlayer

@onready var Animacion_Reloj = $"."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Animacion_Reloj.play("Relojito")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
