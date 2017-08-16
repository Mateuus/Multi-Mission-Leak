class life_admin_menu {
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.141,0.18,0.71,1};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 1};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "$STR_Admin_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class PlayerList_Admin : Life_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn life_fnc_adminQuery";
			
			x = 0.12; y = 0.26;
			w = 0.30; h = 0.4;
		};
		
		class PlayerBInfo : Life_RscStructuredText
		{
			idc = 2903;
			text = "";
			x = 0.42;
			y = 0.25;
			w = 0.35;
			h = 0.6;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			colorBackground[] = {0.6, 0.4, 0};
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminID : Life_RscButtonMenu {
			colorBackground[] = {0.6, 0.4, 0};
			idc = -1;
			text = "$STR_Admin_GetID";
			onButtonClick = "[] call life_fnc_admingetID;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class TeleportToHim : Life_RscButtonMenu {
			colorBackground[] = {0.6, 0.4, 0};
			idc = 2030;
			text = "TP zu ihm";
			onButtonClick = "[] call life_fnc_admintp;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class MapTeleport : Life_RscButtonMenu {
			colorBackground[] = {0.6, 0.4, 0};
			idc = 2070;
			text = "TP via Map";
			onButtonClick = "[] spawn life_fnc_admintpmap;closeDialog 0;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class TeleportToMe : Life_RscButtonMenu {
			colorBackground[] = {0.6, 0.4, 0};
			idc = 2060;
			text = "TP zu mir";
			onButtonClick = "[] spawn life_fnc_admintptome;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class GottAn : Life_RscButtonMenu {
			colorBackground[] = {1, 0, 0};
			idc = 2080;
			text = "Gott AN";
			onButtonClick = "[] spawn life_fnc_godmodean;closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.884;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class GottAus : Life_RscButtonMenu {
			colorBackground[] = {1, 0, 0};
			idc = 2090;
			text = "Gott AUS";
			onButtonClick = "[] spawn life_fnc_godmodeaus;closeDialog 0;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.884;
			w = (6.25 / 40);
			h = (1 / 25);
		};
			class Leichen : Life_RscButtonMenu {
			colorBackground[] = {0.6, 0.4, 0};
			idc = 2100;
			text = "Löschen";
			onButtonClick = "deleteVehicle cursorTarget;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.884;
			w = (6.25 / 40);
			h = (1 / 25);
		};
			class Destroy : Life_RscButtonMenu  {
			colorBackground[] = {0.6, 0.4, 0};
			idc = 2110;
			text = "Zerstören";
			onButtonClick = "[] spawn life_fnc_destroy;closeDialog 0;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.884;
			w = (6.25 / 40);
			h = (1 / 25);
		};
			class Zuschauen : Life_RscButtonMenu {
			colorBackground[] = {0.6, 0.4, 0};
			idc = 2120;
			text = "Beobachten";
			onButtonClick = "[] spawn life_fnc_spectate";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.884;
			w = (6.25 / 40);
			h = (1 / 25);
		};
			class TEST1 : Life_RscButtonMenu {
			colorBackground[] = {0.1, 0.5, 0};
			idc = 2150;
			text = "ESP AN";
			onButtonClick = "[] spawn life_fnc_playerespan";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.927;
			w = (6.25 / 40);
			h = (1 / 25);
		};
			class TEST2 : Life_RscButtonMenu {
			colorBackground[] = {0.1, 0.5, 0};
			idc = 2160;
			text = "ESP AUS";
			onButtonClick = "[] spawn life_fnc_playerespaus";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.927;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};