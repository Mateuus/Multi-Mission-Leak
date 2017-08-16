
class ADPSpawning
{
	idd = 6003;
	movingEnable = 0;
	onLoad = "";
	controlsBackground[] = 
	{
	ADP_PICTUREBACK1,
	ADP_TEXT5
	};
	
	class ADP_PICTUREBACK1: ADPRscPicture
	{
		idc = 1200;
		text = "ADP\Dialog\ADPImage.paa";
		x = 0.247344 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.505313 * safezoneW;
		h = 0.781 * safezoneH;
	};	
	class ADP_TEXT5: ADPRscText
	{
		idc = 9000;
		text = "Fade"; 
		colorDisabled[] = {1,1,1,1};
		type = 11;
		style = ST_CENTER;
		x = 0.665 * safezoneW + safezoneX;
		y = 0.550 * safezoneH + safezoneY;
		w = 0.0360937 * safezoneW;
		h = 0.022 * safezoneH;
	};
	
	class Controls 
	{
		class ADP_SLIDE1: ADPRscSlider
		{
				idc = 1902;
				x = 0.665 * safezoneW + safezoneX;
				y = 0.545 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.011 * safezoneH;
				onSliderPosChanged = "[6003,(_this) select 1] call ADP_fnc_zmjfgyjvajivrhxolzkwhtecaptiobigwamtpdezsjorwnfyvqfofrv;";
		};
		class IGUIBack_2201: ADP_IGUIBack
		{
			idc = 9001;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.154 * safezoneW;
			h = 0.245 * safezoneH;
			colorbackground[] = {0,0,0,0.3};
		};
		class ADP_BUTTONEXIT: ADPRscButtonMenu
		{
			idc = 2;
			text = "X"; 
			x = 0.6855 * safezoneW + safezoneX;
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0229 * safezoneW;
			h = 0.033 * safezoneH;
			theAction = "closeDialog 0";
			adminlevel = -1;
			};
			
		class ADP_MenuScripts: ADPRscButtonMenu
		{
			idc = 2400;
			text = "Debugging"; 
			x = 0.2916 * safezoneW + safezoneX;
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "To execute and watch all of your Favorite Variables";
			theAction = "[] spawn ADP_fnc_ndsybjptxwqixppdiqgpiumakpibsmjgnlshiudulvnffjfodg;";
			adminlevel = -1;
		};
		class ADP_MenuMain: ADPRscButtonMenu
		{
			idc = 2401;
			text = "Main"; 
			x = 0.3708 * safezoneW + safezoneX; 
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			theAction = "[] spawn ADP_fnc_adpMain;";
			adminlevel = -1;
		};
		class ADP_MenuMain2: ADPRscButtonMenu
		{
			idc = 2409;
			text = "Main 2"; 
			x = 0.45 * safezoneW + safezoneX;
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Main 2";
			theAction = "[] spawn ADP_fnc_iiglvqyubunxskkcuapgnyknpbrbadnpdqhfegozvfkwquvswtv;";
			adminlevel = -1;
		};
		class ADP_MenuSpawning: ADPRscButtonMenu
		{
			idc = 2403;
			text = "Spawning"; 
			x = 0.5292 * safezoneW + safezoneX;
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "To spawn anything your heart desires";
			theAction = "[] spawn ADP_fnc_havzyadaqqqecudzryocdruhpzmvesqrxfketorpetwwjgrvdwrhrgxvkbx;";
			adminlevel = -2;
		};
		class ADP_MenuRanks: ADPRscButtonMenu
		{
			idc = 2405;
			text = "Ranks"; 
			x = 0.6084 * safezoneW + safezoneX;
			y = 0.499889 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Set various player ranks";
			theAction = "[] spawn ADP_fnc_ssqixfzneimkhownrodvsniaaedmglqlymuutbysnfypippzqn;";
			adminlevel = -1;
		};
		class ADP_MenuEvents: ADPRscButtonMenu
		{
			idc = 25000;
			text = "Events"; 
			x = 0.2916 * safezoneW + safezoneX;
			y = 0.928 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Events";
			theAction = "[] spawn ADP_fnc_adpEvents;";
			adminlevel = -1;
		};
		class ADP_MenuEvents2: ADPRscButtonMenu
		{
			idc = 25001;
			text = "Events 2"; 
			x = 0.3708 * safezoneW + safezoneX;
			y = 0.928 * safezoneH + safezoneY;
			w = 0.0792 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Events 2";
			theAction = "[] spawn ADP_fnc_bwjgbwwqcnxmhsnptfpkrfnopvqpsdxwqpjwfyzjbctyjhijquqmuxj;";
			adminlevel = -1;
		};
		
		class ADP_SpawnListBox: ADPRscListbox 
		{
			idc = 1500;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.363 * safezoneH;
			onLBSelChanged = "[1500,(_this) select 1, 1400,1201,1401] call ADP_fnc_onmvorunnhexlabtpihsjgczaywayuhfpbwbqbnkwljotqgmcxisavdqhdlv";
			arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
			arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
			sizeEx = 0.025;
			class ScrollBar
			{
				type = CT_XSLIDER;
				color[] = {1,1,1,1};
				colorActive[] = {1,1,1,1};
				thumb = "#(argb,8,8,3)color(0,0,0,9)";
				arrowEmpty = "#(argb,8,8,3)color(0,0,0,9)";
				arrowFull = "#(argb,8,8,3)color(0.631,0.153,0.153,1)";
				border = "#(argb,8,8,3)color(0.361,0.349,0.353,1)";
			};
			class ListScrollBar: ScrollBar
			{
				height = 0.021;
				width = 0.021;
				autoScrollEnabled = 0;
				color[] = {1,1,1,1};
			};
		}; 
		class ADP_SpawnButtonMisc: ADPRscButtonMenu
		{
			idc = 2402;
			text = "Misc"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.028 * safezoneH;
			action = "[6003,1500,9] spawn ADP_fnc_mvvtfbegjgvdakqnpbrtzgqygzokdenfjjsfusfmpjfgplnsswexxdywnrd";
		};
		class ADP_SpawnButtonItems: ADPRscButtonMenu
		{
			idc = 2403;
			text = "Items"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.028 * safezoneH;
			action = "[6003,1500,5] spawn ADP_fnc_vzcpdfofkdsekgtaxsafynernmfgzqjobpzrkdgqbwzeveofjjnigr";
		};
		class ADP_SpawnButtonGrenades: ADPRscButtonMenu
		{
			idc = 2404;
			text = "Grenades"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.028 * safezoneH;
			action = "[6003,1500,3] spawn ADP_fnc_npnkhbvimwpcmghtquedqirakpdxdwwjedkzmnnxvibyfrjvpkgewkwl";
		};
		class ADP_SpawnButtonLaunch: ADPRscButtonMenu
		{
			idc = 2405;
			text = "Launchers"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.028 * safezoneH;
			action = "[6003,1500,2] spawn ADP_fnc_npnkhbvimwpcmghtquedqirakpdxdwwjedkzmnnxvibyfrjvpkgewkwl";
		};
		class ADP_SpawnButtonSec: ADPRscButtonMenu
		{
			idc = 2406;
			text = "Sec Weapons"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.028 * safezoneH;
			action = "[6003,1500,1] spawn ADP_fnc_npnkhbvimwpcmghtquedqirakpdxdwwjedkzmnnxvibyfrjvpkgewkwl";
		};
		class ADP_SpawnButtonPri: ADPRscButtonMenu
		{
			idc = 2417;
			text = "Pri Weapons"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.028 * safezoneH;
			action = "[6003,1500,0] spawn ADP_fnc_npnkhbvimwpcmghtquedqirakpdxdwwjedkzmnnxvibyfrjvpkgewkwl";
		};
		class ADP_SpawnButtonCars: ADPRscButtonMenu
		{
			idc = 2418;
			text = "Cars"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.028 * safezoneH;
			action = "[6003,1500,0] spawn ADP_fnc_jewvfyizqfptgljmbyyvooxpueiubmhhgynqxdvyznwtdarhepwssuqphv";
		};
		class ADP_SpawnButtonArmored: ADPRscButtonMenu
		{
			idc = 2419;
			text = "Armored"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.028 * safezoneH;
			action = "[6003,1500,1] spawn ADP_fnc_jewvfyizqfptgljmbyyvooxpueiubmhhgynqxdvyznwtdarhepwssuqphv";
		};
		class ADP_SpawnButtonAir: ADPRscButtonMenu
		{
			idc = 2420;
			text = "Air"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.028 * safezoneH;
			action = "[6003,1500] spawn ADP_fnc_avojabkmwwnradikjtsvvxcyeupfkhlqcdywfopkcdvlqtvjsybssxxsgnd";
		};
		class ADP_SpawnButtonShip: ADPRscButtonMenu
		{
			idc = 2421;
			text = "Ship"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.028 * safezoneH;
			action = "[6003,1500,2] spawn ADP_fnc_jewvfyizqfptgljmbyyvooxpueiubmhhgynqxdvyznwtdarhepwssuqphv";
		};
		class ADP_SpawnEdit0: RscEditr
		{
			idc = 1400;
			text = "Class"; 
			htmlControl = true;
			style = ST_LEFT+ST_FRAME+ST_MULTI;
			colorText[] = {1,1,1,9};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.9) / 25) * 1)";
			lineSpacing = 0.01;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_SpawnEdit1: RscEditR
		{
			idc = 1401;
			text = "Magazine Class"; 
			htmlControl = true;
			style = ST_LEFT+ST_FRAME+ST_MULTI;
			colorText[] = {1,1,1,9};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.9) / 25) * 1)";
			lineSpacing = 0.01;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_SpawnButtonSpawn: ADPRscButtonMenu
		{
			idc = 2424;
			text = "Spawn"; 
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Spawns selected items on list";
			theAction = "[1500] call ADP_fnc_Spawn";
			adminlevel = 3;
			eventlevel = 1;
		};
		
		class ADP_SpawnButtonDelete: ADPRscButtonMenu
		{
			idc = 2425;
			text = "Delete"; 
			x = 0.610937 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Used to delete vehicles that are within 50 meters";
			theAction = "[1500] call ADP_fnc_Delete";
			adminlevel = 3;
			eventlevel = 1;
		};
		
		class ADP_SpawnClassPic: ADPRscPicture
		{
			idc = 1201;
			text = "a3\ui_f\data\Logos\arma3_splash_ca.paa";
			style = ST_KEEP_ASPECT_RATIO + 48;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.154 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class ADP_SpawnInfoText: ADPRscText
		{
			idc = 1000;
			text = ""; 
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.154 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 2) / 25) * 1)";
			class ScrollBar
			{
				type = CT_XSLIDER; 
				color[] = {1,1,1,1};
				colorActive[] = {1,1,1,1};
				thumb = "#(argb,8,8,3)color(0,0,0,9)";
				arrowEmpty = "#(argb,8,8,3)color(0,0,0,9)";
				arrowFull = "#(argb,8,8,3)color(0.631,0.153,0.153,1)";
				border = "#(argb,8,8,3)color(0.361,0.349,0.353,1)";
			};
		};
	};
};