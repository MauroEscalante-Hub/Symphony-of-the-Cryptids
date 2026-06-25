extends TileMap
var cuota: bool
var cantidad_bicho: int 
var plata: int  
var encerrados

func _ready() -> void:
	cuota = DineroDejaula.cuota
	cantidad_bicho = DineroDejaula.cantidad_bichos
	plata = DineroDejaula.dinero_total
	encerrados = DineroDejaula.criptido_encerrados
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cantidad_bicho >= encerrados or cuota == true:
		ganamo()
	pass

func ganamo():
	get_tree().change_scene_to_file("res://escenas/gameover_y_pantalla_final/pantalla_ganaste.tscn")
