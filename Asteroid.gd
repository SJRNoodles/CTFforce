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
var health
# Called when the node enters the scene tree for the first time.
func _ready():
	speed = rand_range(-2,2)
	L_sz = $Large
	S_sz = $Small
	H_sz = $Humongus
	set_mass(rand_range(1,4))
	pass # Replace with function body.

func set_mass(size):
	if size >= 1 and size < 2.6:
		health = 20
		$S_col.disabled = false
		S_sz.show()
		L_sz.hide()
		H_sz.hide()
	elif size >= 2.6 and size < 3.6:
		$L_col.disabled = false
		health = 40
		L_sz.show()
		S_sz.hide()
		H_sz.hide()
	else:
		$H_col.disabled = false
		health = 80
		H_sz.show()
		S_sz.hide()
		L_sz.hide()
		pass
	pass
	
func _process(delta):
	for area in get_overlapping_areas():
		if area.name == "bullet":
			health -= 1
			pass
		pass
	if health <= 0:
		self.queue_free()
		pass
	rotate(speed * delta)
	pass
