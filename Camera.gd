extends KinematicBody

var target
var space_state

func _ready():
		space_state = get_world().direct_space_state

func _process(delta):
	if target:
		var result = space_state.intersect_ray(global_transform.origin, target.global_transform.origin)
		if result.collider.is_in_group("Player"):
			look_at(target.global_transform.origin, Vector3.UP)

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		target = body
		print(body.name + "entered")


func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		target = null
		print(body.name + "entered")
