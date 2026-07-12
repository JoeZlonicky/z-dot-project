extends Node


@onready var title_edit: LineEdit = $VBoxContainer/TitleEdit
@onready var content_edit: LineEdit = $VBoxContainer/ContentEdit
@onready var dialogue_screen: DialogueScreen = $DialogueScreen


func _on_add_button_pressed() -> void:
	dialogue_screen.queue.add(content_edit.text, title_edit.text)
