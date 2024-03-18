extends CanvasLayer

var optionsScene = preload("res://scenes/ui/menus/options_screen.tscn")
var creditsScene = preload("res://scenes/ui/menus/credits_screen.tscn")


func _ready() -> void:
	MusicPlayer.play_music(0)
	$%PlayButton.pressed.connect(on_play_pressed)
	$%OptionsButton.pressed.connect(on_options_pressed)
	$%CreditsButton.pressed.connect(on_credits_pressed)
	$%QuitButton.pressed.connect(on_quit_pressed)
	$%PlayButton.grab_focus()


func on_play_pressed() -> void:
	#get_tree().change_scene_to_file("res://scenes/intro/intro_screen.tscn")
	pass


func on_options_pressed() -> void:
	var optionsInstance = optionsScene.instantiate()
	add_child(optionsInstance)
	optionsInstance.back_pressed.connect(on_options_closed.bind(optionsInstance))


func on_credits_pressed() -> void:
	var creditsInstance = creditsScene.instantiate()
	add_child(creditsInstance)
	creditsInstance.back_pressed.connect(on_credits_closed.bind(creditsInstance))


func on_quit_pressed() -> void:
	get_tree().quit()


func on_options_closed(optionsInstance: Node) -> void:
	optionsInstance.queue_free()
	$%OptionsButton.grab_focus()


func on_credits_closed(creditsInstance: Node) -> void:
	creditsInstance.queue_free()
	$%CreditsButton.grab_focus()
