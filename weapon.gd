extends Node

class_name Weapon

export var fire_rate = 0.5
export var clip_size = 5
export var reload_rate = 2.4

onready var raycast = $"../Camera/RayCast"
var current_ammo = clip_size
var can_fire = true
var reloading = false

func _process(delta):
	if Input.is_action_just_pressed("Primary Fire") and can_fire:
		# fire the weapon
		if current_ammo > 0:
			print("fired weapon")
			can_fire = false
			current_ammo -= 1
			check_collision()
			yield(get_tree().create_timer(fire_rate), "timeout")
			
			can_fire = true
		elif not reloading:
			print("Reloading")
			reloading = true
			yield(get_tree().create_timer(reload_rate), "timeout")
			current_ammo = clip_size
			reloading = false
			print("Reloaded")
			
func check_collision():
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.is_in_group("Enimies"):
			collider.queue_free()
			print("killed")
