extends Control

@onready var start_game : Button = $MarginContainer/HBoxContainer/VBoxContainer/StartGame
@onready var exit_game : Button = $MarginContainer/HBoxContainer/VBoxContainer/ExitGame

@export var starting_level_path : String

func _ready():
	start_game.button_down.connect(on_start_game_pressed)
	exit_game.button_down.connect(on_exit_game_pressed)
	
func on_start_game_pressed() -> void:
	TransitionScene.load_scene(starting_level_path)

func on_exit_game_pressed() -> void:
	get_tree().quit()
