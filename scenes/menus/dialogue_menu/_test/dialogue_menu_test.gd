extends Node


@onready var title_edit: LineEdit = $VBoxContainer/TitleEdit
@onready var content_edit: LineEdit = $VBoxContainer/ContentEdit
@onready var dialogue_menu: DialogueMenu = $DialogueMenu


func _on_add_button_pressed() -> void:
	dialogue_menu.queue.add(content_edit.text, title_edit.text)
