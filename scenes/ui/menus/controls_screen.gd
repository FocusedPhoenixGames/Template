extends CanvasLayer

signal back_pressed

@export var actionItems: Array[String]
@export var theme: Theme

@onready var remapContainer: GridContainer = $%RemapContainer
@onready var backButton: Button = $%BackButton


func _ready() -> void:
	create_action_remap()
	backButton.pressed.connect(on_back_button_pressed)


func create_action_remap() -> void:
	var previousItem
	for index in range(actionItems.size()):
		var action = actionItems[index]
		var label = Label.new()
		label.text = action
		label.theme = theme
		remapContainer.add_child(label)
		
		var button = RemapButton.new()
		button.action = action
		button.theme = theme
		
		if previousItem != null:
			button.focus_neighbor_top = previousItem.get_path()
			previousItem.focus_neighbor_bottom = button.get_path()
		
		if index == actionItems.size() - 1:
			backButton.focus_neighbor_top = button.get_path()
			button.focus_neighbor_bottom = backButton.get_path()
		
		previousItem = button
		remapContainer.add_child(button)


func on_back_button_pressed() -> void:
	back_pressed.emit()
