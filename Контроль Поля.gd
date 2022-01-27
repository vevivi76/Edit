extends Control

var Node_dict = {}
var Value_dict = {}

var fl1= 0

var pH
var pV


func _ready():
	
	Node_dict["Id_Scr_H"] = get_node("HScrol")
	Node_dict["Id_Scr_V"] = get_node("VScrol")
	Node_dict["Id_Head"] = get_node("../Pole")
	Node_dict["Id_Scr_S"] = get_node("SScrol")
	Node_dict["Id_Scr_Sp"] = get_node("SpScrol")
	Node_dict["Id_Lb_x"] = get_node("x")
	Node_dict["Id_Lb_y"] = get_node("y")
	Node_dict["Id_Lb_s"] = get_node("s")
	Node_dict["Id_Lb_sp"] = get_node("sp")
	
	Value_dict["StVSc"] = Node_dict["Id_Head"].rect_scale
	Value_dict["Dt_CRM"] = 1 
	Value_dict["Dt_RP"] = Node_dict["Id_Scr_Sp"].value
	Value_dict["Dt_Sc"] = [Node_dict["Id_Scr_H"].value, Node_dict["Id_Scr_V"].value]
	Value_dict["Dt_CM"] = [0, 0]
	Value_dict["Dt_Hsv"] = Node_dict["Id_Head"].rect_position
	Value_dict["Dt_Hss"] = Node_dict["Id_Head"].rect_size
	
	pH = Node_dict["Id_Scr_H"].page
	pV = Node_dict["Id_Scr_V"].page
	
	ObD()

func _input(even):
	
	if even is InputEventMouseButton:
		if even.button_index == BUTTON_RIGHT:
			if Value_dict["Dt_CRM"] == 2:
				Value_dict["Dt_CRM"] = 1
			else:
				Value_dict["Dt_CRM"] += 1
				Value_dict["Dt_Sc"] = [Node_dict["Id_Scr_H"].value, Node_dict["Id_Scr_V"].value]
				Value_dict["Dt_CM"] = even.position

		if even.button_index == BUTTON_WHEEL_UP:
			
			Scr("+")
			ObD()
			#Node_dict["Id_Scr_V"].value -= Node_dict["Id_Scr_V"].value * Node_dict["Id_Scr_S"].value / 100
			#Node_dict["Id_Head"].rect_position.x = Value_dict["Dt_Hss"][0]/2 + Value_dict["Dt_Hsv"][0]
		if even.button_index == BUTTON_WHEEL_DOWN:
			
			Scr("-")
			ObD()
			#Node_dict["Id_Scr_V"].value -= Node_dict["Id_Scr_V"].value * Node_dict["Id_Scr_S"].value / 100
			#Node_dict["Id_Head"].rect_position.x = Value_dict["Dt_Hss"][1]/2 + Value_dict["Dt_Hsv"][1]
	
	if Value_dict["Dt_CRM"] == 2:
		Node_dict["Id_Scr_H"].value = Value_dict["Dt_Sc"][0] + (Value_dict["Dt_CM"][0] - get_viewport().get_mouse_position ()[0])*0.9/(Node_dict["Id_Scr_S"].value/100)
		Node_dict["Id_Scr_V"].value = Value_dict["Dt_Sc"][1] + (Value_dict["Dt_CM"][1] - get_viewport().get_mouse_position ()[1])*0.9/(Node_dict["Id_Scr_S"].value/100)
		ObD()


func ObD():
	Kor()
	
	Value_dict["Dt_RP"] = Node_dict["Id_Scr_Sp"].value
	
	Node_dict["Id_Scr_H"].min_value = -Value_dict["Dt_RP"]*1000
	Node_dict["Id_Scr_H"].max_value = Value_dict["Dt_RP"]*1000+ Node_dict["Id_Scr_H"].page
	Node_dict["Id_Scr_V"].min_value = -Value_dict["Dt_RP"]*1000
	Node_dict["Id_Scr_V"].max_value = Value_dict["Dt_RP"]*1000 + Node_dict["Id_Scr_V"].page
	
	Node_dict["Id_Head"].rect_position.x = -Node_dict["Id_Scr_H"].value + Value_dict["Dt_Hss"][0]/2 + Value_dict["Dt_Hsv"][0]
	Node_dict["Id_Head"].rect_position.y = -Node_dict["Id_Scr_V"].value + Value_dict["Dt_Hss"][1]/2 + Value_dict["Dt_Hsv"][1]
	Node_dict["Id_Head"].rect_scale.x = Value_dict["StVSc"][0]*(Node_dict["Id_Scr_S"].value/100)
	Node_dict["Id_Head"].rect_scale.y = Value_dict["StVSc"][1]*(Node_dict["Id_Scr_S"].value/100)
	
	
	Node_dict["Id_Lb_x"].text = "x: " + str(Node_dict["Id_Scr_H"].value)
	Node_dict["Id_Lb_y"].text = "y: " + str(Node_dict["Id_Scr_V"].value)
	Node_dict["Id_Lb_s"].text = "Маштаб: " + str(Node_dict["Id_Scr_S"].value) + "%"
	Node_dict["Id_Lb_sp"].text = "Размер поля: +- " + str(Node_dict["Id_Scr_Sp"].value*1000)
	
	
	Sng.Center[0] = Node_dict["Id_Scr_H"].value
	Sng.Center[1] = Node_dict["Id_Scr_V"].value
	
	Sng.ScalePole = Node_dict["Id_Scr_S"].value/100

	Sng.StPol[0] = Node_dict["Id_Head"].rect_position.x
	Sng.StPol[1] = Node_dict["Id_Head"].rect_position.y




func _on_Reset_button_down():
	Node_dict["Id_Scr_H"].value = 0
	Node_dict["Id_Scr_V"].value = 0
	Node_dict["Id_Scr_S"].value = 100


func Kor():
		Node_dict["Id_Head"].rect_pivot_offset[0] = Node_dict["Id_Scr_H"].value
		Node_dict["Id_Head"].rect_pivot_offset[1] = Node_dict["Id_Scr_V"].value


func Scr(type):
	
	Node_dict["Id_Scr_H"].page = pH/(Node_dict["Id_Scr_S"].value/100 + 0.05)
	Node_dict["Id_Scr_V"].page = pV/(Node_dict["Id_Scr_S"].value/100 + 0.05)
	
	if fl1 == 1:
		fl1 = 0

		if type == "+":
			Node_dict["Id_Scr_S"].value += 10
		elif type == "-":
			Node_dict["Id_Scr_S"].value -= 10

	else: fl1 += 1



func _on_HScrol_scrolling():
	ObD()

func _on_VScrol_scrolling():
	ObD()

func _on_SScrol_scrolling():
	ObD()

func _on_SpScrol_scrolling():
	ObD()
