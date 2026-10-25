@tool
class_name ItemData
extends Resource

@export var id: String:
	set(new_value):
		id = new_value;
		if Engine.is_editor_hint():
			
			pass

@export var item_name: String
@export_multiline()
var description: String
@export var price: int
@export var icon: Texture2D
