extends CharacterBody2D

var speed = 15
var jumpforce = 20
var gravity = 100

var vel = Vector2()


@onready var player = get_node ("player")

func _physics_process(delta: float) -> void:
	if  Input.is_action_pressed("player_left"):
		vel.x -= speed
	elif Input.is_action_pressed("player_right"):
		vel.x += speed

	vel.y += gravity * delta
	
	if Input.is_action_pressed("player_jump"):
		vel.y -= jumpforce
		
	velocity = vel
	move_and_slide()
	

	if vel.x < 0:
		player.flip_h = true
	elif vel.x > 0:
		player.flip_h = false
	
	
