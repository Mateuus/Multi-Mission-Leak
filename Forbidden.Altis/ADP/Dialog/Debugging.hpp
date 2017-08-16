class ADPDebugging
{
	idd = 6002;
	movingEnable = 0;
	onLoad = "";
	onUnload = "DebugOpen = false;";  
	controlsBackground[] = 
	{
	ADP_PICTUREBACK1,
	ADP_TEXTWATCH,
	ADP_TEXTEXECUTE,
	ADP_TEXT5
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
	class ADP_PICTUREBACK1: ADPRscPicture
	{
		idc = 1200;
		text = "ADP\Dialog\ADPImage.paa";	
		colorDisabled[] = {1,1,1,1};
		x = 0.247344 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.505313 * safezoneW;
		h = 0.781 * safezoneH;
	};
	class ADP_TEXTWATCH: ADPRscText
	{
		idc = 9001;
		text = "Watch:"; 
		colorDisabled[] = {1,1,1,1};
		type = 11;
		x = 0.296506 * safezoneW + safezoneX;
		y = 0.58 * safezoneH + safezoneY;
		w = 0.04125 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class ADP_TEXTEXECUTE: ADPRscText
	{
		idc = 9002;
		text = "Execute:"; 
		colorDisabled[] = {1,1,1,1};
		type = 11;		
		SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.6) / 25) * 1)";
		x = 0.533694 * safezoneW + safezoneX;
		y = 0.58 * safezoneH + safezoneY;
		w = 0.04125 * safezoneW;
		h = 0.022 * safezoneH;
	};

	class Controls {
		class ADP_SLIDE1: ADPRscSlider
		{
				idc = 1903;
				x = 0.665 * safezoneW + safezoneX;
				y = 0.545 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.011 * safezoneH;
				onSliderPosChanged = "[6002,(_this) select 1] call ADP_fnc_zmjfgyjvajivrhxolzkwhtecaptiobigwamtpdezsjorwnfyvqfofrv;";
		};
	
		class IGUIBack_2201: ADP_IGUIBack
		{
			idc = 9003;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IGUIBack_2202: ADP_IGUIBack
		{
			idc = 9004;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IGUIBack_2203: ADP_IGUIBack
		{
			idc = 9005;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class IGUIBack_2204: ADP_IGUIBack
		{
			idc = 9006;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IGUIBack_2205: ADP_IGUIBack
		{
			idc = 9007;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
		};		
		class IGUIBack_2206: ADP_IGUIBack
		{
			idc = 9008;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class IGUIBack_2207: ADP_IGUIBack
		{
			idc = 9009;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IGUIBack_2200: ADP_IGUIBack
		{
			idc = 9010;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
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
			adminlevel = -2;
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
			adminlevel = -1;
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

		class ADP_DebugWatch0: ADPRscEdit
		{
			text = "1"; 
			idc = 1402;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ADP_DebugWatch1: ADPRscEdit
		{
			text = "2"; 
			idc = 1408;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugWatch2: ADPRscEdit
		{
			text = "3"; 
			idc = 1407;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugWatch3: ADPRscEdit
		{
			text = "4"; 
			idc = 1406;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
		};	
		class ADP_DebugWatch4: ADPRscEdit
		{
			text = "5"; 
			idc = 1405;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugWatch5: ADPRscEdit
		{
			text = "6"; 
			idc = 1415;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugWatch6: ADPRscEdit
		{
			text = "7"; 
			idc = 1416;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugWatch7: ADPRscEdit
		{
			text = "8"; 
			idc = 1417;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugRes0: RscEditR
		{
			idc = 1403;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ADP_DebugRes1: RscEditR
		{
			idc = 1409;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugRes2: RscEditR
		{
			idc = 1410;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugRes3: RscEditR
		{
			idc = 1411;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugRes4: RscEditR
		{
			idc = 1404;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugRes5: RscEditR
		{
			idc = 1413;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugRes6: RscEditR
		{
			idc = 1401;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugRes7: RscEditR
		{
			idc = 1414;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugExec0: ADPRscEdit
		{
			idc = 1400;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugExec1: ADPRscEdit
		{
			idc = 1412;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugExec2: ADPRscEdit
		{
			idc = 1418;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ADP_DebugS0: ADPRscButtonMenu
		{
			idc = 2460;
			text = "Server"; 
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.052 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[1400] call ADP_fnc_xhiszzgtywcxuljysauqfagfzamgtezxgtljniopyleuvuihavcvgkqcoh";
			adminlevel = 5;
		};
		class ADP_DebugG0: ADPRscButtonMenu
		{
			idc = 2461;
			text = "Global"; 
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.052 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[1400] call ADP_fnc_ztlevewksagesgzdjzenlypkhwdalbzbhlxglgrvoodfytfjwfddiumjtbye";
			adminlevel = 5;
		};
		class ADP_DebugL0: ADPRscButtonMenu
		{
			idc = 2462;
			text = "Local"; 
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[1400] call ADP_fnc_dexyumerwyyaenvxtftgxzdtokpjewsvpblwopaqlkwtvnojhgnvmd";
			adminlevel = 5;
		};
		class ADP_DebugS1: ADPRscButtonMenu
		{
			idc = 2463;
			text = "Server"; 
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.052 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[1412] call ADP_fnc_xhiszzgtywcxuljysauqfagfzamgtezxgtljniopyleuvuihavcvgkqcoh";
			adminlevel = 5;
		};
		class ADP_DebugG1: ADPRscButtonMenu
		{
			idc = 2464;
			text = "Global"; 
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.052 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[1412] call ADP_fnc_ztlevewksagesgzdjzenlypkhwdalbzbhlxglgrvoodfytfjwfddiumjtbye";
			adminlevel = 5;
		};
		class ADP_DebugL1: ADPRscButtonMenu
		{
			idc = 2465;
			text = "Local"; 
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[1412] call ADP_fnc_dexyumerwyyaenvxtftgxzdtokpjewsvpblwopaqlkwtvnojhgnvmd";
			adminlevel = 5;
		};
		class ADP_DebugS2: ADPRscButtonMenu
		{
			idc = 2466;
			text = "Server"; 
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.052 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[1418] call ADP_fnc_xhiszzgtywcxuljysauqfagfzamgtezxgtljniopyleuvuihavcvgkqcoh";
			adminlevel = 5;
		};
		class ADP_DebugG2: ADPRscButtonMenu
		{
			idc = 2467;
			text = "Global"; 
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.052 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[1418] call ADP_fnc_ztlevewksagesgzdjzenlypkhwdalbzbhlxglgrvoodfytfjwfddiumjtbye";
			adminlevel = 5;
		};
		class ADP_DebugL2: ADPRscButtonMenu
		{
			idc = 2468;
			text = "Local"; 
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			theAction = "[1418] call ADP_fnc_dexyumerwyyaenvxtftgxzdtokpjewsvpblwopaqlkwtvnojhgnvmd";
			adminlevel = 5;
		};
		
		class ADP_BUTTONCUSTOM95: ADPRscButtonMenu
		{
			idc = 1676;
			text = "Config"; 
			x = 298906 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Opens Config Viewer (DISABLED)";
			
			adminlevel = 5;
		};
		
		class ADP_BUTTONCUSTOM96: ADPRscButtonMenu
		{
			idc = 1676;
			text = "Function"; 
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Opens Function Viewer (DISABLED)";
			
			adminlevel = 5;
		};
		
	};
};