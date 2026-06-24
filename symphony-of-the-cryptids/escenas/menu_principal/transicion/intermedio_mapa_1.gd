extends CanvasLayer

@onready var Animation_Player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Animation_Player.play("Texto")
	await Animation_Player.animation_finished
	get_tree().change_scene_to_file("res://escenas/nivel/Escenario.tscn")
	pass # Replace with function body.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("SaltarMapa"):
		get_tree().change_scene_to_file("res://escenas/nivel/Escenario.tscn")
