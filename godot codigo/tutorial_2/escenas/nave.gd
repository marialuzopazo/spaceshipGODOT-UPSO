extends CharacterBody2D

var shot = true
var pre_laser = preload("res://Escenas/laser.tscn")

const SPEED = 300.0
func _physics_process(delta):
  Move()
  Shot()
pass

func Shot():
   if Input.is_action_just_pressed("ui_up") and shot:
    var laser = pre_laser.instantiate()
    get_parent().add_child(laser)
    laser.position.x = position.x
    laser.position.y = position.y - 50
    shot = false
    await get_tree().create_timer(0.5).timeout 
    shot = true
pass

func Move():
  var direction = Input.get_axis("ui_left", "ui_right")
  if direction:
    velocity.x = direction * SPEED
  else:
    velocity.x = 0
  move_and_slide()
pass
