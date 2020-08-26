extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var captured = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#captures the flag
func capture():
	captured = true
	
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for area in get_overlapping_areas():
		if area.name == "player":
			if captured == false:
				capture()
				pass
			pass
		pass
	pass
