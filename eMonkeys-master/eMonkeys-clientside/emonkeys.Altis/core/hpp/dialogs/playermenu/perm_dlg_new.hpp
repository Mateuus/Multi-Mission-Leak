class perm_dlg_new
{
	idd = 29650;
	name = "perm_dlg_new";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_gruppenMenu.paa";
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

		class picLogo: EMonkeys_RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.321093 * safezoneW + safezoneX;
			y = 0.391852 * safezoneH + safezoneY;
			w = 0.0742708 * safezoneW;
			h = 0.121926 * safezoneH;
		};
		
		class lblRank: EMonkeys_RscText
		{
			idc = 1001;
			text = "Rang 0 (Default)";
			x = 0.426563 * safezoneW + safezoneX;
			y = 0.625 * safezoneH + safezoneY;
			w = 0.255104 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls 
	{
		class bAdmin: EMonkeys_RscButtonMenu
		{
			idc = 2400;
			text = "";
			x = 0.320312 * safezoneW + safezoneX;
			y = 0.587963 * safezoneH + safezoneY;
			w = 0.0745833 * safezoneW;
			h = 0.0257038 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "if((call EMonkeys_adminlevel) > 0) then { EMonkeys_permmanager_admin = true; [] spawn EMonkeys_fnc_permManager_update; hint ""Adminmodus aktiviert."";};";
		};
		class bAktualisieren: EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			x = 0.320312 * safezoneW + safezoneX;
			y = 0.624074 * safezoneH + safezoneY;
			w = 0.0744792 * safezoneW;
			h = 0.0247778 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] spawn EMonkeys_fnc_permManager_Aktualisieren";
		};

		class cmbGroup: EMonkeys_RscCombo
		{
			idc = 2100;
			x = 0.418699 * safezoneW + safezoneX;
			y = 0.325926 * safezoneH + safezoneY;
			w = 0.26526 * safezoneW;
			h = 0.0238519 * safezoneH;
			onLBSelChanged = "[] spawn EMonkeys_fnc_permManager_update";
		};
		
		class cmbPlayers: EMonkeys_RscListbox
		{
			idc = 1500;
			x = 0.398438 * safezoneW + safezoneX;
			y = 0.389815 * safezoneH + safezoneY;
			w = 0.283958 * safezoneW;
			h = 0.231852 * safezoneH;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn EMonkeys_fnc_permManager_updateData";
		};
		
		class tRank: EMonkeys_RscEdit
		{
			idc = 1400;
			text = "0";
			x = 0.444791 * safezoneW + safezoneX;
			y = 0.362039 * safezoneH + safezoneY;
			w = 0.0454167 * safezoneW;
			h = 0.0229259 * safezoneH;
		};
		
		class bSetRank: EMonkeys_RscButtonMenu
		{
			idc = 2402;
			text = "";
			x = 0.320312 * safezoneW + safezoneX;
			y = 0.552778 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0238519 * safezoneH;
			tooltip = "Rang setzen (0 entspricht herauswerfen)";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick="[] spawn EMonkeys_fnc_permManager_set;";
		};
		
		class bSetLevel0: EMonkeys_RscButtonMenu
		{
			idc = 2403;
			text = "";
			x = 0.320312 * safezoneW + safezoneX;
			y = 0.516666 * safezoneH + safezoneY;
			w = 0.0745833 * safezoneW;
			h = 0.0257037 * safezoneH;
			tooltip = "Spieler herauswerfen";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick="[0] spawn EMonkeys_fnc_permManager_set;";
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
			onButtonClick = "closeDialog 0; [] call SOCK_fnc_syncData;";
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
			onButtonClick = "closeDialog 0; [] call EMonkeys_fnc_settingsMenu;";
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
			onButtonClick = "closeDialog 0; [] call EMonkeys_fnc_callCellPhone";
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
			onButtonClick = "closeDialog 0; [] spawn EMonkeys_fnc_permManager";
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
			onButtonClick = "closeDialog 0; [] call EMonkeys_fnc_gangMenu";
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
			onButtonClick = "closeDialog 0; [] call EMonkeys_fnc_wantedMenu";
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
	};
};