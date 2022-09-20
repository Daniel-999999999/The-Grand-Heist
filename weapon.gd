extends Node

class_name Weapon

export var fire_rate = 0.2
export var clip_size = 5
export var reload_rate = 2.4

onready var ammo_label = $"../UI/Label"
onready var raycast = $"../Camera/RayCast"
var current_ammo = clip_size
var can_fire = true
var reloading = false

func _ready():
	current_ammo = clip_size

func _process(delta):
	if reloading:
		ammo_label.set_text("Reloading")
	else:
		ammo_label.set_text("%d / %d" % [current_ammo, clip_size])
	
	if Input.is_action_just_pressed("Primary Fire") and can_fire:
		# fire the weapon
		if current_ammo > 0:
			fire()
		elif not reloading:
			reload()
	
	if Input.is_action_just_pressed("reload") and not reloading:
		reload()
	
func check_collision():
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.is_in_group("Enimies"):
			collider.queue_free()
			print("killed")
			
func fire():
	print("fired weapon")
	can_fire = false
	current_ammo -= 1
	check_collision()
	yield(get_tree().create_timer(fire_rate), "timeout")
	
	can_fire = true
	
func reload():
	print("Reloading")
	reloading = true
	yield(get_tree().create_timer(reload_rate), "timeout")
	current_ammo = clip_size
	reloading = false
	print("Reloaded")
