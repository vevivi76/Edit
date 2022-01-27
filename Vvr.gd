extends Node

var Nodee 
var Status = 0
var coord = [0, 0]
var Start_coord
var ID = 0

var LTE



func _ready():
	Start_coord = self.rect_position
	Nodee = get_node("TextureButton")
	get_node("Label").text = str(Sng.NumVer)
	ID = Sng.NumVer
	
	Sng.VersData[str(Sng.NumVer)] = [str(get_path()), "--Пусто--"]
	
	LTE = get_node("/root/Редактор/Поле/Control1/Контроль данных/TextEdit")






func _input(even):
	if Status == 1 and Sng.StatKurs == 0:
		self.rect_position.x = (even.position[0] - coord[0])/Sng.ScalePole  + Start_coord[0]
		self.rect_position.y = (even.position[1] - coord[1])/Sng.ScalePole  + Start_coord[1]
		#print(str(self.rect_position.x) + " " + str(self.rect_position.x))

func _on_TextureButton_button_down():
	coord = get_viewport().get_mouse_position()
	
	if Sng.StatKurs == 0:
		
		Status = 1
		Sng.IDdostup = ID
		LTE.text = Sng.VersData[str(Sng.IDdostup)][1]
		LTE.readonly = false
		
		DOAC()
		Sng.SMT(Sng.DT1, Sng.DT1, Sng.DT2, Sng.DT2)
		
	elif Sng.StatKurs == 1: 
		
		Sng.IDdostup = ID
		Sng.VersData.erase(str(Sng.IDdostup))
		
		self.queue_free()
		Sng.ClvoVer -= 1

		
		Sng.AcVNew = ""
		Sng.AcVOld = ""
		
	elif Sng.StatKurs == 2: 
		
		Sng.IDdostup = ID
		LTE.text = Sng.VersData[str(Sng.IDdostup)][1]
		
		var yp = DOAC()
		if yp:
			Sng.clktb += 1
			if Sng.clktb == 1:
				Sng.SMT(Sng.DT4, Sng.DT4, Sng.DT3, Sng.DT3)
			elif Sng.clktb == 2:
				Sng.SMT(Sng.DT1, Sng.DT2, Sng.DT1, Sng.DT2)
				Sng.CS()
			else:
				Sng.clktb = 0


func _on_TextureButton_button_up():
	Start_coord = self.rect_position
	if Sng.StatKurs == 0:
		Status = 0

func DOAC():
	Sng.AcVOld = Sng.AcVNew
	Sng.AcVNew = str(get_path()) + "/TextureButton"
	
	if Sng.AcVNew != Sng.AcVOld:
		return 1
	else: return 0 

