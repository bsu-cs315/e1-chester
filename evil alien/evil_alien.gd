extends RigidBody2D

func _on_body_entered(body) -> void:
	if body.is_in_group("projectile"):
		var particles : CPUParticles2D = preload("res://evil alien/AlienParticles.tscn").instantiate()
		get_parent().add_child(particles)
		particles.emitting = true
		$Sprite2D.visible = false
		particles.global_position = global_position
		queue_free()
