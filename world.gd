extends Node2D

func _process(_delta: float) -> void:
	%PowerLabel.modulate = Color.WHITE

func _on_cannon_power_changed() -> void:
	%PowerLabel.text = "Power: %d" % %Cannon.power
	%PowerLabel.modulate = Color.RED


func _on_cannon_angle_changed() -> void:
	%AngleLabel.text = "Angle: %d" % rad_to_deg(%Cannon.launch_angle)
	%AngleLabel.modulate = Color.RED
