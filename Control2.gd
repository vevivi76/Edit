extends Control

var StlRamk = load("res://StyleRamk1.tres")

func _ready():
	StlRamk.set_bg_color(Color("#cfc8c1"))
	pass


func _on_Kursor_button_down():
	Sng.StatKurs = 0
	StlRamk.set_bg_color(Color("#cfc8c1"))
	
	regl()
	pass


func _on_Musor_button_down():
	Sng.StatKurs = 1
	StlRamk.set_bg_color(Color("#bc7f7f"))
	
	regl()
	pass


func _on_Svaz_button_down():
	Sng.StatKurs = 2
	StlRamk.set_bg_color(Color("#7eb9c4"))
	
	regl()
	pass # Replace with function body.

func regl():
	Sng.SMT(Sng.DT1, Sng.DT2, Sng.DT1, Sng.DT2)
	
	Sng.AcVOld = ""
	Sng.AcVNew = ""
	Sng.clktb = 0
