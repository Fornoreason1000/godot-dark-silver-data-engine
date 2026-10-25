@tool
extends EditorPlugin

## Name of Autoload to access Database
const AUTOLOAD_NAME = "RPGData";
## This list of paths to create
const PATHS_TO_CREATE = [
	"res://database/",
	"res://database/items/",
	"res://database/skills/",
	"res://database/actors/"
]

func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	# Automatically injects the database system into the game's Autoload list
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/dark_silver_engine/src/game_database.gd");
	# Initialization of the plugin goes here.
	_ensure_database_dir_exsist();
	pass
	
func _ensure_database_dir_exsist() -> void:
	for path in PATHS_TO_CREATE:
		if not DirAccess.dir_exists_absolute(path):
			var error = DirAccess.make_dir_absolute(path)
			if error == OK:
				print("Dark Silver Engine: Created folder -> ", path)
			else:
				push_error("Dark Silver Engine: Failed to create folder -> " + path + " (Error code: " + str(error) + ")")
	EditorInterface.get_resource_filesystem().scan();
	pass


func _exit_tree() -> void:
	remove_autoload_singleton(AUTOLOAD_NAME);
	# Clean-up of the plugin goes here.
	pass
