extends KinematicBody2D

var xDir = 0
var yDir = 0
var velocity = Vector2.ZERO
const ACCELERATION = 250
const MAX_SPEED = 100
var random_generator = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	random_generator.randomize()
	var spriteSheetNumber = random_generator.randi_range(1, 25)
	$Sprite.texture = load("res://Characters/" + str(spriteSheetNumber) + ".png")
	set_new_direction(null)
	
func set_new_direction(collision_area):
	# up/down or left/right
	if random_generator.randf_range(-1, 1) > 0:
		xDir = 0
		yDir = random_generator.randf_range(-1, 1)
		if yDir == -1 && collision_area == "top":
			yDir = 1
		elif yDir == 1 && collision_area == "bottom":
			yDir = -1
	else:
		yDir = 0
		xDir = random_generator.randf_range(-1, 1)
		if xDir == -1 && collision_area == "left":
			xDir = 1
		elif xDir == 1 && collision_area == "right":
			xDir = -1
	
func _process(delta):
	var temp_vector = Vector2.ZERO
	temp_vector.x = xDir
	temp_vector.y = yDir
	
	if temp_vector != Vector2.ZERO:
		velocity = velocity.move_toward(temp_vector * MAX_SPEED, ACCELERATION * delta)
	
	move_and_slide(velocity)


func _on_LeftArea_body_entered(body):
	set_new_direction("left")


func _on_TopArea_body_entered(body):
	set_new_direction("top")


func _on_BottomArea_body_entered(body):
	set_new_direction("bottom")


func _on_RightArea_body_entered(body):
	set_new_direction("right")
