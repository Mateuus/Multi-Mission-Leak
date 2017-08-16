class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnable = 1;
	enableSimulation = 1;

	class controlsBackground
	{
		class EXphone: life_RscPicture
		{
			idc = 3001;

			text = "textures\phone.paa"; //--- ToDo: Localize;
			x = 0.439625 * safezoneW + safezoneX;
			y = 0.14692 * safezoneH + safezoneY;
			w = 0.426562 * safezoneW;
			h = 0.725732 * safezoneH;
		};
		class PlayerTagsHeader: Life_RscText
		{
			idc = -1;

			text = "$STR_SM_PlayerTags";
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class SideChatHeader: PlayerTagsHeader
		{
			idc = -1;

			text = "$STR_SM_SC";
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.636 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RevealNearestHeader: PlayerTagsHeader
		{
			idc = -1;

			text = "$STR_SM_RNObj";
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.674 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};		
		class PhoneSoundHeader: PlayerTagsHeader
		{
			idc = -1;

			text = "Phone Startup Sound";
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.712 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Title: Life_RscTitle
		{
			idc = -1;

			text = "$STR_SM_Title";
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.2625 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
	};

	class controls
	{
		class VDonFoot: Life_RscText
		{
			idc = -1;

			text = "$STR_SM_onFoot";
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class VDinCar: Life_RscText
		{
			idc = -1;

			text = "$STR_SM_inCar";
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class VDinAir: Life_RscText
		{
			idc = -1;

			text = "";
			tooltip = "$STR_SM_ToolTip1";			
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.472 * safezoneH + safezoneY;
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class VD_onfoot_slider: life_RscXSliderH
		{
			idc = 2901;
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";

			x = 0.545937 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			text = "";
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			tooltip = "$STR_SM_ToolTip1";
		};
		class VD_onfoot_value: Life_RscEdit
		{
			idc = 2902;
			text = "";
			onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_s_onChar;";

			x = 0.690312 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.042 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class VD_car_slider: life_RscXSliderH
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";

			x = 0.545937 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			tooltip = "$STR_SM_ToolTip2";
		};
		class VD_car_value: Life_RscEdit
		{
			idc = 2912;
			text = "";
			onChar = "[_this select 0, _this select 1,'vehicle',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call life_fnc_s_onChar;";

			x = 0.690312 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.042 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class VD_air_slider: life_RscXSliderH
		{
			idc = 2921;
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";

			x = 0.545937 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			text = "";

			tooltip = "$STR_SM_ToolTip3";

			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class VD_air_value: Life_RscEdit
		{
			idc = 2922;
			text = "";

			onChar = "[_this select 0, _this select 1,'air',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'air',true] call life_fnc_s_onChar;";

			x = 0.690312 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.042 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class PlayerTagsONOFF: Life_Checkbox
		{
			tooltip = "$STR_GUI_PlayTags";
			idc = 2970;
			sizeEx = 0.04;	
			onCheckedChanged = "['tags',_this select 1] call life_fnc_s_onCheckedChange;";

			x = 0.71 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.01575 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class SideChatONOFF: PlayerTagsONOFF
		{
			idc = 2971;
			onCheckedChanged = "['sidechat',_this select 1] call life_fnc_s_onCheckedChange;";

			x = 0.71 * safezoneW + safezoneX;
			y = 0.636 * safezoneH + safezoneY;
			w = 0.01575 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "$STR_GUI_SideSwitch";
		};
		class RevealONOFF: PlayerTagsONOFF
		{
			idc = 2972;
			onCheckedChanged = "['objects',_this select 1] call life_fnc_s_onCheckedChange;";

			x = 0.71 * safezoneW + safezoneX;
			y = 0.674 * safezoneH + safezoneY;
			w = 0.01575 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "$STR_GUI_PlayerReveal";
		};
		class PhoneSoundONOFF: PlayerTagsONOFF
		{
			idc = 2969;
			onCheckedChanged = "['sound',_this select 1] call life_fnc_s_onCheckedChange;";

			x = 0.71 * safezoneW + safezoneX;
			y = 0.712 * safezoneH + safezoneY;
			w = 0.01575 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "Turn phone startup sound on/off";
		};
		class ButtonClose: Life_RscButtonInvisible
		{
			onButtonClick = "closeDialog 0;";

			idc = 1012;
			x = 0.601719 * safezoneW + safezoneX;
			y = 0.801 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0875 * safezoneH;
			colorText[] = {1,1,1,0};
			colorBackground[] = {0,0,0,0};
			tooltip = "Go back"; //--- ToDo: Localize;
		};
	};
};