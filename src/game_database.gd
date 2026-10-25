extends Node


const DATABASE_DIRS = [
	"res://database/",
	"res://database/items/",
	"res://database/skills/",
	"res://database/actors/"
]

var data_items : Dictionary[String,ItemData] = {
	
} 
var data_skills: Dictionary = {
	
} 
var data_actors : Dictionary = {
	
} 

func _ready(): 
	print(load_data("items"));
	pass
	
	
## loads data from a folder
func load_data(type : String): 
	var loaded_data : Array[Resource] = [];
	
	var dir_path : String = "res://database/" + type
	
	var files = ResourceLoader.list_directory(dir_path)
	## loop through each filename
	for file in files:
		#skip folders
		if file.ends_with("/"):
			continue
			
		var full_path = dir_path.path_join(file);
		
		var res = ResourceLoader.load(full_path);
		## if resource essist add it
		if res:
			loaded_data.append(res)
			add_data(res, type)
			
	pass
	
##
## Adds data to the data base
##
##	
func add_data(data : Resource, type : String):
	if !data.id:
		printerr("Invalid Data: " + data.get_class())
		print(data);
		print(data.id)
		return
		
	var database : Dictionary = self["data_" + type];
	
	## if ID we assume its a valid database item
	if database.has(data.id):
		print("Data Already Exsist, Skipping");
		return;
	database[data.id] = data;

##
## Gets an Item
##
func Item(id : String):
	return data_items[id];

func Actor(id : String):
	return data_actors[id];
