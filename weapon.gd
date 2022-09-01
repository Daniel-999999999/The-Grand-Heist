extends Node

export var fire_rate = 0.5
export var clip_size = 5
export var reload_rate = 2.4

var current_ammo = clip_size
var can_fire = true

func _process(delta):
	if Input.is_action_just_pressed("Primary Fire") and can_fire:
		# fire the weapon
		if current_ammo > 0:
			print("fired weapon")
			can_fire = false
			current_ammo -= 1
			
			yield(get_tree().create_timer(fire_rate), "timeout")
			
			can_fire = true
		else:
