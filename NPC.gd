extends KinematicBody2D

var random_generator = RandomNumberGenerator.new()
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var path_follow = get_node("../../Path/Path2D/PathFollow2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	random_generator.randomize()
	var spriteSheetNumber = random_generator.randi_range(1, 25)
	$Sprite.texture = load("res://Characters/" + str(spriteSheetNumber) + ".png")

func _process(delta):
	if path_follow != null: 
		var prepos = path_follow.get_global_position()
		path_follow.set_offset(path_follow.get_offset() + 5 * delta)
		var pos = path_follow.get_global_position()
		var diff = pos - prepos
		diff = diff.normalized()
		
		if diff != Vector2.ZERO:
			animationTree.set("parameters/Idle/blend_position", diff)
			animationTree.set("parameters/Walk/blend_position", diff)
			animationState.travel("Walk")
		else:
			animationState.travel("Idle")
