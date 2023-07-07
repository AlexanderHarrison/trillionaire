extends CenterContainer


func init(text: String):
	$AcceptDialog.set_text(text)
	#$AcceptDialog.position = self.get_screen_position()
	$AcceptDialog.visible = true
