extends CanvasLayer

@onready var Fade = $AnimationPlayer

func _ready():
	Fade.play("Fades")
	await Fade.animation_finished
	get_tree().change_scene_to_file("res://escenas/nivel/escenario.tscn")
	pass # Replace with function body.
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("SaltarMapa"):
		get_tree().change_scene_to_file("res://escenas/nivel/escenario.tscn")
