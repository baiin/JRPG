extends Node2D

onready var global = $"/root/Global"
onready var player = $YSort/Player

func _ready():
	global.last_scene_entered = "HomeInterior"

func _on_Area2D_body_entered(_body: KinematicBody2D):
	if player == _body:
		get_tree().change_scene("res://World.tscn")
	
	
	
