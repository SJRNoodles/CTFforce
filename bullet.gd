extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var my_gun
var speed = 350
var offset = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	my_gun =get_parent().get_parent().get_node("gun")
	position = Vector2(cos(my_gun.rotation) * offset, sin(my_gun.rotation) * offset)
	rotation = my_gun.rotation
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += Vector2(speed * cos(rotation) * delta, speed*sin(rotation)*delta )
	pass
