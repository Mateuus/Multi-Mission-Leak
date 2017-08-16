class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnabled = 0;
	enableSimulation = 1;

	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Settings"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Player Name:"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Server Name:"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscText_1004: Life_RscText
		{
			idc = 1004;
			text = "View Distance Settings"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1005: Life_RscText
		{
			idc = 1005;
			text = "On Foot"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.3955 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1006: Life_RscText
		{
			idc = 1006;
			text = "Land/Water"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.4395 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class footslider: life_RscXSliderH
		{
			idc = 2901;
      text = "";
      onSliderPosChanged = "[0,_this select 1] call life_fnc_swegequtre;";
			x = 0.391718 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class waterslider: life_RscXSliderH
		{
			idc = 2911;
      text = "";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_swegequtre;";
			x = 0.391718 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class airslider: life_RscXSliderH
		{
			idc = 2921;
      text = "";
      onSliderPosChanged = "[2,_this select 1] call life_fnc_swegequtre;";
			x = 0.391718 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1007: Life_RscText
		{
			idc = 1007;
			text = "Air"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.4835 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1008: Life_RscText
		{
			idc = 1008;
			text = "Additional/Misc Settings"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Close"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class showchatbox: Life_Checkbox
		{
			idc = 2800;
			text = "";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			onCheckedChanged = "['chat',_this select 1] call life_fnc_hestakusad;";
		};
		class streamfriendlybox: Life_Checkbox
		{
			idc = 2801;
			text = "";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			onCheckedChanged = "['silent',_this select 1] call life_fnc_hestakusad;";
		};
		class RscText_1009: Life_RscText
		{
			idc = 1009;
			text = "Hide Chat"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscText_1010: Life_RscText
		{
			idc = 1010;
			text = "Stream Friendly"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class onfootedit: Life_RscEdit
		{
			idc = 2902;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
      text = "";
			onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_muxuthupaq;";
			onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_muxuthupaq;";
		};
		class waterlandedit: Life_RscEdit
		{
			idc = 2912;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
      text = "";
      onChar = "[_this select 0, _this select 1,'vehicle',false] call life_fnc_muxuthupaq;";
      onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call life_fnc_muxuthupaq;";
			colorBackground[] = {0,0,0,0.6};
		};
		class airedit: Life_RscEdit
		{
			idc = 2922;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
      text = "";
      onChar = "[_this select 0, _this select 1,'air',false] call life_fnc_muxuthupaq;";
      onKeyUp = "[_this select 0, _this select 1,'air',true] call life_fnc_muxuthupaq;";
			colorBackground[] = {0,0,0,0.6};
		};
	};
};
