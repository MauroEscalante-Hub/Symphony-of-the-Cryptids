extends CharacterBody2D


const SPEED = 300.0

#func _physics_process(delta: float) -> void:
	#
	#if Input.is_action_just_pressed("Abasho"):
		#velocity.y = SPEED
	#if Input.is_action_just_pressed("Ashiba"):
		#velocity.y = -SPEED
	#if Input.is_action_just_pressed("Dereita"):
		#velocity.x = SPEED
	#if Input.is_action_just_pressed("Iquierda"):
		#velocity.x = -SPEED
	#
	#move_and_slide()
