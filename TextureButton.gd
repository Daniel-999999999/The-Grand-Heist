extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Heist's info/Big Boi Bank info.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://Menus/Main Menu.tscn")


func _on_711_pressed():
	get_tree().change_scene("res://Heist's/711.tscn")
