class cris_license {
	idd = 11000;
	name= "cris_license";
	onLoad = "uiNamespace setVariable ['cris_license', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['cris_license', nil]";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = 0.672 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			colorActive[] = {-1,-1,-1,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "Lizenzen Island of Liberty"; //--- ToDo: Localize;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			colorText[] = {1,1,1,1};
		};
	};
	class controls {
		class RscButtonMenu_2400: Life_RscButtonMenu 
		{
			idc = 2400;
			text = "$STR_License_Driver"; //--- ToDo: Localize;
			onMouseMoving = "['car'] spawn life_fnc_hoverLicense";
			action = "['car'] spawn life_fnc_licenserSwitch";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "$STR_License_Truck"; //--- ToDo: Localize;
			onMouseMoving = "['truck'] spawn life_fnc_hoverLicense";
			action = "['truck'] spawn life_fnc_licenserSwitch";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2402;
			text = "$STR_License_Boat"; //--- ToDo: Localize;
			onMouseMoving = "['boat'] spawn life_fnc_hoverLicense";
			action = "['boat'] spawn life_fnc_licenserSwitch";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscButtonMenu_2403: Life_RscButtonMenu
		{
			idc = 2403;
			text = "$STR_License_Pilot"; //--- ToDo: Localize;
			onMouseMoving = "['air'] spawn life_fnc_hoverLicense";
			action = "['air'] spawn life_fnc_licenserSwitch";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscButtonMenu_2404: Life_RscButtonMenu
		{
			idc = 2404;
			text = "$STR_License_Firearm"; //--- ToDo: Localize;
			onMouseMoving = "['gun'] spawn life_fnc_hoverLicense";
			action = "['gun'] spawn life_fnc_licenserSwitch";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.444 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.042 * safezoneH;
		};
		
		class RscButtonMenu_2405: Life_RscButtonMenu
		{
			idc = 2405;
			text = "$STR_License_Home"; //--- ToDo: Localize;
			onMouseMoving = "['home'] spawn life_fnc_hoverLicense";
			action = "['home'] spawn life_fnc_licenserSwitch";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.042 * safezoneH;
		};
		
		class RscButtonMenu_2406: Life_RscButtonMenu
		{
			idc = 2406;
			text = "$STR_License_CargoL"; //--- ToDo: Localize;
			onMouseMoving = "['cargo'] spawn life_fnc_hoverLicense";
			action = "['cargo'] spawn life_fnc_licenserSwitch";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscButtonMenu_2407: Life_RscButtonMenu
		{
			idc = 2407;
			text = "$STR_License_Jagde"; //--- ToDo: Localize;
			onMouseMoving = "['jagd'] spawn life_fnc_hoverLicense";
			action = "['jagd'] spawn life_fnc_licenserSwitch";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscButtonMenu_2408: Life_RscButtonMenu
		{
			idc = 2408;
			text = "placeholder"; //--- ToDo: Localize;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscButtonMenu_2409: Life_RscButtonMenu
		{
			idc = 2409;
			text = "placeholder"; //--- ToDo: Localize;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscButtonMenu_2410: Life_RscButtonMenu
		{
			idc = 2410;
			text = "placeholder"; //--- ToDo: Localize;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = "blablabla"; //--- ToDo: Localize;
			x = 0.526249 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.602 * safezoneH;
		};
		class RscStructuredText_1101: Life_RscStructuredText
		{
			idc = 1101;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscStructuredText_1102: Life_RscStructuredText
		{
			idc = 1102;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscStructuredText_1103: Life_RscStructuredText
		{
			idc = 1103;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscStructuredText_1104: Life_RscStructuredText
		{
			idc = 1104;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscStructuredText_1105: Life_RscStructuredText
		{
			idc = 1105;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.444 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscStructuredText_1106: Life_RscStructuredText
		{
			idc = 1106;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscStructuredText_1107: Life_RscStructuredText
		{
			idc = 1107;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscStructuredText_1108: Life_RscStructuredText
		{
			idc = 1108;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscStructuredText_1109: Life_RscStructuredText
		{
			idc = 1109;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscStructuredText_1110: Life_RscStructuredText
		{
			idc = 1110;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscStructuredText_1111: Life_RscStructuredText
		{
			idc = 1111;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
		};
	};
};
