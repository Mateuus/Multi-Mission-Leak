//#define DEFAULTFONT		"Bitstream"
#define DEFAULTFONT "PuristaMedium"
#define CT_STATIC		  0
#define CT_BUTTON		  1
#define CT_EDIT			  2
#define CT_SLIDER		  3
#define CT_COMBO		  4
#define CT_LISTBOX		  5
#define CT_TOOLBOX		  6
#define CT_CHECKBOXES		  7
#define CT_PROGRESS		  8
#define CT_HTML			  9
#define CT_STATIC_SKEW		 10
#define CT_ACTIVETEXT		 11
#define CT_TREE			 12
#define CT_STRUCTURED_TEXT	 13
#define CT_CONTEXT_MENU		 14
#define CT_CONTROLS_GROUP	 15
#define CT_SHORTCUTBUTTON	 16
#define CT_XKEYDESC		 40
#define CT_XBUTTON		 41
#define CT_XLISTBOX		 42
#define CT_XSLIDER		 43
#define CT_XCOMBO		 44
#define CT_ANIMATED_TEXTURE	 45
#define CT_OBJECT		 80
#define CT_OBJECT_ZOOM		 81
#define CT_OBJECT_CONTAINER	 82
#define CT_OBJECT_CONT_ANIM	 83
#define CT_LINEBREAK		 98
#define CT_USER			 99
#define CT_MAP			100
#define CT_MAP_MAIN		101
#define ST_POS			0x0F
#define ST_HPOS			0x03
#define ST_VPOS			0x0C
#define ST_LEFT			0x00
#define ST_RIGHT		0x01
#define ST_CENTER		0x02
#define ST_DOWN			0x04
#define ST_UP			0x08
#define ST_VCENTER		0x0c
#define ST_TYPE			0xF0
#define ST_SINGLE		  0
#define ST_MULTI		 16
#define ST_TITLE_BAR		 32
#define ST_PICTURE		 48
#define ST_FRAME		 64
#define ST_BACKGROUND		 80
#define ST_GROUP_BOX		 96
#define ST_GROUP_BOX2		112
#define ST_HUD_BACKGROUND	128
#define ST_TILE_PICTURE		144
#define ST_WITH_RECT		160
#define ST_LINE			176
#define ST_SHADOW		0x100
#define ST_NO_RECT		0x200
#define ST_KEEP_ASPECT_RATIO	0x800
#define ST_TITLE		ST_TITLE_BAR + ST_CENTER
#define true		1
#define false		0
#define VSoft		0
#define VArmor		1
#define VAir		2
#define TEast		0
#define TWest		1
#define TGuerrila	2
#define TCivilian	3
#define TSideUnknown	4
#define TEnemy		5
#define TFriendly	6
#define TLogic		7
#define private		0
#define protected	1
#define public		2

class CLAY_RscRadioText
{
	type = CT_STATIC;
	idc = -1;
	style = ST_CENTER;
	colorText[] = {0,0,0,1};
	colorBackground[] = {0,0,0,0};
	font = DEFAULTFONT;
	sizeEx = 0.025;
};
class CLAY_RscRadioButton
{
	type = CT_BUTTON;
	idc = -1;
	style = ST_CENTER;
	borderSize = 0;
	colorText[] = {1,0,0,1};
	colorDisabled[] = {0.75,0.75,0.75,0};
	colorBackground[] = {0.2,0.2,0.2,1};
	colorBackgroundActive[] = {0.2,0.2,0.2,1};
	colorBackgroundDisabled[] = {0.35,0.35,0.35,0};
	colorFocused[] = {0.2,0.2,0.2,1};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	font = DEFAULTFONT;
	sizeEx = 0.025;
	offsetX = 0.005;
	offsetY = 0.005;
	offsetPressedX = 0.0025;
	offsetPressedY = 0.0025;
	soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
	soundEnter[] = {"",0.1,1};
	soundEscape[] = {"ui\ui_cc",0.2,1};
	default = false;
};
class CLAY_RscRadioLB_C
{
	style = ST_LEFT;
	idc = -1;
	colorBackground[] = {0,0,0,1};
	colorSelect[] = {0,0,0,1};
	colorSelectBackground[] = {1,0,0,1};
	colorText[] = {1,0,0,1};
	colorScrollbar[] = {0,0,0,1};
	period = 1;
	font = DEFAULTFONT;
	sizeEx = 0.025;
	rowHeight = 0.04;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 10;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class CLAY_RscRadioListBox: CLAY_RscRadioLB_C
{
	type = CT_LISTBOX;
	colorDisabled[] = {0.35,0.35,0.35,1};
	class ScrollBar
	{
		color[] = {0,0,0,1};
		colorActive[] = {1,0,0,1};
		colorDisabled[] = {0.35,0.35,0.35,1};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
	
	class ListScrollBar
	{
		color[] = {0,0,0,1};
		colorActive[] = {1,0,0,1};
		colorDisabled[] = {0.35,0.35,0.35,1};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class CLAY_CarRadio_RadioDlg
{
	idd = 666;
	movingEnable = true;
	controlsBackground[] = {CLAY_RADIO_Bgd, CLAY_RADIO_Title, CLAY_RADIO_Display};
	class CLAY_RADIO_Bgd: CLAY_RscRadioText
	{
		idc = 600;
		colorBackground[] = {0,0,0,1};
		text = ;
		x = 0.1;
		y = 0.35;
		w = 0.8;
		h = 0.35;
		moving = 1;
	};
	class CLAY_RADIO_Title: CLAY_RscRadioText
	{
		idc = 601;
		colorText[] = {1,1,1,1};
		text = "V D O  *  W O L F T O N";
		x = 0.25;
		y = 0.355;
		w = 0.5;
		h = 0.025;
	};
	class CLAY_RADIO_Display: CLAY_RscRadioText
	{
		idc = 602;
		colorBackground[] = {1,0,0,1};
		text = ;
		x = 0.2;
		y = 0.4;
		w = 0.55;
		h = 0.2;
	};
	controls[] = {CLAY_RADIO_ButtonVolUp, CLAY_RADIO_ButtonVolDown, CLAY_RADIO_ButtonPlayPause, CLAY_RADIO_TextTime, CLAY_RADIO_ShowTime, CLAY_RADIO_TextVol, CLAY_RADIO_ShowVol, CLAY_RADIO_TextStat, CLAY_RADIO_TextMainTitle, CLAY_RADIO_TextMusicSource, CLAY_RADIO_TextRepeat, CLAY_RADIO_TextRandom, CLAY_RADIO_TextDisplayColor, CLAY_RADIO_ButtonPre, CLAY_RADIO_ButtonNext, CLAY_RADIO_ButtonSourceUp, CLAY_RADIO_ButtonSourceDown, CLAY_RADIO_ButtonOff, CLAY_RADIO_ButtonPlaylist, CLAY_RADIO_ButtonRepeatSelect, CLAY_RADIO_ButtonRandomSelect, CLAY_RADIO_ButtonKeyColorSelect, CLAY_RADIO_ButtonDisplayColorSelect, CLAY_RADIO_ButtonBackgroundColorSelect};
	class CLAY_RADIO_ButtonVolUp: CLAY_RscRadioButton
	{
		idc = 603;
		text = "+";
		action = "['volUp'] spawn CLAY_fnc_settings;";
		x = 0.125;
		y = 0.415;
		w = 0.05;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonVolDown: CLAY_RscRadioButton
	{
		idc = 604;
		text = "-";
		action = "['volDown'] spawn CLAY_fnc_settings;";
		x = 0.125;
		y = 0.535;
		w = 0.05;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonPlayPause: CLAY_RscRadioButton
	{
		idc = 626;
		text = ">";
		action = "['play'] spawn CLAY_fnc_controls;";
		x = 0.125;
		y = 0.475;
		w = 0.05;
		h = 0.05;
	};
	class CLAY_RADIO_TextTime: CLAY_RscRadioText
	{
		idc = 605;
		text = "Time:";
		x = 0.205;
		y = 0.42;
		w = 0.05;
		h = 0.05;
	};
	class CLAY_RADIO_ShowTime: CLAY_RscRadioText
	{
		idc = 606;
		style = ST_RIGHT;
		sizeEx = 0.05;
		text = "0:00";
		x = 0.255;
		y = 0.42;
		w = 0.08;
		h = 0.05;
	};
	class CLAY_RADIO_TextVol: CLAY_RscRadioText
	{
		idc = 607;
		text = "Volume:";
		x = 0.355;
		y = 0.42;
		w = 0.06;
		h = 0.05;
	};
	class CLAY_RADIO_ShowVol: CLAY_RscRadioText
	{
		idc = 608;
		style = ST_LEFT;
		sizeEx = 0.04;
		text = "||||||||||";
		x = 0.415;
		y = 0.41;
		w = 0.18;
		h = 0.05;
	};
	class CLAY_RADIO_TextStat: CLAY_RscRadioText
	{
		idc = 609;
		style = ST_RIGHT;
		sizeEx = 0.02;
		text = "<Stereo>   [EQ]";
		x = 0.605;
		y = 0.41;
		w = 0.14;
		h = 0.025;
	};
	class CLAY_RADIO_TextMainTitle: CLAY_RscRadioText
	{
		idc = 610;
		style = ST_LEFT;
		sizeEx = 0.05;
		text = ;
		x = 0.205;
		y = 0.47;
		w = 0.54;
		h = 0.105;
	};
	class CLAY_RADIO_TextMusicSource: CLAY_RscRadioText
	{
		idc = 611;
		sizeEx = 0.02;
		text = "ArmA 3 Music";
		x = 0.205;
		y = 0.575;
		w = 0.125;
		h = 0.025;
	};
	class CLAY_RADIO_TextRepeat: CLAY_RscRadioText
	{
		idc = 612;
		sizeEx = 0.02;
		text = ;
		x = 0.35;
		y = 0.575;
		w = 0.1;
		h = 0.025;
	};
	class CLAY_RADIO_TextRandom: CLAY_RscRadioText
	{
		idc = 613;
		sizeEx = 0.02;
		text = ;
		x = 0.45;
		y = 0.575;
		w = 0.1;
		h = 0.025;
	};
	class CLAY_RADIO_TextDisplayColor: CLAY_RscRadioText
	{
		idc = 614;
		sizeEx = 0.02;
		text = ;
		x = 0.575;
		y = 0.575;
		w = 0.125;
		h = 0.025;
	};
	class CLAY_RADIO_ButtonPre: CLAY_RscRadioButton
	{
		idc = 615;
		text = "<<";
		action = "['pre'] spawn CLAY_fnc_controls";
		x = 0.77;
		y = 0.475;
		w = 0.05;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonNext: CLAY_RscRadioButton
	{
		idc = 616;
		text = ">>";
		action = "['next', 1] spawn CLAY_fnc_controls";
		x = 0.83;
		y = 0.475;
		w = 0.05;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonSourceUp: CLAY_RscRadioButton
	{
		idc = 617;
		text = "/\";
		action = "['sourceUp'] spawn CLAY_fnc_settings";
		x = 0.8;
		y = 0.415;
		w = 0.05;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonSourceDown: CLAY_RscRadioButton
	{
		idc = 618;
		text = "\/";
		action = "['sourceDown'] spawn CLAY_fnc_settings";
		x = 0.8;
		y = 0.535;
		w = 0.05;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonOff: CLAY_RscRadioButton
	{
		idc = 619;
		sizeEx = 0.02;
		text = "OFF";
		action = "closeDialog 0";
		x = 0.125;
		y = 0.625;
		w = 0.05;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonPlayList: CLAY_RscRadioButton
	{
		idc = 620;
		text = "Playlist";
		action = "[] spawn CLAY_fnc_playlist";
		x = 0.21;
		y = 0.625;
		w = 0.08;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonRepeatSelect: CLAY_RscRadioButton
	{
		idc = 621;
		text = "Repeat";
		action = "['playRepeat'] spawn CLAY_fnc_settings";
		x = 0.3;
		y = 0.625;
		w = 0.08;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonRandomSelect: CLAY_RscRadioButton
	{
		idc = 622;
		text = "Random";
		action = "['playRandom'] spawn CLAY_fnc_settings";
		x = 0.39;
		y = 0.625;
		w = 0.08;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonKeyColorSelect: CLAY_RscRadioButton
	{
		idc = 623;
		text = "Key Col";
		action = "['kCol'] spawn CLAY_fnc_settings;";
		x = 0.48;
		y = 0.625;
		w = 0.08;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonDisplayColorSelect: CLAY_RscRadioButton
	{
		idc = 624;
		text = "Dspl Col";
		action = "['dCol'] spawn CLAY_fnc_settings;";
		x = 0.57;
		y = 0.625;
		w = 0.08;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonBackgroundColorSelect: CLAY_RscRadioButton
	{
		idc = 625;
		text = "Design";
		action = "['Color'] spawn CLAY_fnc_settings;";
		x = 0.66;
		y = 0.625;
		w = 0.08;
		h = 0.05;
	};
};

class CLAY_CarRadio_PlaylistDlg
{
	idd = 667;
	movingEnable = true;
	controlsBackground[] = {CLAY_RADIO_PlaylistBgd, CLAY_RADIO_PlaylistTitle};
	class CLAY_RADIO_PlaylistBgd: CLAY_RscRadioText
	{
		idc = 630;
		colorBackground[] = {0,0,0,1};
		text = ;
		x = 0.15;
		y = 0.1;
		w = 0.7;
		h = 0.8;
		moving = 1;
	};
	class CLAY_RADIO_PlaylistTitle: CLAY_RscRadioText
	{
		idc = 631;
		colorText[] = {1,1,1,1};
		text = "P l a y l i s t   E d i t o r";
		x = 0.25;
		y = 0.115;
		w = 0.5;
		h = 0.025;
	};
	controls[] = {CLAY_RADIO_ListPlaylistTracks, CLAY_RADIO_ListAllTracks, CLAY_RADIO_ButtonAddSingle, CLAY_RADIO_ButtonAddAll, CLAY_RADIO_ButtonRemoveSingle, CLAY_RADIO_ButtonRemoveAll, CLAY_RADIO_ButtonOK, CLAY_RADIO_ButtonCancel, CLAY_RADIO_ButtonRestore};
	class CLAY_RADIO_ListPlaylistTracks: CLAY_RscRadioListbox
	{
		idc = 632;
		text = ;
		x = 0.175;
		y = 0.15;
		w = 0.3;
		h = 0.65;
		onLBDrop = "nul = _this spawn CLAY_fnc_lbdrop;";
	};
	class CLAY_RADIO_ListAllTracks: CLAY_RscRadioListbox
	{
		idc = 633;
		text = ;
		x = 0.525;
		y = 0.15;
		w = 0.3;
		h = 0.65;
		canDrag = 1;
	};
	class CLAY_RADIO_ButtonAddSingle: CLAY_RscRadioButton
	{
		idc = 634;
		text = "<";
		action = "['addSingle'] spawn CLAY_fnc_editor;";
		x = 0.48;
		y = 0.4;
		w = 0.04;
		h = 0.04;
	};
	class CLAY_RADIO_ButtonAddAll: CLAY_RscRadioButton
	{
		idc = 635;
		text = "<<";
		action = "['addAll'] spawn CLAY_fnc_editor;";
		x = 0.48;
		y = 0.51;
		w = 0.04;
		h = 0.04;
	};
	class CLAY_RADIO_ButtonRemoveSingle: CLAY_RscRadioButton
	{
		idc = 636;
		text = ">";
		action = "['removeSingle'] spawn CLAY_fnc_editor;";
		x = 0.48;
		y = 0.45;
		w = 0.04;
		h = 0.04;
	};
	class CLAY_RADIO_ButtonRemoveAll: CLAY_RscRadioButton
	{
		idc = 637;
		text = ">>";
		action = "['removeAll'] spawn CLAY_fnc_editor;";
		x = 0.48;
		y = 0.56;
		w = 0.04;
		h = 0.04;
	};
	class CLAY_RADIO_ButtonOK: CLAY_RscRadioButton
	{
		idc = 638;
		text = "OK";
		action = "['create'] spawn CLAY_fnc_editor;";
		x = 0.45;
		y = 0.825;
		w = 0.1;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonCancel: CLAY_RscRadioButton
	{
		idc = 639;
		text = "Cancel";
		action = "[] spawn {closeDialog 0; sleep 0.1; [] call CLAY_fnc_radio;};";
		x = 0.575;
		y = 0.825;
		w = 0.1;
		h = 0.05;
	};
	class CLAY_RADIO_ButtonRestore: CLAY_RscRadioButton
	{
		idc = 640;
		text = "Restore";
		action = "['restore'] spawn CLAY_fnc_editor";
		x = 0.325;
		y = 0.825;
		w = 0.1;
		h = 0.05;
	};
};