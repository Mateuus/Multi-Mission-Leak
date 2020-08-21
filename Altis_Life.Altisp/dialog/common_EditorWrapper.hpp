///////////////////////////////////////////////////////////////////////////
/// Base Classes Wrapped to Altis Life
///////////////////////////////////////////////////////////////////////////
class RscStructuredText : Life_RscStructuredText
{
	
};
class RscPicture : Life_RscPicture
{
	
};
class RscEdit : Life_RscEdit
{
	
};
class RscCombo : Life_RscCombo
{
	
};
class RscListBox : Life_RscListBox
{
	
};
class RscShortcutButton : Life_RscShortcutButton
{
	
};
class RscShortcutButtonMain : Life_RscShortcutButtonMain
{
	
};
class RscFrame : Life_RscFrame
{
	
};
class RscSlider : Life_RscSlider
{
	
};
class IGUIBack : Life_RscText
{
	colorBackground[] = {0, 0, 0, 0.7};
};
class RscCheckBox : Life_RscCheckBox
{
	
};

class RscButtonMenu : Life_RscButtonMenu
{
	
};
class RscButtonMenuOK : Life_RscButtonMenu
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
class RscButtonMenuCancel : Life_RscButtonMenu
{
	idc = 2;
	shortcuts[] = 
	{
		"0x00050000 + 1"
	};
	text = "Close";
};
class RscControlsGroup : Life_RscControlsGroup
{
	
};
