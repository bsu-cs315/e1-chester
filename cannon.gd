extends Node2D

signal power_changed
signal angle_changed

@export var power := 800.0
@export var power_change_rate := 400.0

@export var launch_angle = 1
@export var angle_change_rate = 4

@export var aliensLeft = 5



func _ready() -> void:
	_update_power_label()


func _process(delta: float) -> void:

	var angle_axis := Input.get_axis("increase_angle", "decrease_angle")
		
	launch_angle += angle_axis * angle_change_rate * delta
	global_rotation += angle_axis * angle_change_rate * delta
	
	
	
	launch_angle = clamp(launch_angle, deg_to_rad(-180), deg_to_rad(0))
	global_rotation = clamp(launch_angle, deg_to_rad(-180), deg_to_rad(0))

	
	var power_axis := Input.get_axis("decrease_power", "increase_power")
	
	if angle_axis != 0:
		angle_changed.emit()
	
	if power_axis != 0:
		power += power_axis * power_change_rate * delta
		power_changed.emit()
	

	
	if Input.is_action_just_pressed("launch"):
		var impulse := Vector2(1,0) * power
		var ball : RigidBody2D = preload("res://ball.tscn").instantiate()
		get_parent().add_child(ball)
		ball.global_position = global_position
		ball.apply_impulse(impulse.rotated(launch_angle))
		
		


func _update_power_label() -> void:
	get_parent().get_node("%PowerLabel").text = "power %d" % power
	
func _update_angle_label() -> void:
	get_parent().get_node("%AngleLabel").text = "Angle %d" % rad_to_deg(launch_angle)
	
	

func _draw() -> void:
	draw_circle(Vector2.ZERO, 40, Color.BLACK)
	draw_line(Vector2.ZERO, Vector2(70, 0).rotated(global_rotation), Color.BLACK, 60)
