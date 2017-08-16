class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnable = 1;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class RscTitleBackground: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\settings_menu.jpg";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class MainBackground: ES_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.229519 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.539 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class PlayerTagsHeader: ES_RscText
		{
			idc = -1;
			text = "$STR_SM_PlayerTags";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class SideChatHeader: PlayerTagsHeader
		{
			idc = -1;
			text = "$STR_SM_SC";

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class RevealNearestHeader: PlayerTagsHeader
		{
			idc = -1;
			text = "Reveal Nearest Objects";

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};

	class controls
	{
		class VDonFoot: ES_RscText
		{
			idc = -1;
			text = "$STR_SM_onFoot";

			x = 0.309219 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class VDinCar: ES_RscText
		{
			idc = -1;
			text = "$STR_SM_inCar";

			x = 0.309219 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class VDinAir: ES_RscText
		{
			idc = -1;
			text = "$STR_SM_inAir";

			x = 0.309219 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class VD_onfoot_slider: ES_RscXSliderH
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call ES_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";

			x = 0.422656 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			//w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			//h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = 0.195937 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class VD_onfoot_value: ES_RscEdit
		{
			idc = 2902;
			text = "";
			onChar = "[_this select 0, _this select 1,'ground',false] call ES_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'ground',true] call ES_fnc_s_onChar;";

			x = 0.628906 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class VD_car_slider: ES_RscXSliderH
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call ES_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";

			x = 0.422656 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			//w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			//h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = 0.195937 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class VD_car_value: ES_RscEdit
		{
			idc = 2912;
			text = "";
			onChar = "[_this select 0, _this select 1,'vehicle',false] call ES_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call ES_fnc_s_onChar;";

			x = 0.628906 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class VD_air_slider: ES_RscXSliderH
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call ES_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";

			x = 0.422656 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			//w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			//h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = 0.195937 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class VD_air_value: ES_RscEdit
		{
			idc = 2922;
			text = "";
			onChar = "[_this select 0, _this select 1,'air',false] call ES_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'air',true] call ES_fnc_s_onChar;";

			x = 0.628906 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class PlayerTagsONOFF: ES_Checkbox
		{
			tooltip = "$STR_GUI_PlayTags";
			idc = 2970;
			sizeEx = 0.04;
			onCheckedChanged = "['tags',_this select 1] call ES_fnc_s_onCheckedChange;";

			x = 0.510312 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
		};

		class SideChatONOFF: PlayerTagsONOFF
		{
			idc = 2971;
			tooltip = "";
			onCheckedChanged = "['sidechat',_this select 1] call ES_fnc_s_onCheckedChange;";

			y = 0.302 * safezoneH + safezoneY;
		};

		class RevealONOFF: PlayerTagsONOFF
		{
			tooltip = "$STR_GUI_PlayerReveal";
			onCheckedChanged = "['objects',_this select 1] call ES_fnc_s_onCheckedChange;";
			idc = 2972;

			y = 0.346 * safezoneH + safezoneY;
		};

		class ButtonClose: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";

			x = 0.293229 * safezoneW + safezoneX;
			y = 0.774944 * safezoneH + safezoneY;
			w = 0.111927 * safezoneW;
			h = 0.032074 * safezoneH;
			tooltip = "Schließen"; //--- ToDo: Localize;
		};
	};
};