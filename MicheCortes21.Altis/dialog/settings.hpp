//Keine Verwendung ohne Erlaubnis by Darkwin Duck & Shriver Basdekis
class SettingsMenu {
	idd = 2900;
	name = "SettingsMenu";
	movingEnable = 1;
	enableSimulation = 1;

	class controlsBackground {
		class tabletv3: Life_RscPicture {
			text = "textures\tablet\tabletv3.paa";
			idc = -1;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.515625 * safezoneW;
			h = 0.847 * safezoneH;
		};

		class PlayerTagsHeader: Life_RscText {
			idc = -1;
			text = "$STR_SM_PlayerTags";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class SideChatHeader : PlayerTagsHeader {
			idc = -1;
			text = "$STR_SM_SC";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RevealNearestHeader : PlayerTagsHeader {
			idc = -1;
			text = "$STR_SM_RNObj";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Title: Life_RscTitle {
			idc = -1;
			colorBackground[] = {0,0,0,0};
			text = "$STR_SM_Title";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls {
		class VDonFoot: Life_RscText {
			idc = -1;
			text = "$STR_SM_onFoot";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VDinCar: Life_RscText {
			idc = -1;
			text = "$STR_SM_inCar";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VDinAir: Life_RscText {
			idc = -1;
			text = "$STR_SM_inAir";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_onfoot_slider: life_RscXSliderH {
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.111375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_onfoot_value: Life_RscEdit {
			idc = 2902;
			text = "";
			onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_s_onChar;";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.033 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_car_slider: life_RscXSliderH {
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.111375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_car_value: Life_RscEdit {
			idc = 2912;
			text = "";
			onChar = "[_this select 0, _this select 1,'vehicle',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call life_fnc_s_onChar;";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.033 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_air_slider: life_RscXSliderH {
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.111375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_air_value: Life_RscEdit {
			idc = 2922;
			text = "";
			onChar = "[_this select 0, _this select 1,'air',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'air',true] call life_fnc_s_onChar;";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.033 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ButtonClose: Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscFrame_1800: Life_RscFrame
		{
			idc = 1800;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.308 * safezoneH;
		};
	};
};