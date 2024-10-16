extends Node2D

func _process(_delta: float) -> void:
	%PowerLabel.modulate = Color.WHITE
	%AngleLabel.modulate = Color.WHITE
	%AliensLeft.modulate = Color.WHITE
	%AngleLabel.text = "Angle: %d°" % abs(rad_to_deg(%Cannon.launch_angle))
	%AliensLeft.text = "Attack Aliens Left: %d" % %Cannon.aliensLeft

func _on_cannon_power_changed() -> void:
	%PowerLabel.text = "Power: %d" % %Cannon.power
	%PowerLabel.modulate = Color.RED

func _on_cannon_angle_changed() -> void:
	%AngleLabel.text = "Angle: %d°" % abs(rad_to_deg(%Cannon.launch_angle))
	%AngleLabel.modulate = Color.RED
	
func _on_aliens_left_changed() -> void:
	%AliensLeft.text = "Attack Aliens Left: %d" % %Cannon.aliensLeft
	%AliensLeft.modulate = Color.RED
