class EMonkeys_admin_menu {
	idd = 2900;
	name= "EMonkeys_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn EMonkeys_fnc_adminMenu; [] call EMonkeys_fnc_updatePlayerMenu";
	
	class controlsBackground 
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_adminMenu.paa";
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
	};
	
	class controls 
	{
		class PlayerList_Admin : EMonkeys_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onLBSelChanged = "[_this] spawn EMonkeys_fnc_adminQuery";
			x = 0.321562 * safezoneW + safezoneX;
			y = 0.389074 * safezoneH + safezoneY;
			w = 0.173542 * safezoneW;
			h = 0.205 * safezoneH;
		};
		
		class PlayerBInfo : EMonkeys_RscStructuredText
		{
			idc = 2903;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.389074 * safezoneH + safezoneY;
			w = 0.173542 * safezoneW;
			h = 0.205 * safezoneH;
		};
		
		class textEdit : EMonkeys_RscEdit 
		{
			idc = 5904;
			text = "";
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.321354 * safezoneW + safezoneX;
			y = 0.599074 * safezoneH + safezoneY;
			w = 0.17323 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class AdminID : EMonkeys_RscButtonMenu 
		{
			idc = -1;
			text = "";
			onButtonClick = "[] call EMonkeys_fnc_admingetID;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.31974 * safezoneW + safezoneX;
			y = 0.62963 * safezoneH + safezoneY;
			w = 0.0845312 * safezoneW;
			h = 0.0257037 * safezoneH;
		};
		
		class TeleportToHim : EMonkeys_RscButtonMenu 
		{
			idc = 2030;
			text = "";
			onButtonClick = "[] call EMonkeys_fnc_admintp;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.4125 * safezoneW + safezoneX;
			y = 0.629629 * safezoneH + safezoneY;
			w = 0.0839583 * safezoneW;
			h = 0.0257037 * safezoneH;
		};

		class MapTeleport : EMonkeys_RscButtonMenu 
		{
			idc = 2070;
			text = "";
			onButtonClick = "[] spawn EMonkeys_fnc_admintpmap;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.596354 * safezoneW + safezoneX;
			y = 0.629629 * safezoneH + safezoneY;
			w = 0.0838541 * safezoneW;
			h = 0.0258148 * safezoneH;
		};
		
		class TeleportToMe : EMonkeys_RscButtonMenu 
		{
			idc = 2060;
			text = "";
			onButtonClick = "[] spawn EMonkeys_fnc_admintptome;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.503645 * safezoneW + safezoneX;
			y = 0.62963 * safezoneH + safezoneY;
			w = 0.0844792 * safezoneW;
			h = 0.0257037 * safezoneH;
		};
		
		class event1 : EMonkeys_RscButtonMenu 
		{
			idc = 2061;
			text = "Fast on Altis";
			onButtonClick = "[0] spawn emonkeys_fnc_event1;";
			x = 0.484222 * safezoneW + safezoneX;
			y = 0.326639 * safezoneH + safezoneY;
			w = 0.0567368 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
		
		class event2 : EMonkeys_RscButtonMenu 
		{
			idc = 2062;
			text = "Craftmission";
			onButtonClick = "[1] spawn emonkeys_fnc_event1;";
			x = 0.543653 * safezoneW + safezoneX;
			y = 0.326639 * safezoneH + safezoneY;
			w = 0.0515789 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
		
		class event3 : EMonkeys_RscButtonMenu 
		{
			idc = 2063;
			text = "Erdbeben";
			onButtonClick = "[2] spawn emonkeys_fnc_event1;";
			x = 0.597297 * safezoneW + safezoneX;
			y = 0.326639 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
		
		class event4 : EMonkeys_RscButtonMenu 
		{
			idc = 2064;
			text = "Restart";
			onButtonClick = "[3] spawn emonkeys_fnc_event1;";
			x = 0.641381 * safezoneW + safezoneX;
			y = 0.32599 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.0220018 * safezoneH;
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