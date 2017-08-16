///////////////////////////////////////////////////////////////////////////
/// Base Classes Wrapped to Darkside Life
///////////////////////////////////////////////////////////////////////////
class RscText : DS_RscText
{

};
class RscStructuredText : DS_RscStructuredText
{

};
class RscPicture : DS_RscPicture
{

};
class RscEdit : DS_RscEdit
{

};
class RscCombo : DS_RscCombo
{

};
class RscListBox : DS_RscListBox
{

};
class RscButton : DS_RscButton
{

};
class RscShortcutButton : DS_RscShortcutButton
{

};
class RscShortcutButtonMain : DS_RscShortcutButtonMain
{

};
class RscFrame : DS_RscFrame
{

};
class RscSlider : DS_RscSlider
{

};
class IGUIBack : DS_RscText
{
	colorBackground[] = {0, 0, 0, 0.7};
};
class RscCheckBox : DS_RscCheckBox
{

};

class RscButtonMenu : DS_RscButtonMenu
{

};
class RscButtonMenuOK : DS_RscButtonMenu
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
class RscButtonMenuCancel : DS_RscButtonMenu
{
	idc = 2;
	shortcuts[] =
	{
		"0x00050000 + 1"
	};
	text = "Abort";
};
class RscControlsGroup : DS_RscControlsGroup
{

};