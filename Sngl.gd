extends Node

var StatKurs = 0
var Center = [0, 0]
var StPol = [0, 0]
var ScalePole
var NumVer = 0
var ClvoVer = 0
var StVersh = [0, 0]
var IDdostup = -1

var AcVNew = ""
var AcVOld = ""

var clktb = 0

var ClvoSvz = 0
#Создания словаря - дата данных где:
#{"Айди вершины": [Путь, Текст]}
var VersData = {}



# DT1 - Пасивная DT2 - Активная DT3 - Зелёная DT4 - Крастная
var DT1 = load("res://Texture/versh1.tres")
var DT2 = load("res://Texture/versh2.tres")
var DT3 = load("res://Texture/versh3.tres")
var DT4 = load("res://Texture/versh4.tres")

var svz = load("res://Linia.tscn")
var versh = load("res://Vvr.tscn")

var NodeSv
var NodeV
var NodeCSv
var NodeCV


func _ready():
	
	NodeSv = get_node("/root/Редактор/Поле/Control1/Pole/Svaz")
	NodeV = get_node("/root/Редактор/Поле/Control1/Pole/Versh")
	NodeCSv = get_node("/root/Редактор/Поле/Control1/Задники/CSZ")
	NodeCV = get_node("/root/Редактор/Поле/Control1/Задники/CV")
	
	NodeCSv.text = "К-во звязей: " + str(Sng.ClvoSvz)
	NodeCV.text = "К-во вершин: " + str(Sng.ClvoVer)
	

func SMT(to1, to2, tn1, tn2):
	
	if AcVOld != "":
		get_node(AcVOld).texture_normal = to1
		get_node(AcVOld).texture_pressed = to2
	
	if AcVNew != "":
		get_node(AcVNew).texture_normal = tn1
		get_node(AcVNew).texture_pressed = tn2

func CS():
	
	Sng.ClvoSvz += 1
	
	
	
	var newSvz = svz.instance()
	newSvz.rect_position.x = Sng.Center[0]
	newSvz.rect_position.y = Sng.Center[1]
	
	NodeCSv.text = "К-во звязей: " + str(Sng.ClvoSvz)
	
	NodeSv.add_child(newSvz)


func CV():
	
	Sng.NumVer += 1 
	Sng.ClvoVer += 1
	Sng.StVersh = Sng.Center

	
	Sng.VersData[str(Sng.NumVer)] = ["", ""]
	
	var newVershina = versh.instance()
	newVershina.rect_position.x = Sng.Center[0]
	newVershina.rect_position.y = Sng.Center[1]
	
	NodeCV.text = "К-во вершин: " + str(Sng.ClvoVer)
	
	NodeV.add_child(newVershina)

