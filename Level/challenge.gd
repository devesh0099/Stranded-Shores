extends Node2D

var paper_handler = preload("res://props/paper.tscn")

@onready var first = $point1
@onready var second = $point2
@onready var third =  $point3
@onready var fourth = $point4
@onready var fifth = $point5
@onready var sixth =$point6
@onready var seventh = $point7
@onready var eighth = $point8
@onready var ninth = $point9

var unlocked_receipe = []

var receipe = ["Signal_Platform","Flammable_Material","Trigger"]

var num = [1,2,3,4,5,6,7,8,9]

func random_pos_gen():
	return num.pick_random()

func random_receipe():
	var to_Retrun = receipe.pick_random()
	receipe.erase(to_Retrun)
	return to_Retrun

func _ready():
	paper_generator() # Replace with function body.
	Global.world = self


func paper_generator():
	for i in range(3):
		var random_pos = random_pos_gen()
		num.erase(random_pos)
		var node
		match random_pos:
			1:
				node = first
			2:
				node = second
			3:
				node = third
			4:
				node = fourth
			5:
				node = fifth
			6:
				node = sixth
			7:
				node = seventh
			8:
				node = eighth
			9:
				node = ninth
		var random_receipe = random_receipe()
		var ins = paper_handler.instantiate()
		ins.paper_type = random_receipe
		node.add_child(ins)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
