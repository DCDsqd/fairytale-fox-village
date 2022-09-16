# SQLite database functions & variables

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db # Actual database object, not valid unlill setup_db() is called
var db_path = "res://db/data.db" # Path do db

# Sets up the database connection and makes @db variable valid
func setup_db() -> void:
	print("database.gd::setup_db was called")
	db = SQLite.new()
	db.path = db_path
	
func open_db() -> void:
	db.open_db()
	
func close_db() -> void:
	db.close_db()
