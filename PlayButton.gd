extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayButton_pressed():
	get_tree().change_scene("res://Menus/Heist select.tscn")

func _on_optionButton_pressed():
	get_tree().change_scene("res://Menus/Options Menu.tscn")


func _on_Quit_Button_pressed():
	get_tree().quit()
