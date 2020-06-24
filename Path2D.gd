extends Path2D

onready var pathFollow = get_node("PathFollow2D")

func _ready():
	set_process(true)

func _process(delta):
	pathFollow.set_offset(pathFollow.get_offset() + 25 * delta)
