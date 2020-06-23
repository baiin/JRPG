extends StaticBody2D

signal TurnOffWater
signal TurnOnWater

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(_body):
	emit_signal("TurnOffWater")

func _on_Area2D_body_exited(_body):
	emit_signal("TurnOnWater")
