extends CanvasLayer

@onready var battery_ui = $BatteryUI

func update_ui():
	battery_ui.update_ui()
