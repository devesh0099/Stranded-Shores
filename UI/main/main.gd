extends Control


var scene = "res://Level/world.tscn"
var scene2 = "res://UI/tutorial/tutorial.tscn"

var challenge = "res://Level/challenge.tscn"
var challenge_tur = "res://UI/tutorial/challenge_tur.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene_to_file(scene2)


func _on_start_2_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene_to_file(challenge_tur)
