extends AnimatedSprite2D

@onready var Notas = preload("res://escenas/JuegoRitmo/Notas.tscn")
@export var Tocar = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CrearNotas() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(Tocar):
		print(Tocar)
		
	if Input.is_anything_pressed():
		$".".play("Detecta")
	else:
		$".".play("Inicio")	
		
		
func CrearNotas():
	var Flechas = Notas.instantiate()
	add_child(Flechas)
		
	
		
