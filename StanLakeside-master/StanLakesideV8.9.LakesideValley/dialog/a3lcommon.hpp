///////////////////////////////////////////////////////////////////////////
/// Styles

///////////////////////////////////////////////////////////////////////////

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar 
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

// Economy menu's

#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.04)

#define true 		  1
#define false 		  0

///////////////////////////////////////////////////////////////////////////
/// Base Classes
///////////////////////////////////////////////////////////////////////////

class RscObject
{
			model = "\A3\ui_f\objects\face_preview";
			modelWoman = "\A3\ui_f\objects\face_preview";
			idc = 6001;
			type = 80;
			x = "35 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
			y = "7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))";
			z = 0.28;
			xBack = 0.75;
			yBack = 0.9;
			zBack = 0.25;
			scale = 0.21;
			direction[] = {0,0,1};
			up[] = {0,1,0};
			faceType = "Man_A3";
			selectionLBrow = "lBrow";
			selectionMBrow = "mBrow";
			selectionRBrow = "rBrow";
			selectionLMouth = "lMouth";
			selectionMMouth = "mMouth";
			selectionRMouth = "rMouth";
			selectionEyelid = "eyelids";
			selectionLip = "LLip";
			boneHead = "head";
			boneLEye = "l_eye";
			boneREye = "r_eye";
			boneLEyelidUp = "eye_upl";
			boneREyelidUp = "eye_upr";
			boneLEyelidDown = "eye_lwl";
			boneREyelidDown = "eye_lwr";
			boneLPupil = "l_pupila";
			boneRPupil = "r_pupila";
			selectionPersonality = "personality";
			selectionGlasses = "eyelids";
};

class RscShortcutButton
{
	type = 16;
	x = 0.1;
	y = 0.1;
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos
	{
		left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
	shortcuts[] = 
	{
	};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = 
	{
		1,
		1,
		1,
		1
	};
	color2[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorBackground[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		1
	};
	colorBackground2[] = 
	{
		1,
		1,
		1,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	class Attributes
	{
		font = "EtelkaNarrowMediumPro";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	periodFocus = 1.2;
	periodOver = 0.8;
	period = 0.4;
	font = "EtelkaNarrowMediumPro";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	action = "";
	class AttributesImage
	{
		font = "EtelkaNarrowMediumPro";
		color = "#E5E5E5";
		align = "left";
	};
};

class RscEdit
{
	access = 0;
	type = 2;
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorBackground[] = 
	{
		0,
		0,
		0,
		1
	};
	colorText[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorSelection[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		1
	};
	autocomplete = "";
	text = "";
	size = 0.2;
	style = "0x00 + 0x40";
	font = "EtelkaNarrowMediumPro";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	canModify = 1;
};



class RscText
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 1;
	colorShadow[] = 
	{
		0,
		0,
		0,
		0.5
	};
	font = "EtelkaNarrowMediumPro";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	linespacing = 1;
};
class RscStructuredText
{
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	class Attributes
	{
		font = "EtelkaNarrowMediumPro";
		color = "#ffffff";
		align = "left";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 1;
};
class RscPicture
{
	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	font = "EtelkaNarrowMediumPro";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};

class RscListBox
{
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorScrollbar[] = 
	{
		1,
		0,
		0,
		0
	};
	colorSelect[] = 
	{
		0,
		0,
		0,
		1
	};
	colorSelect2[] = 
	{
		0,
		0,
		0,
		1
	};
	colorSelectBackground[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorSelectBackground2[] = 
	{
		1,
		1,
		1,
		0.5
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0.3
	};
	soundSelect[] = 
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.09,
		1
	};
	class ListScrollBar
	{
		color[] = 
		{
			1,
			1,
			1,
			1
		};
		autoScrollEnabled = 1;
	};
	access = 0;
	type = 5;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	colorShadow[] = 
	{
		0,
		0,
		0,
		0.5
	};
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
	style = 16;
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	period = 1.2;
	maxHistoryDelay = 1;
};

class RscButton2
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		0.4,
		0.4,
		0.4,
		1
	};
	colorBackground[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0.7
	};
	colorBackgroundDisabled[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorBackgroundActive[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		1
	};
	colorFocused[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		1
	};
	colorShadow[] = 
	{
		0,
		0,
		0,
		1
	};
	colorBorder[] = 
	{
		0,
		0,
		0,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font="EtelkaNarrowMediumPro";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};

class RscButtonBlue
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		0.4,
		0.4,
		0.4,
		1
	};
	colorBackground[] = 
	{
	0,
	0.25,
	0.54,
	1
	};
	colorBackgroundDisabled[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorBackgroundActive[] = 
	{
		0,
		0.32,
		0.9,
		1
	};
	colorFocused[] = 
	{
		0,
		0.32,
		0.9,
		1
	};
	colorShadow[] = 
	{
		0,
		0,
		0,
		1
	};
	colorBorder[] = 
	{
		0,
		0,
		0,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font="EtelkaNarrowMediumPro";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};



class IGUIBack
{
	type = 0;
	idc = 124;
	style = 128;
	text = "";
	colorText[] = 
	{
		0,
		0,
		0,
		0
	};
	font="EtelkaNarrowMediumPro";
	sizeEx = 0;
	shadow = 0;
	x = 0.1;
	y = 0.1;
	w = 0.1;
	h = 0.1;
	colorbackground[] = 
	{
		"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"
	};
};
class IGUIHeader
{
	type = 0;
	idc = 124;
	style = 128;
	text = "";
	colorText[] = 
	{
		0,
		0,
		0,
		0
	};
	font="EtelkaNarrowMediumPro";
	sizeEx = 0;
	shadow = 0;
	x = 0.1;
	y = 0.1;
	w = 0.1;
	h = 0.1;
	colorbackground[] = 
	{
	0,
	0.25,
	0.54,
	1
	};
};

class RscFrame
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	font="EtelkaNarrowMediumPro";
	sizeEx = 0.02;
	text = "";
};

class RscButton
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = 
	{
		0, // 1
		0, // 1
		0, // 1
		0 // 1
	};
	colorDisabled[] = 
	{
		0, // 0.4
		0, // 0.4
		0, // 0.4
		1 // 1
	};
	colorBackground[] = 
	{
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0 // 0.7
	};
	colorBackgroundDisabled[] = 
	{
		0, // 0.95,
		0, // 0.95,
		0, // 0.95,
		0 // 1
	};
	colorBackgroundActive[] = 
	{
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0 // 1
	};
	colorFocused[] = 
	{
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0 // 1
	};
	colorShadow[] = 
	{
		0,
		0,
		0,
		0 // 1
	};
	colorBorder[] = 
	{
		0,
		0,
		0,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "EtelkaNarrowMediumPro";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};

class RscButtonSilent
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = 
	{
		0, // 1
		0, // 1
		0, // 1
		0 // 1
	};
	colorDisabled[] = 
	{
		0, // 0.4
		0, // 0.4
		0, // 0.4
		1 // 1
	};
	colorBackground[] = 
	{
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0 // 0.7
	};
	colorBackgroundDisabled[] = 
	{
		0, // 0.95,
		0, // 0.95,
		0, // 0.95,
		0 // 1
	};
	colorBackgroundActive[] = 
	{
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0 // 1
	};
	colorFocused[] = 
	{
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		0, // "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0 // 1
	};
	colorShadow[] = 
	{
		0,
		0,
		0,
		0 // 1
	};
	colorBorder[] = 
	{
		0,
		0,
		0,
		1
	};
	soundEnter[] = 
	{
		"",
		0.09,
		1
	};
	soundPush[] = 
	{
		"",
		0.09,
		1
	};
	soundClick[] = 
	{
		"",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"",
		0.09,
		1
	};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "EtelkaNarrowMediumPro";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};

class RscCombo
{
	colorSelect[] = 
	{
		0,
		0,
		0,
		1
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		1
	};
	colorScrollbar[] = 
	{
		1,
		0,
		0,
		1
	};
	soundSelect[] = 
	{
		"\A3\ui_f\data\sound\RscCombo\soundSelect",
		0.1,
		1
	};
	soundExpand[] = 
	{
		"\A3\ui_f\data\sound\RscCombo\soundExpand",
		0.1,
		1
	};
	soundCollapse[] = 
	{
		"\A3\ui_f\data\sound\RscCombo\soundCollapse",
		0.1,
		1
	};
	class ComboScrollBar
	{
		color[] = 
		{
			1,
			1,
			1,
			1
		};
	};
	access = 0;
	type = 4;
	maxHistoryDelay = 1;
	colorSelectBackground[] = 
	{
		1,
		1,
		1,
		0.7
	};
	colorActive[] = 
	{
		1,
		0,
		0,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
	style = "0x10 + 0x200";
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
};

// economy

class RscButtoneco {
access = 0;
borderSize = 0;
colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.7};
colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
colorBorder[] = {0,0,0,1};
colorDisabled[] = {0.4,0.4,0.4,1};
colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
colorShadow[] = {0,0,0,1};
colorText[] = {1,1,1,1};
font = "PuristaMedium";
h = 0.039216;
offsetPressedX = 0.002;
offsetPressedY = 0.002;
offsetX = 0.003;
offsetY = 0.003;
shadow = 2;
sizeEx = "(                     (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
style = 2;
text = "";
type = 1;
w = 0.095589;
x = 0;
y = 0;
 
};
 
class IGUIBackeco {
	colorbackground[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
	colorText[] = {0,0,0,0};
	font = "PuristaMedium";
	h = 0.1;
	idc = 124;
	shadow = 0;
	sizeEx = 0;
	style = 128;
	text = "";
	type = 0;
	w = 0.1;
	x = 0.1;
	y = 0.1;
};

class RscButtonecoMenu {
action = "";
animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
color2[] = {0,0,0,1};
color[] = {1,1,1,1};
colorBackground2[] = {0.75,0.75,0.75,1};
colorBackground[] = {0,0,0,0.8};
colorBackgroundFocused[] = {1,1,1,1};
colorDisabled[] = {1,1,1,0.25};
colorFocused[] = {0,0,0,1};
colorText[] = {1,1,1,1};
default = 0;
font = "PuristaMedium";
h = 0.039216;
idc = -1;
period = 1.2;
periodFocus = 1.2;
periodOver = 1.2;
shadow = 0;
shortcuts[] = {};
size = "(                       (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
sizeEx = "(                     (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
style = "0x02 + 0xC0";
text = "";
textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
tooltipColorBox[] = {1,1,1,1};
tooltipColorShade[] = {0,0,0,0.65};
tooltipColorText[] = {1,1,1,1};
type = 16;
w = 0.095589;
x = 0;
y = 0;
 
class Attributes {
align = "left";
color = "#E5E5E5";
font = "PuristaLight";
shadow = "false";
 
};
class AttributesImage {
align = "left";
color = "#E5E5E5";
font = "PuristaMedium";
 
};
class HitZone {
bottom = 0;
left = 0;
right = 0;
top = 0;
 
};
 
class ShortCutPos {
h = 0.03;
left = "(6.25 *                         (                       ((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
top = 0.005;
w = 0.0225;
 
};
class TextPos {
bottom = 0;
left = "0.25 *                  (                       ((safezoneW / safezoneH) min 1.2) / 40)";
right = 0.005;
top = "(                        (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) -                (                       (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
 
};
 
};
 
class RscButtonecoMenuCancel {
action = "";
animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
color2[] = {0,0,0,1};
color[] = {1,1,1,1};
colorBackground2[] = {0.75,0.75,0.75,1};
colorBackground[] = {0,0,0,0.8};
colorBackgroundFocused[] = {1,1,1,1};
colorDisabled[] = {1,1,1,0.25};
colorFocused[] = {0,0,0,1};
colorText[] = {1,1,1,1};
default = 0;
font = "PuristaMedium";
h = 0.039216;
idc = 2;
period = 1.2;
periodFocus = 1.2;
periodOver = 1.2;
shadow = 0;
shortcuts[] = {"0x00050000 + 1"};
size = "(                       (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
sizeEx = "(                     (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
style = "0x02 + 0xC0";
text = "Cancel";
textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
tooltipColorBox[] = {1,1,1,1};
tooltipColorShade[] = {0,0,0,0.65};
tooltipColorText[] = {1,1,1,1};
type = 16;
w = 0.095589;
x = 0;
y = 0;
 
class Attributes {
align = "left";
color = "#E5E5E5";
font = "PuristaLight";
shadow = "false";
 
 
};
 
class AttributeImage {
align = "left";
color = "#E5E5E5";
font = "PuristaMedium";
 
 
};
 
class HitZone {
bottom = 0;
left = 0;
right = 0;
top = 0;
 
 
};
 
class ShortCutPos {
h = 0.03;
left = "(6.25 *                         (                       ((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
top = 0.005;
w = 0.0225;
 
 
};
 
class TextPos {
bottom = 0;
left = "0.25 *                  (                       ((safezoneW / safezoneH) min 1.2) / 40)";
right = 0.005;
top = "(                        (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) -                (                       (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
 
 
};
 
};
 
class RscButtonecoMenuOk {

action = "";
animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
color2[] = {0,0,0,1};
color[] = {1,1,1,1};
colorBackground2[] = {0.75,0.75,0.75,1};
colorBackground[] = {0,0,0,0.8};
colorBackgroundFocused[] = {1,1,1,1};
colorDisabled[] = {1,1,1,0.25};
colorFocused[] = {0,0,0,1};
colorText[] = {1,1,1,1};
default = 1;
font = "PuristaMedium";
h = 0.039216;
idc = 1;
period = 1.2;
periodFocus = 1.2;
periodOver = 1.2;
shadow = 0;
shortcuts[] = {"0x00050000 + 0",28,57,156};
size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",0.09,1};
style = "0x02 + 0xC0";
text = "OK";
textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
tooltipColorBox[] = {1,1,1,1};
tooltipColorShade[] = {0,0,0,0.65};
tooltipColorText[] = {1,1,1,1};
type = 16;
w = 0.095589;
x = 0;
y = 0;


 
class Attributes {
align = "left";
color = "#E5E5E5";
font = "PuristaLight";
shadow = "false";
 
 
};
 
class AttributesImage {
align = "left";
color = "#E5E5E5";
font = "PuristaMedium";
 
 
};
 
class HitZone {
bottom = 0;
left = 0;
right = 0;
top = 0;
 
 
};
 
class ShortcutPos {
h = 0.03;
left = "(6.25 *                         (                       ((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
top = 0.005;
w = 0.0225;
 
};
 
 
class TextPos {
bottom = 0;
left = "0.25 *                  (                       ((safezoneW / safezoneH) min 1.2) / 40)";
right = 0.005;
top = "(                        (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) -                (                       (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
 
 
};
 
};
 
 
class RscCheckBoxeco {
checked_strings[] = {"CHECKED"};
color[] = {0,0,0,0};
colorBackground[] = {0,0,1,1};
colorDisable[] = {0.4,0.4,0.4,1};
colorSelect[] = {0,0,0,1};
colorSelectedBg[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
colorText[] = {1,0,0,1};
colorTextDisable[] = {0.4,0.4,0.4,1};
colorTextSelect[] = {0,0.8,0,1};
columns = 1;
font = "PuristaMedium";
h = 0.029412;
idc = -1;
rows = 1;
sizeEx = "(                     (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
strings[] = {"UNCHECKED"};
style = 0;
tooltipColorBox[] = {1,1,1,1};
tooltipColorShade[] = {0,0,0,0.65};
tooltipColorText[] = {1,1,1,1};
type = 7;
w = "LINE_W(WVAL)";
x = "LINE_X(XVAL)";
y = "LINE_Y";
 
};

class RscComboeco {
access = 0;
arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
colorActive[] = {1,0,0,1};
colorBackground[] = {0,0,0,1};
colorDisabled[] = {1,1,1,0.25};
colorScrollbar[] = {1,0,0,1};
colorSelect[] = {0,0,0,1};
colorSelectBackground[] = {1,1,1,0.7};
colorText[] = {1,1,1,1};
font = "PuristaMedium";
h = 0.035;
maxHistoryDelay = 1;
shadow = 0;
sizeEx = "(                     (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
style = "0x10 + 0x200";
tooltipColorBox[] = {1,1,1,1};
tooltipColorShade[] = {0,0,0,0.65};
tooltipColorText[] = {1,1,1,1};
type = 4;
w = 0.12;
wholeHeight = 0.45;
x = 0;
y = 0;

class ComboScrollBareco {
arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
autoScrollDelay = 5;
autoScrollEnabled = 0;
autoScrollRewind = 0;
autoScrollSpeed = -1;
border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
color[] = {1,1,1,1};
colorActive[] = {1,1,1,1};
colorDisabled[] = {1,1,1,0.3};
height = 0;
scrollSpeed = 0.06;
shadow = 0;
thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
width = 0;
 
};
};
 
class RscControlsGroupecoeco {
h = 1;
idc = -1;
shadow = 0;
style = 16;
type = 15;
w = 1;
x = 0;
y = 0;
 
class Controls {
};
 
class HScrollbareco {
arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
autoScrollDelay = 5;
autoScrollEnabled = 0;
autoScrollRewind = 0;
autoScrollSpeed = -1;
border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
color[] = {1,1,1,1};
colorActive[] = {1,1,1,1};
colorDisabled[] = {1,1,1,0.3};
height = 0.028;
scrollSpeed = 0.06;
shadow = 0;
thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
width = 0;
 
 
};
 
class VScrollbareco {
arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
autoScrollDelay = 5;
autoScrollEnabled = 1;
autoScrollRewind = 0;
autoScrollSpeed = -1;
border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
color[] = {1,1,1,1};
colorActive[] = {1,1,1,1};
colorDisabled[] = {1,1,1,0.3};
height = 0;
scrollSpeed = 0.06;
shadow = 0;
thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
width = 0.021;
 
 
};
 
};
 
class RscEditeco {
access = 0;
autocomplete = "";
canModify = 1;
colorBackground[] = {0,0,0,1};
colorDisabled[] = {1,1,1,0.25};
colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
colorText[] = {0.95,0.95,0.95,1};
font = "PuristaMedium";
h = 0.04;
shadow = 2;
size = 0.2;
sizeEx = "(                     (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
style = "0x00 + 0x40";
text = "";
tooltipColorBox[] = {1,1,1,1};
tooltipColorShade[] = {0,0,0,0.65};
tooltipColorText[] = {1,1,1,1};
type = 2;
w = 0.2;
x = 0;
y = 0;
 
 
};
 
class RscFrameeco {
colorBackground[] = {0,0,0,0};
colorText[] = {1,1,1,1};
font = "PuristaMedium";
idc = -1;
shadow = 2;
sizeEx = 0.02;
style = 64;
text = "";
type = 0;
 
 
};
 
class RscListBoxeco {
access = 0;
arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
autoScrollDelay = 5;
autoScrollRewind = 0;
autoScrollSpeed = -1;
colorBackground[] = {0,0,0,0.3};
colorDisabled[] = {1,1,1,0.25};
colorScrollbar[] = {1,0,0,0};
colorSelect2[] = {0,0,0,1};
colorSelect[] = {0,0,0,1};
colorSelectBackground2[] = {1,1,1,0.5};
colorSelectBackground[] = {0.95,0.95,0.95,1};
colorShadow[] = {0,0,0,0.5};
colorText[] = {1,1,1,1};
font = "PuristaMedium";
h = 0.4;
maxHistoryDelay = 1;
period = 1.2;
rowHeight = 0;
shadow = 0;
sizeEx = "(                     (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
soundSelect[] = {"\A3\ui_f\data\sound\RscListBox\soundSelect",0.09,1};
style = 16;
tooltipColorBox[] = {1,1,1,1};
tooltipColorShade[] = {0,0,0,0.65};
tooltipColorText[] = {1,1,1,1};
type = 5;
w = 0.4;
 
class ListScrollBar {
arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
autoScrollDelay = 5;
autoScrollEnabled = 1;
autoScrollRewind = 0;
autoScrollSpeed = -1;
border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
color[] = {1,1,1,1};
colorActive[] = {1,1,1,1};
colorDisabled[] = {1,1,1,0.3};
height = 0;
scrollSpeed = 0.06;
shadow = 0;
thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
width = 0;
 
 
};
};
 
 
class RscShortcutButtoneco {
action = "";
animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
color2[] = {0.95,0.95,0.95,1};
color[] = {1,1,1,1};
colorBackground2[] = {1,1,1,1};
colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
colorDisabled[] = {1,1,1,0.25};
colorFocused[] = {1,1,1,1};
default = 0;
font = "PuristaMedium";
h = "(          (               ((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
idc = -1;
period = 0.4;
periodFocus = 1.2;
periodOver = 0.8;
shadow = 1;
shortcuts[] = {};
size = "(                       (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
sizeEx = "(                     (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
style = 0;
text = "";
textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
type = 16;
w = 0.183825;
x = 0.1;
y = 0.1;
 
class Attributes {
align = "left";
color = "#E5E5E5";
font = "PuristaMedium";
shadow = "true";
 
 
};
 
class AttributesImage {
align = "left";
color = "#E5E5E5";
font = "PuristaMedium";
 
 
};
 
class HitZone {
bottom = 0;
left = 0;
right = 0;
top = 0;
 
 
};
 
class ShortcutPos {
h = "(                  (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
left = 0;
top = "(                        (               (               ((safezoneW / safezoneH) min 1.2) / 1.2) / 20) -                (                       (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
w = "(                  (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
 
 
};
 
class TextPos {
bottom = 0;
left = "(                       (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
right = 0.005;
top = "(                        (               (               ((safezoneW / safezoneH) min 1.2) / 1.2) / 20) -                (                       (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
 
 
};
};

 
class RscTree {
 
access = 0;
borderSize = 0;
colorArrow[] = {1,1,1,1};
colorBackground[] = {0,0,0,0};
colorBorder[] = {0,0,0,0};
colorDisabled[] = {1,1,1,0.25};
colorMarked[] = {0.2,0.3,0.7,1};
colorMarkedSelected[] = {0,0.5,0.5,1};
colorMarkedText[] = {0,0,0,1};
colorSelect[] = {1,1,1,0.7};
colorSelectBackground[] = {0,0,0,0.5};
colorSelectText[] = {0,0,0,1};
colorText[] = {1,1,1,1};
expandedTexture = "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa";
expandOnDoubleclick = 1;
font = "PuristaMedium";
hiddenTexture = "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
maxHistoryDelay = 1;
multiselectEnabled = 0;
rowHeight = 0.0439091;
shadow = 0;
sizeEx = "(                     (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
style = 0;
type = 12;
 
class ScrollBar {
arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
autoScrollDelay = 5;
autoScrollEnabled = 0;
autoScrollRewind = 0;
autoScrollSpeed = -1;
border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
color[] = {1,1,1,0.6};
colorActive[] = {1,1,1,1};
colorDisabled[] = {1,1,1,0.3};
height = 0;
scrollSpeed = 0.06;
shadow = 0;
thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
width = 0;
 
 
};
 
};