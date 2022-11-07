extends Button

export(String) var scene_to_load

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Big Boi Bank info.tscn")


func _on_Options_button_pressed():
	get_tree().change_scene("res://Options Menu.tscn")


func _on_Big_Bio_Bank_Play_pressed():
	get_tree().change_scene("res://Heist's/BigBoiBank.tscn")
