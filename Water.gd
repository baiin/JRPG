extends TileMap

var _timer = null
var delay = 1.0
var region_x = 0
var size = 512 * 4

# Called when the node enters the scene tree for the first time.
func _ready():
	_timer = Timer.new()
	add_child(_timer)
	
	_timer.connect("timeout", self, "OnTimeout")
	_timer.set_wait_time(delay)
	_timer.set_one_shot(false)
	_timer.start()
	
	for bridge in get_tree().get_nodes_in_group("Bridges"):
		bridge.connect("TurnOffWater", self, "TurnOffWater")
		bridge.connect("TurnOnWater", self, "TurnOnWater")
	
func OnTimeout():
	delay = rand_range(0.5, 1.2)
	_timer.set_wait_time(delay)
	region_x += 512
	region_x %= size
	tile_set.tile_set_region(0, Rect2(region_x, 0.0, 256.0, 192))
	
func TurnOffWater():
	self.set_collision_layer_bit(0, false)
	self.set_collision_mask_bit(0, false)
	
func TurnOnWater():
	self.set_collision_layer_bit(0, true)
	self.set_collision_mask_bit(0, true)
	
