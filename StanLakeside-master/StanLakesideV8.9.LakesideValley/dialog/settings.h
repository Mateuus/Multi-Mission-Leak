class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnabled = 1;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable [""tabletmenu"", _this select 0]; [] spawn life_fnc_cellphone; smsmenuisopen = 1; [] call fnc_fadephone; ";

	class controlsBackground
	{
		class background: life_RscPicture
		{
			idc = -1;
			text = "\CG_Client\textures\gamesettings.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.561 * safezoneH;
		};

		class CTRL_PHONE_BG: RscStructuredText
		{    
			idc = 7017;
			text = "";
			x = 0.320594 * safezoneW + safezoneX;
			y = 0.305 * safezoneH + safezoneY;
			w = 0.35585 * safezoneW;
			h = 0.3512 * safezoneH;
			ColorBackground[] = {1, 1, 1, 1};
		}; 

		class VD_onfoot_slider : life_RscXSliderH 
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";
			x = 0.489166 * safezoneW + safezoneX;
			y = 0.411074 * safezoneH + safezoneY;
			w = 0.174844 * safezoneW;
			h = 0.0247778 * safezoneH;
		};
		
		class VD_onfoot_value : life_RscText
		{
			idc = 2902;
			text = "";
		x = 1 * safezoneW + safezoneX;
		y = 1 * safezoneH + safezoneY;
		w = 0 * safezoneW;
		h = 0 * safezoneH;
		};
		
		class VD_car_slider : life_RscXSliderH 
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";
			x = 0.489063 * safezoneW + safezoneX;
			y = 0.464814 * safezoneH + safezoneY;
			w = 0.174844 * safezoneW;
			h = 0.0247778 * safezoneH;
		};
		
		class VD_car_value : life_RscText
		{
			idc = 2912;
			text = "";
			x = 1 * safezoneW + safezoneX;
			y = 1 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class VD_air_slider : life_RscXSliderH 
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";
			x = 0.488542 * safezoneW + safezoneX;
			y = 0.516667 * safezoneH + safezoneY;
			w = 0.174844 * safezoneW;
			h = 0.0247778 * safezoneH;
		};
		
		class VD_air_value : life_RscText
		{
			idc = 2922;
			text = "";
			x = 1 * safezoneW + safezoneX;
			y = 1 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class PlayerTagsONOFF : Life_RscActiveText
		{
			text = "ON";
			tooltip = "$STR_GUI_PlayTags";
			action = "[""tags"",false] call fnc_phone_settings;";
			idc = 2970;
			sizeEx = 0.04;
			x = 0.383437 * safezoneW + safezoneX;
			y = 0.370778 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
		};
		
		class SideChatONOFF : PlayerTagsONOFF
		{
			idc = 2971;
			tooltip = "Disable or Enable HUD!";
			action = "[""hud"",false] call fnc_phone_settings;";
			y = 0.405556 * safezoneH + safezoneY;
		};
		
		class RevealONOFF : PlayerTagsONOFF
		{
			tooltip = "House Display (Disabled WIP)";
			idc = 2972;
			y = 0.439815 * safezoneH + safezoneY;
		};
		
		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 1 * safezoneW + safezoneX;
			y = 1 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
	};
};