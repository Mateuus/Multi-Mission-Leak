class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnable = 1;
	enableSimulation = 1;

	class controlsBackground
	{
		class InventoryBack:Life_RscPicture {
			text = "textures\inventory\back2.paa";
			idc = -1;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.582656 * safezoneW;
			h = 0.77 * safezoneH;
		};
		class InventoryPfeil:Life_RscPicture {
			text = "textures\inventory\back_pfeil.paa";
			idc = -1;
			x = 0.315612 * safezoneW + safezoneX;
			y = 0.43125 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.0275 * safezoneH;
		};
		
		class HUDHeader : Life_RscText
		{
			idc = -1;
			text = "HUD Einstellungen";
			colorBackground[] = {1,0.537,0,0.5};
			shadow = 0;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ChatHeader : Life_RscText
		{
			idc = -1;
			text = "Chat Einstellungen";
			colorBackground[] = {1,0.537,0,0.5};
			shadow = 0;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class SideChatHeader : Life_RscText
		{
			idc = -1;
			text = "$STR_SM_SC";
			colorBackground[] = {1,0.537,0,0.5};
			shadow = 0;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class RevealNearestHeader : Life_RscText
		{
			idc = -1;
			text = "Reveal Nearest Objects";
			colorBackground[] = {1,0.537,0,0.5};
			shadow = 0;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls
	{
		class VDonFoot : Life_RscText
		{
			idc = -1;
			text = "$STR_SM_onFoot";
			
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class VDinCar : Life_RscText
		{
			idc = -1;
			text = "$STR_SM_inCar";
			
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class VDinAir : Life_RscText
		{
			idc = -1;
			text = "$STR_SM_inAir";
			
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_onfoot_slider : Life_RscXSliderH 
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.188281 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_onfoot_value : Life_RscEdit
		{
			idc = 2902;
			text = "";
			onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_s_onChar;";

			x = 0.667656 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_car_slider : Life_RscXSliderH 
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.188281 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_car_value : Life_RscEdit
		{
			idc = 2912;
			text = "";
			onChar = "[_this select 0, _this select 1,'vehicle',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call life_fnc_s_onChar;";

			x = 0.667656 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_air_slider : Life_RscXSliderH 
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.188281 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class VD_air_value : Life_RscEdit
		{
			idc = 2922;
			text = "";
			onChar = "[_this select 0, _this select 1,'air',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'air',true] call life_fnc_s_onChar;";

			x = 0.667656 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class HUDONOFF : Life_Checkbox
		{
			idc = 2970;
			tooltip = "Stellt dein HUD an und aus";
			onCheckedChanged = "['hud',_this select 1] call life_fnc_s_onCheckedChange;";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ChatONOFF : Life_Checkbox
		{
			idc = 2973;
			tooltip = "Stellt deinen Chat an und aus";
			onCheckedChanged = "['chat',_this select 1] call life_fnc_s_onCheckedChange;";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class SideChatONOFF : Life_Checkbox
		{
			idc = 2971;
			tooltip = "$STR_GUI_SideSwitch";
			onCheckedChanged = "['sidechat',_this select 1] call life_fnc_s_onCheckedChange;";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RevealONOFF : Life_Checkbox
		{
			idc = 2972;
			tooltip = "$STR_GUI_PlayerReveal";
			onCheckedChanged = "['objects',_this select 1] call life_fnc_s_onCheckedChange;";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonColor : Life_RscButtonMenu {
			idc = -1;
			text = "Farbe";
			onButtonClick = "[] call life_fnc_CorDis;";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonHome : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.263 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "HOME";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonCell : Life_RscButtonMenu {
			idc = 2014;
			onButtonClick = "closeDialog 0;createDialog ""Life_cell_phone"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "$STR_PM_CellPhone";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonKeys : Life_RscButtonMenu {
			idc = 2013;
			onButtonClick = "closeDialog 0;createDialog ""life_key_management"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.366 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "$STR_PM_KeyChain";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonMyGang : Life_RscButtonMenu {
			idc = 2011;
			onButtonClick = "closeDialog 0;if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "$STR_PM_MyGang";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
        class ButtonShowExp : Life_RscButtonMenu {
            idc = 2016;
			onButtonClick = "closeDialog 0;[] call life_fnc_showEXP;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "Erfahrung";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
        };
		
		class ButtonInfo: Life_RscButtonMenu {
			idc = 99630;
            onButtonClick = "closeDialog 0;[] spawn life_fnc_InfoMenu;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.5745 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "Info";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonMarket : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;createDialog ""life_dynmarket_prices"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.627 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "Markt";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonSyncData : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call SOCK_fnc_syncData;";
			x = 0.253 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.035 * safezoneH;
			
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
			onButtonClick = "closeDialog 0;";
			x = 0.244 * safezoneW + safezoneX;
			y = 0.242 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.014 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			
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
