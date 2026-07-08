extends Node


@onready var dialogue_screen: DialogueScreen = $DialogueScreen


func _ready() -> void:
	dialogue_screen.queue.add("Test")
