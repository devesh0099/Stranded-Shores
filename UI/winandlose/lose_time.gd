extends Control

var scene = "res://Level/world.tscn"
var challenge = "res://Level/challenge.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()

func reset_global():
	Global.stone = 0
	Global.wood = 0
	Global.abilities = {
		"Speed":0,
		"Hunger":0,
		"Capacity":0
	}
	Global.max_capacity = 12
	Global.player_inv_cap = 12
	
	Global.craft_stage = 0
	Global.list = ["Platform","Sail","Paddle"]
	Global.hunger = 30
	Global.tech_tree_showed= false
	
	Global.world = null
	Global.tech_tree = null
	Global.player = null
	Global.home = null
	
	Global.hunger_bar = null
	Global.inv_bar = null
	Global.clist_stage = 0
	Global.c_list = ["Signal_Platform","Flammable_Material","Trigger"]
	
func _process(delta):
	pass


func _on_button_pressed():
	$AudioStreamPlayer2.play()
	reset_global()
	get_tree().change_scene_to_file(scene)


func _on_button_2_pressed():
	$AudioStreamPlayer2.play()
	reset_global()
	get_tree().change_scene_to_file(challenge)
