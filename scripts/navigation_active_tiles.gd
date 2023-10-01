extends NavigationRegion2D


const TILE_SIZE = 64
const TILES_N = 6
const TILES_M = 6


func update_nav_polygon():
	print("updating")
	var polygon = NavigationPolygon.new()
	var vertices = PackedVector2Array([])
	for j in range(TILES_M + 1):
		for i in range(TILES_N + 1):
			vertices.append(Vector2(i * TILE_SIZE, j * TILE_SIZE))
	polygon.vertices = vertices
	for j in range(TILES_M):
		for i in range(TILES_N):
			# sanity check: consider the case TILES_N = 1
			var first_idx = j * (TILES_N + 1) + i
			polygon.add_polygon(
				PackedInt32Array([
					first_idx,
					first_idx + 1,
					first_idx + TILES_N + 2,
					first_idx + TILES_N + 1,
				])
			)
	navigation_polygon = polygon


func _ready():
	update_nav_polygon()
	EventsHandler.connect("tile_changed", update_nav_polygon)
