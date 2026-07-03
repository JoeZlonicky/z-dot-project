extends DevMenu


func create_dropdowns() -> void:
	dropdowns.create_menu("Utility", UtilityDevMenuEntries.get_entries())
