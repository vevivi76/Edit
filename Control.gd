extends Control

var pric
var Nodee



func _ready():
	pric = get_node("Задники/pric")
	Nodee = get_node("Pole")
	
	Sng.StPol[0] = Nodee.rect_size[0]/2 + Nodee.rect_position[0] 
	Sng.StPol[1] = Nodee.rect_size[1]/2 + Nodee.rect_position[1] 
	
	pric.rect_position.x = Nodee.rect_position[0] - (pric.rect_size[0]/2)*pric.rect_scale[0]
	pric.rect_position.y = Nodee.rect_position[1] - (pric.rect_size[1]/2)*pric.rect_scale[1]


func _input(even):
	if Sng.ClvoVer < 300:
		Sng.CV()
	
