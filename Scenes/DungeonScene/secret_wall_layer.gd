extends TileMapLayer


func toggle_secret_walls(activate: bool):
	visible = !activate
	collision_enabled = !activate
