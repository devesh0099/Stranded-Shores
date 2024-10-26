extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var direction:= Vector2(1,0)
var speed = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity = direction * speed
	if direction.x < 0:
		anim.flip_h = true
	elif direction.x > 0:
		anim.flip_h = false
	anim.play("walk")
	
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
