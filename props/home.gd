extends StaticBody2D

var ruined = true

func _ready():
	Global.home = self

func check():
	if Global.player.wood >= 12:
		Global.player.wood -= 12
		#print(Global.player_inv_cap)
		Global.player_inv_cap = Global.max_capacity
		Global.inv_update()
		#print(Global.player_inv_cap)
		return true
	return false

func build():
	if check() != true:
		return
	$AudioStreamPlayer.play()
	$AnimatedSprite2D.play("default")
	$Panel.hide()
	ruined = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if ruined == true and body.is_in_group("player"):
		$Panel.show()

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		$Panel.hide()
