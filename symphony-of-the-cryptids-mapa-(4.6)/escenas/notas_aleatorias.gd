class_name Nota_Flauta
extends Node2D

var Do = load ("res://Sonidos de notas/Do.mp3")
var Mi = load("res://Sonidos de notas/Mi.mp3")
var	Sol= load("res://Sonidos de notas/Sol.mp3")
var Si = load("res://Sonidos de notas/Si.mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func Reproducir_notas():
	#var elige = randi() % playlist.size() -1
	if Input.is_action_just_pressed("Arriba"):
		$AudioStreamPlayer2D.stream = Do
		$AudioStreamPlayer2D.play()
		
	if Input.is_action_just_pressed("Abajo"):
		$AudioStreamPlayer2D.stream = Si
		$AudioStreamPlayer2D.play()
		
	if Input.is_action_just_pressed("Izquierda"):
		$AudioStreamPlayer2D.stream = Mi
		$AudioStreamPlayer2D.play()
		
	if Input.is_action_just_pressed("Derecha"):
		$AudioStreamPlayer2D.stream = Sol
		$AudioStreamPlayer2D.play()
	
func Obtener_Nota_Do():
	$AudioStreamPlayer2d.stream = Do
	$AudioStreamPlayer2d.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	randomize()
	Reproducir_notas() 
