extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:

func _on_body_entered(body) -> void:
	if body.is_in_group("projectile"):
		var particles : CPUParticles2D = preload("res://evil alien/AlienParticles.tscn").instantiate()
		get_parent().add_child(particles)
		particles.emitting = true
		$Sprite2D.visible = false
		particles.global_position = global_position
		queue_free()
