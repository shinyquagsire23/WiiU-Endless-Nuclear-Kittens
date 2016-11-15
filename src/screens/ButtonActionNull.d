module screens.ButtonActionNull;

import screens.ButtonAction;
import nuclear.Game;

public class ButtonActionNull : ButtonAction
{

	public void hover() { /*Game.playSound(Game.BUTTON_HOVER);*/ }

	public void unhover() {}

	public void click() {}

}
