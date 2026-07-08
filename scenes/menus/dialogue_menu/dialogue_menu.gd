class_name DialogueScreen
extends CanvasLayer

@onready var queue: DialogueQueue = $DialogueQueue

@onready var _margin_container: MarginContainer = %MarginContainer
@onready var _dialogue_container: Container = %DialogueContainer


func _ready() -> void:
	queue.started.connect(_on_queue_started)
	queue.finished.connect(_on_queue_finished)


func _unhandled_input(event: InputEvent) -> void:
	if not visible or not (event.is_action_pressed("ui_accept")):
		return
	
	queue.next()
	get_viewport().set_input_as_handled()


func _animate_first_dialogue() -> void:
	# Kinda gross but we need to wait for UI to update after being shown
	# By using modulate, instead of hiding, the UI is still correct but doesn't show yet
	_margin_container.modulate = Color.TRANSPARENT
	await get_tree().process_frame
	await get_tree().process_frame
	var dialogue_center := _dialogue_container.get_global_rect().get_center()
	_margin_container.pivot_offset = dialogue_center
	_margin_container.modulate = Color.WHITE
	
	var tween := create_tween()
	tween.tween_property(_margin_container, "scale", Vector2.ONE,
		0.2).from(Vector2.ZERO)


func _on_queue_started() -> void:
	_animate_first_dialogue()
	show()


func _on_queue_finished() -> void:
	hide()
