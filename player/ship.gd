extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

var speed = 100

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if direction.x < 0:
		anim.flip_h = true
	elif direction.x > 0:
		anim.flip_h = false
	anim.play("walk")
	move_and_slide()

