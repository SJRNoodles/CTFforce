extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var v = Vector2(0,0)
var g
var b_scene
var vel = Vector2()
var cap = 600
var accel = 35
var fric = 25.0
# Called when the node enters the scene tree for the first time.
func _ready():
	b_scene = preload("Bullet.tscn")
	g = $gun
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
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
	if Input.is_action_just_pressed("CTFF_shoot"):
		get_parent().add_child(b_scene.instance())
		pass
	if Input.is_action_pressed("ui_left"):
		self.rotate(-2 * delta)
		pass
	if Input.is_action_pressed("ui_right"):
		rotate(2 * delta)
		pass
	if vel.x < 0 or vel.y < 0:
		vel += Vector2(fric,fric)
		pass
	if vel.x > 0 or vel.y > 0:
		vel -= Vector2(fric,fric)
		pass
	vel = move_and_slide(vel, Vector2(0,-1))
	print(g.offset)
	pass
