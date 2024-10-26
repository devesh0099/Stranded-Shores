extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var timer = $Timer
@onready var anim2 = $AnimatedSprite2D2

var played = 0

var stone = 0
var wood = 0

var speed = 30

var interact_things:bool = false

func _ready():
	Global.player = self

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if direction.x < 0:
		anim.flip_h = true
		$RayCast2D.set_rotation_degrees(180)
	elif direction.x > 0:
		anim.flip_h = false
		$RayCast2D.set_rotation_degrees(0)
	anim.play("walk")
	
	if $RayCast2D.is_colliding() == false:
		anim2.hide()
	
	move_and_slide()

func sinking_sand():
	Global.hunger -= 10
	$hurt.play()
	Global.hunger_bar.update_food()
	Global.hunger_check()

func sinking_sand_effect():
	Global.hunger -= 5
	played += 5
	if played % 10 == 0:
		$hurt.play()
	Global.hunger_bar.update_food()
	Global.hunger_check()

func _input(event):
	if $RayCast2D.is_colliding() == true:
		if $RayCast2D.get_collider().is_in_group("prop"):
			interact_things = true
			anim2.show()
	else:
		interact_things = false
	if Input.is_action_just_pressed("clear"):
		Global.player_inv_cap = Global.max_capacity
		stone = 0
		wood = 0
		Global.inv_update()
		$Clear.play()
	if Input.is_action_just_pressed("techtree"):
		if Global.home.ruined == false:
			$open.play()
	if Input.is_action_just_pressed("interact") and interact_things == true:
		if $RayCast2D.get_collider().is_in_group("mountain") and Global.player_inv_cap >= 4:
			stone += 2
			Global.player_inv_cap -= 4
			Global.inv_update()
			$mountain.play()
			$RayCast2D.get_collider().queue_free()
		elif $RayCast2D.get_collider().is_in_group("tree") and Global.player_inv_cap >= 4:
			wood += 4
			Global.player_inv_cap -= 4
			Global.inv_update()
			$tree.play()
			$RayCast2D.get_collider().queue_free()
		elif $RayCast2D.get_collider().is_in_group("food"):
			if Global.hunger < 100:
				Global.hunger +=10
				Global.hunger_bar.update_food()
				$RayCast2D.get_collider().queue_free()
				$hunger.play()
		elif $RayCast2D.get_collider().is_in_group("home"):
			if Global.home.ruined == true:
				Global.home.build()
			else:
				transfer()
		interact_things = false
		anim2.hide()


func transfer():
	Global.stone += stone
	Global.wood += wood
	wood = 0
	stone = 0
	Global.player_inv_cap = Global.max_capacity
	Global.inv_update()
	$transfer.play()

func _on_timer_timeout():
	Global.hunger_update()
