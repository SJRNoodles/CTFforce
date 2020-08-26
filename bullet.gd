extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var my_gun
var speed = 3000
var offset = 100
# Called when the node enters the scene tree for the first time.

func wait(s):
	$Sprite.hide()
	speed = 0
	var t = Timer.new()
	t.set_wait_time(s)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	self.queue_free()
pass


func _ready():
	my_gun = get_node("/root/Node2D/player/")
	position = my_gun.position + Vector2(cos(my_gun.rotation) * offset, sin(my_gun.rotation) * offset)
	rotation = my_gun.rotation
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for a in get_overlapping_areas():
		print(a.name.split("@", false))
		
		
		if a.name == "Asteroid" or a.name.split("@", false)[0] == "Asteroid":
			print("hit an asteroid")
			$hit.play()
			wait(0.05)
			
			pass
		pass
	self.position += Vector2(speed * cos(rotation) * delta, speed*sin(rotation)*delta )
	pass


func _on_lifespan_timeout():
	$AnimationPlayer.play("fade")
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.
