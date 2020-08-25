extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var v = Vector2(0,0)
var g
var b_scene
var vel = Vector2()
var cap = 800
var accel = 35
var fric = 4
var rot_vel = 0
var rot_vel_cap = 10
var rot_acc = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	b_scene = preload("Bullet.tscn")
	g = $gun
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$body.rotation = -rotation
	if Input.is_action_pressed("ui_up"):
		vel.y += sin(rotation) * accel
		vel.x += cos(rotation) * accel
		if vel.y > cap:
			vel.y = cap
			pass
		if vel.x > cap:
			vel.x = cap
			pass
		if vel.y < -cap:
			vel.y = -cap
			pass
		if vel.x < -cap:
			vel.x = -cap
			pass
		pass
	if Input.is_action_pressed("ui_down"):
		vel.y -= sin(rotation) * accel
		vel.x -= cos(rotation) * accel
		if vel.y > cap:
			vel.y = cap
			pass
		if vel.x > cap:
			vel.x = cap
			pass
		if vel.y < -cap:
			vel.y = -cap
			pass
		if vel.x < -cap:
			vel.x = -cap
			pass
		pass
	if Input.is_action_just_pressed("CTFF_shoot") and $rate_ctrlr.time_left < 0.0000001:
		get_parent().add_child(b_scene.instance())
		$rate_ctrlr.start()
		pass
	if Input.is_action_pressed("ui_left"):
		if rot_vel >= -rot_vel_cap:
			rot_vel -= rot_acc * delta
			pass
		$body.rotation -= 5 * delta
		pass
	if Input.is_action_pressed("ui_right"):
		if rot_vel <= rot_vel_cap:
			rot_vel += rot_acc * delta
			pass
		$body.rotation += 5 * delta
		pass
	if not (Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")):
		rot_vel = 0
		pass
	if vel.x < 0:
		vel += Vector2(fric,0)
		if vel.x > 0:
			vel.x = 0
			pass
		pass
	if vel.x > 0:
		vel -= Vector2(fric,0)
		if vel.x < 0:
			vel.x = 0
			pass
		pass
	if vel.y < 0:
		vel += Vector2(0,fric)
		if vel.y > 0:
			vel.y = 0
			pass
		pass
	if vel.y > 0:
		
		vel -= Vector2(0,fric)
		if vel.y < 0:
			vel.y = 0
			pass
		pass
	self.rotate((rot_vel)* delta)
	vel = move_and_slide(vel, Vector2(0,-1))
	print(vel)
	pass


func _on_rate_ctrlr_timeout():
	get_parent().add_child(b_scene.instance())
	if Input.is_action_pressed("CTFF_shoot"):
		$rate_ctrlr.start()
		pass
	pass # Replace with function body.
