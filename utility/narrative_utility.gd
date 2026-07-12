class_name NarrativeUtility


static func queue_options(options: Dictionary[String, Callable], title: String = "") -> void:
	var dialogue_menu := _get_dialogue_menu()
	await dialogue_menu.queue.add("", title, options)


static func queue_dialogue(dialogue: String = "", title: String = "",
		options: Dictionary[String, Callable] = {}) -> void:
	var dialogue_menu := _get_dialogue_menu()
	await dialogue_menu.queue.add(dialogue, title, options)


static func queue_multi_dialogue(dialogue: Array[String] = [], title: String = "") -> void:
	assert(dialogue.size() > 0, "Empty dialogue")
	
	var dialogue_menu := _get_dialogue_menu()
	for entry: String in dialogue.slice(0, -1):
		dialogue_menu.queue.add.call_deferred(entry, title)
	
	var last_entry: String = dialogue.back()
	await dialogue_menu.queue.add(last_entry, title)


static func _get_dialogue_menu() -> DialogueMenu:
	return GameUtility.get_game().dialogue_menu
