extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var L_sz
var S_sz
var H_sz
var timer
var seed_input
var speed
# Called when the node enters the scene tree for the first time.
func _ready():
	speed = rand_range(-2,2)
	L_sz = $Large
	S_sz = $Small
	H_sz = $Humongus
	set_mass(rand_range(1,4))
	pass # Replace with function body.

func set_mass(size):
	if size >= 1 and size < 2:
		S_sz.show()
		L_sz.hide()
		H_sz.hide()
	elif size >= 2 and size < 3:
		L_sz.show()
		S_sz.hide()
		H_sz.hide()
	else:
		H_sz.show()
		S_sz.hide()
		L_sz.hide()
		pass
	pass
	
func _process(delta):
	rotate(speed * delta)
	pass
