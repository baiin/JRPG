extends Node2D

onready var global = $"/root/Global"
onready var player = $YSort/Player
onready var homeDoor = $HomeDoor

func _ready():
	if global.last_scene_entered != null && global.last_outdoor_position != null:
		player.position.x = global.last_outdoor_position.x
		player.position.y = global.last_outdoor_position.y + 32

func _on_HomeDoor_body_entered(_body):
	global.last_outdoor_position = player.position
	get_tree().change_scene("res://HomeInterior.tscn")
