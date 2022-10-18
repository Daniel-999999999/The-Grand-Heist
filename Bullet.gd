extends Area

var speed : float = 600
var damage : int = 1

func _process (delta):
	translation += global_transform.basis.z * speed * delta


func _on_Area_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		destroy()
		
func destroy ():
	queue_free()
