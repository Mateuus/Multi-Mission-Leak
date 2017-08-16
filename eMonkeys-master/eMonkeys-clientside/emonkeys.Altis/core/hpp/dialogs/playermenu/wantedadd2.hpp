class EMonkeys_wantedadd2 
{
	idd = 9900;
	name= "EMonkeys_wantedadd2";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn EMonkeys_fnc_wantedadd2;";
	
	class controlsBackground 
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_wantedMenu.paa";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.902 * safezoneH;
		};
		
		class Close_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_beenden.paa";
			x = 0.31901 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Save_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_speichern.paa";
			x = 0.342708 * safezoneW + safezoneX;
			y = 0.666445 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Settings_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_einstellung.paa";
			x = 0.660417 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Keys_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_keys.paa";
			x = 0.499426 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Phone_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_handy.paa";
			x = 0.523644 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class PermGangs_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_permgang.paa";
			x = 0.475729 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Gang_Icon: EMonkeys_RscPicture
		{
			idc = 2051;
			text = "core\textures\menu_icons\icon_gang.paa";
			x = 0.451511 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Wanted_Icon: EMonkeys_RscPicture
		{
			idc = 2053;
			text = "core\textures\menu_icons\icon_wanted.paa";
			x = 0.636459 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Craft_Icon: EMonkeys_RscPicture
		{
			idc = 2055;
			text = "core\textures\menu_icons\icon_craft.paa";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Admin_Icon: EMonkeys_RscPicture
		{
			idc = 2057;
			text = "core\textures\menu_icons\icon_admin.paa";
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class hinzufuegen_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_hinzufuegen.paa";
			x = 0.604896 * safezoneW + safezoneX;
			y = 0.359593 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls 
	{
		class PlayerList_Admin : EMonkeys_RscListBox 
		{
			idc = 9902;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] spawn EMonkeys_fnc_adminQuery";
			x = 0.319271 * safezoneW + safezoneX;
			y = 0.385185 * safezoneH + safezoneY;
			w = 0.0938542 * safezoneW;
			h = 0.267037 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
        class RSUCombo_2101: EMonkeys_RscListBox
        {
            idc = 9991;
			text = "";
			sizeEx = 0.035;
			x = 0.420988 * safezoneW + safezoneX;
			y = 0.387186 * safezoneH + safezoneY;
			w = 0.260886 * safezoneW;
			h = 0.264112 * safezoneH;
        };

		class Adminwanted : EMonkeys_RscButtonMenu 
		{
			idc = -1;
			text = "";
			onButtonClick = "[] call EMonkeys_fnc_wanted2;";
			x = 0.604896 * safezoneW + safezoneX;
			y = 0.359593 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};		
		////////////////////////////////////////////////////
		class ButtonClose: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.31901 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "closeDialog 0;";
			tooltip = "Schliessen";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonSave: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.342708 * safezoneW + safezoneX;
			y = 0.666445 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] call SOCK_fnc_syncData;";
			tooltip = "Speichern";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonSettings: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.660417 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] call EMonkeys_fnc_settingsMenu;";
			tooltip = "Einstellungen";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonKeys: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.499426 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "closeDialog 0; createDialog ""EMonkeys_key_management"";";
			tooltip = "Schlüssel";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonPhone: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.523644 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] call EMonkeys_fnc_callCellPhone";
			tooltip = "Telefon";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonPermGangs: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.475729 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] spawn EMonkeys_fnc_permManager";
			tooltip = "Gruppenmenü";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonGang: EMonkeys_RscButtonMenu
		{
			idc = 2050;
			x = 0.451511 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] call EMonkeys_fnc_gangMenu";
			tooltip = "Gangmenü";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonWanted: EMonkeys_RscButtonMenu
		{
			idc = 2052;
			x = 0.636459 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] call EMonkeys_fnc_wantedMenu";
			tooltip = "Fahndungsliste";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonCraft: EMonkeys_RscButtonMenu
		{
			idc = 2054;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "closeDialog 0; createDialog ""EMonkeys_craft"";";
			tooltip = "Baumenü";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonAdmin: EMonkeys_RscButtonMenu
		{
			idc = 2056;
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "closeDialog 0; createDialog ""EMonkeys_admin_menu"";";
			tooltip = "Adminmenü";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
	};
};