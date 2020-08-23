extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var v = Vector2(0,0)
var g
var b_scene
# Called when the node enters the scene tree for the first time.
func _ready():
	b_scene = preload("Bullet.tscn")
	g = $gun
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	g.rotate(0.5 * delta)
	add_child_below_node($AnimationPlayer, b_scene.instance())
	print(g.offset)
	pass
