extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var asteroid
var a_node
var limit = 1000
var asteroid_amt = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	asteroid = preload("res://Asteroid.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_rate_ctrlr_timeout():
	asteroid_amt = get_child_count() - 1
	if asteroid_amt <= limit:
		a_node = asteroid.instance()
		a_node.position = Vector2(rand_range(-4096, 4096), rand_range(-4096, 4096))
		add_child(a_node)
		pass
	pass # Replace with function body.
