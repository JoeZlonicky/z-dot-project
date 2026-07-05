class_name SettingsMenu
extends CanvasLayer


signal back_pressed

@onready var music_button: VolumeButton = %MusicButton


func _on_visibility_changed() -> void:
	if visible:
		InputDeviceListener.focus_depending_on_device(music_button)


func _on_back_button_pressed() -> void:
	back_pressed.emit()
