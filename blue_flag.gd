extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pos = self.position
var touching_flag2 = false
var captured = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#captures the flag
func capture():
	
	self.position = $"/root/Node2D/player".position
	
	if $"/root/Node2D/red_flag".touching_flag2 == true:
		self.position = pos
		captured = false
		pass
	if $"/root/Node2D/player".health < 1:
			captured = false
			pass
			
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if captured:
		self.position = $"/root/Node2D/player".position
		pass
	for area in get_overlapping_areas():
		#capture2
		if area.name == "red_flag":
			if captured == false:
				touching_flag2 = true
				area.position = area.pos
				touching_flag2 = false
				pass
			pass
			
		print(area.name == "hitbox")
		if area.name == "hitbox":
			if captured == false:
				if $"/root/Node2D/player".team == "red":
					capture()
					pass
				pass
			pass
		pass
	pass
