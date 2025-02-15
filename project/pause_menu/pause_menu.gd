extends Control


func resume():
	get_tree().paused = false

func pause():
	get_tree().paused = true

func testEsc():
	if Input.is_action_just_pressed("esc"):
		if get_tree().paused == false:
			pause()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if get_tree().paused == true:
			resume()


func _on_resume_pressed() -> void:
	resume()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_sleep_pressed() -> void:
	pass # Replace with function body.

func _process(delta):
	testEsc()
