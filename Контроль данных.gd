extends Control

var NodeTE
var NodeL
var Text

var NumL = 0

func _ready():
	NodeTE = get_node("TextEdit")
	NodeL = get_node("Label")
	NodeTE.fold_line(0)
	NodeTE.readonly = true
	NodeTE.text = "-Выберете вершину-"
	pass 


#func _input(even):
	#if Sng.StatKurs == 2:
		#if Sng.IDdostup != -1:
			#NodeTE.readonly = false
			#NodeTE.text = Sng.VersData[str(Sng.IDdostup)][1]
			#print(NodeTE.get_path())
		#else:
			#NodeTE.text = "-Выберете вершину-"
			#NodeTE.readonly = true
		#pass
		
		

func _on_TextEdit_text_changed():
	NumL = NodeTE.cursor_get_line()
	#print(NumL)
	#print("--")
	if len(NodeTE.get_line(NumL)) >= 33:
		#print("NodeTE.cursor_get_line()")
		NodeTE.text += "\n" 
		NodeTE.cursor_set_line(NumL+1)
		NodeTE.cursor_set_column(0)
	#print(NodeTE.cursor_get_line())
	
	Sng.VersData[str(Sng.IDdostup)][1] = NodeTE.text


func _on_Musor_button_down():
	NodeTE.readonly = true
	NodeTE.text = "-Войдите в режим курсора-"
	Sng.IDdostup = -1


func _on_Kursor_button_down():
	NodeTE.readonly = true
	NodeTE.text = "-Выберете вершину-"
	Sng.IDdostup = -1
