extends KinematicBody

#mainPhysics
var movementSpeed = 6
var jumpStrength = 2.5
var gravity = 9.8
var speed_bonus = 0
var velocity = Vector2.ZERO

#camera
var minCamVerticalAngle = -90.0
var maxCamVerticalAngle = 90.0
var lookSensitivity = 0.5

#Vectors
var playerVelocity : Vector3 = Vector3()
var mouseDelta : Vector2 = Vector2()

#player components
onready var camera = get_node("Camera")

 #Called when the node enters the scene tree for the first time.	
func _input (event):
	if event is InputEventMouseMotion:
		mouseDelta = event.relative
		if event.is_action_pressed("Primary Fire"):
			if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				if event.is_action_pressed("ui_cancel"):
					Input.event.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
						if event is InputEventMouseMotion:
							mouseDelta = event.relative
	
func _process(delta):
	camera.rotation_degrees -= Vector3(rad2deg(mouseDelta.y), 0, 0) * lookSensitivity * delta
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minCamVerticalAngle, maxCamVerticalAngle)
	rotation_degrees -= Vector3(0, rad2deg(mouseDelta.x), 0) * lookSensitivity * delta
	mouseDelta = Vector2()
	
	#$Camera/playerScore.text = str(Global.currentScore)

func _physics_process (delta):
	var input = Vector2()
	if Input.is_action_pressed("player_forward"):
		input.y -= 2.5
		velocity.y -= playerVelocity + speed_bonus
		if Input.is_action_pressed("run"):
			speed_bonus.y = 10
		else:
			speed_bonus.y = 0
			velocity = move_and_slide(velocity)
			
	if Input.is_action_pressed("player_backward"):
		input.y += 2.5
	if Input.is_action_pressed("player_left"):
		input.x -= 2.5
	if Input.is_action_pressed("player_right"):
		input.x += 2.5
	input = input.normalized()
	var forward = global_transform.basis.z
	var right = global_transform.basis.x
	playerVelocity.z = (forward * input.y + right * input.x).z * movementSpeed
	playerVelocity.x = (forward * input.y + right * input.x).x * movementSpeed
	playerVelocity.y -= gravity * delta
	playerVelocity = move_and_slide(playerVelocity, Vector3.UP)
	if Input.is_action_pressed("jump") and is_on_floor():
		playerVelocity.y = jumpStrength
	
	if Input.is_action_pressed("run"):
		input.y -= 5
		input.y += 5
		input.x -= 5
		input.x += 5
		
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
