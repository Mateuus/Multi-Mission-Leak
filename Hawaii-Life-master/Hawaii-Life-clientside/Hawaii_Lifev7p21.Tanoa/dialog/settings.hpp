class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnable = 1;
	enableSimulation = 1;

	class controlsBackground
	{
		class InventoryBack:Life_RscPicture {
			text = "textures\handy\handy_view.paa";
			idc = -1;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};

	class controls
	{

		class VD_onfoot_slider : Life_RscXSliderH 
		{
			idc = 2901;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_onfoot_value : Life_RscEdit
		{
			idc = 2902;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_s_onChar;";

			x = 0.881562 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_car_slider : Life_RscXSliderH 
		{
			idc = 2911;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_car_value : Life_RscEdit
		{
			idc = 2912;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			onChar = "[_this select 0, _this select 1,'vehicle',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call life_fnc_s_onChar;";

			x = 0.881562 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_air_slider : Life_RscXSliderH 
		{
			idc = 2921;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_air_value : Life_RscEdit
		{
			idc = 2922;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			onChar = "[_this select 0, _this select 1,'air',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'air',true] call life_fnc_s_onChar;";

			x = 0.881562 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class HUDONOFF : Life_Checkbox
		{
			idc = 2970;
			tooltip = "Stellt dein HUD an und aus";
			onCheckedChanged = "['hud',_this select 1] call life_fnc_s_onCheckedChange;";
			x = 0.85475 * safezoneW + safezoneX;
			y = 0.517875 * safezoneH + safezoneY;
			w = 0.0231 * safezoneW;
			h = 0.03575 * safezoneH;
		};
		
		class ChatONOFF : Life_Checkbox
		{
			idc = 2973;
			tooltip = "Stellt deinen Chat an und aus";
			onCheckedChanged = "['chat',_this select 1] call life_fnc_s_onCheckedChange;";
			x = 0.85475 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0231 * safezoneW;
			h = 0.03575 * safezoneH;
		};

		class SideChatONOFF : Life_Checkbox
		{
			idc = 2971;
			tooltip = "$STR_GUI_SideSwitch";
			onCheckedChanged = "['sidechat',_this select 1] call life_fnc_s_onCheckedChange;";
			x = 0.85475 * safezoneW + safezoneX;
			y = 0.59185 * safezoneH + safezoneY;
			w = 0.0231 * safezoneW;
			h = 0.03575 * safezoneH;
		};

		class RevealONOFF : Life_Checkbox
		{
			idc = 2972;
			tooltip = "$STR_GUI_PlayerReveal";
			onCheckedChanged = "['objects',_this select 1] call life_fnc_s_onCheckedChange;";
			x = 0.85475 * safezoneW + safezoneX;
			y = 0.6287 * safezoneH + safezoneY;
			w = 0.0231 * safezoneW;
			h = 0.03575 * safezoneH;
		};
		
		class ButtonSyncData : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call SOCK_fnc_syncData;";
			size = "0.022 * safeZoneH";
			x = 0.907344 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "$STR_PM_SyncData";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;closeDialog 0;";
			x = 0.783594 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonHome : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.845468 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "HOME";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
	};
};
