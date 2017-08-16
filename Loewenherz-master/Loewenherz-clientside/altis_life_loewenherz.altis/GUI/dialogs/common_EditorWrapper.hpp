///////////////////////////////////////////////////////////////////////////
/// Base Classes Wrapped to Altis life
///////////////////////////////////////////////////////////////////////////
class RscText : lhm_RscText
{
	
};
class RscStructuredText : lhm_RscStructuredText
{
	
};
class RscPicture : lhm_RscPicture
{
	
};
class RscEdit : lhm_RscEdit
{
	
};
class RscCombo : lhm_RscCombo
{
	
};
class RscListBox : lhm_RscListBox
{
	
};
class RscButton : lhm_RscButton
{
	
};
class RscShortcutButton : lhm_RscShortcutButton
{
	
};
class RscShortcutButtonMain : lhm_RscShortcutButtonMain
{
	
};
class RscFrame : lhm_RscFrame
{
	
};
class RscSlider : lhm_RscSlider
{
	
};
class IGUIBack : lhm_RscText
{
	colorBackground[] = {0, 0, 0, 0.7};
};
class RscCheckBox : lhm_RscCheckBox
{
	
};

class RscButtonMenu : lhm_RscButtonMenu
{
	
};
class RscButtonMenuOK : lhm_RscButtonMenu
{
	idc = 1;
	shortcuts[] = 
	{
		"0x00050000 + 0",
		28,
		57,
		156
	};
	default = 1;
	text = "OK";
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",
		0.09,
		1
	};
};
class RscButtonMenuCancel : lhm_RscButtonMenu
{
	idc = 2;
	shortcuts[] = 
	{
		"0x00050000 + 1"
	};
	text = "Abbrechen";
};
class RscControlsGroup : lhm_RscControlsGroup
{
	
};
