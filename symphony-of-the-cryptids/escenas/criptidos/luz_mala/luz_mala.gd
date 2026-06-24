extends Criptido
class_name LuzMala

@export var unabala: PackedScene
@onready var tiempodedanio = $Timer
var esperar_punto: bool = false
var tweens: Tween
var valorEspecial: int = 450

func _ready():
	print("empieza")
	
	if punto_inicial.size() > 0:
		punto_actual = punto_inicial.pick_random()
	

func _physics_process(delta):
	if enjaulado:
		Estado_enjaulado()
		move_and_slide()
		return
	
	if encantado:
		print("ESTOY ENCANTADO")
		Estado_encantado(delta)
		move_and_slide()
		return
	
	else:
		Punto_Objetivo()
	
	move_and_slide()

func Punto_Objetivo():
	if esperar_punto:
		velocity = Vector2.ZERO
		return
	
	iniciar_flotacion()
	var direccion = (punto_actual.global_position - global_position).normalized()
	
	velocity = direccion * velocidad
	
	if global_position.distance_to(punto_actual.global_position) < 10:
		print("puntocerca")
		
		esperar_punto = true
		velocity = Vector2.ZERO
		
		await get_tree().create_timer(5.5).timeout  
		
		var nuevo_punto = punto_actual
		
		while nuevo_punto == punto_actual and punto_inicial.size() > 1:
			nuevo_punto = punto_inicial.pick_random()
		
		punto_actual = nuevo_punto
		print("Nuevo destino: ", punto_actual.name)
	
		esperar_punto = false

func disparar():
	if jugador == null:
		return
	
	var nueva_bala = unabala.instantiate()
	
	nueva_bala.global_position = global_position
	nueva_bala.direccion = (jugador.global_position - global_position).normalized()
	
	get_tree().current_scene.add_child(nueva_bala)

func iniciar_flotacion():
	if tweens:
		tweens.kill()
	
	tweens = create_tween()
	tweens.set_loops()
	tweens.tween_property(self, "position:y", position.y - 10, 1.5)
	tweens.tween_property(self, "position:y", position.y + 10, 1.5)

func obtener_valor():
	return valorEspecial

func _on_area_2d_area_entered(area):
	var collider = area.get_parent()
	if collider is Personaje:
		jugador_actual = collider
		print(jugador_actual)
		


func _on_area_2d_area_exited(area):
	var collider = area.get_parent()
	if collider is Personaje:
		jugador_actual = null
		print(jugador_actual)
		


func _on_areade_danio_body_entered(body):
	if body == jugador:
		jugador_actual = body
		tiempodedanio.start()
	

func _on_areade_danio_body_exited(body):
	if body == jugador_actual:
		jugador_actual = null
		tiempodedanio.stop()
	


func _on_timer_timeout():
	if jugador_actual != null:
		disparar()
	
