extends StaticBody2D


var paper_type

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		$AudioStreamPlayer.play()
		Global.receipe_unlock(paper_type)
		$CPUParticles2D.set_emitting(true)
		$AnimatedSprite2D.hide()
		await get_tree().create_timer(0.5).timeout
		self.queue_free()
		
