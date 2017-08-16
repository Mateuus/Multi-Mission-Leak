class DS_admin_menu {
	idd = 2900;
	name= "DS_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn DS_fnc_adminMenu;";
	
	class controlsBackground {
		class DS_RscTitleBackground:DS_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:DS_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
	};
	
	class controls {

		
		class Title : DS_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "Darkside Admin Menu";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class PlayerList_Admin : DS_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] spawn DS_fnc_adminQuery";
			
			x = 0.12; y = 0.26;
			w = 0.30; h = 0.4;
		};

		class RscEdit_1401: RscEdit
{
	idc = 2462;
	text = "0";
			x = 0.12;
			y = 0.72;
			w = 0.3;
			h = (1 / 25);
};
		
		class PlayerBInfo : DS_RscStructuredText
		{
			idc = 2903;
			text = "";
			x = 0.42;
			y = 0.25;
			w = 0.35;
			h = 0.6;
		};

		class CloseButtonKey : DS_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminID : DS_RscButtonMenu {
			idc = -1;
			text = "Temp Ban";
			onButtonClick = "[] spawn DS_fnc_tempBan;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (15.25 / 40);
			h = (1 / 25);
		};
		
		class Compensate : DS_RscButtonMenu {
			idc = 2904;
			text = "Compensate";
			onButtonClick = "[] call DS_fnc_adminCompensate;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Spectate : DS_RscButtonMenu {
			idc = 2905;
			text = "Spectate";
			onButtonClick = "[] call DS_fnc_adminSpectate;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Teleport : DS_RscButtonMenu {
			idc = 2906;
			text = "Teleport";
			onButtonClick = "[] call DS_fnc_adminTeleport; hint 'Select where you would like to teleport';";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class TeleportHere : DS_RscButtonMenu {
			idc = 2907;
			text = "TP Here";
			onButtonClick = "[] call DS_fnc_adminTpHere;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class God : DS_RscButtonMenu {
			idc = 2908;
			text = "God Mode";
			onButtonClick = "[] call DS_fnc_adminGodMode;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Freeze : DS_RscButtonMenu {
			idc = 2909;
			text = "Freeze";
			onButtonClick = "[] call DS_fnc_adminFreeze;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Markers : DS_RscButtonMenu {
			idc = 2910;
			text = "Markers";
			onButtonClick = "[] spawn DS_fnc_adminMarkers;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Debug : DS_RscButtonMenu {
			idc = 2911;
			text = "Debug";
			onButtonClick = "[] call DS_fnc_adminDebugCon;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class HaxorKeys : DS_RscButtonMenu {
			idc = 2915;
			text = "Haxor Keys";
			onButtonClick = "[] spawn DS_fnc_haxorKeys;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.925;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class QuickKick : DS_RscButtonMenu {
			idc = 7915;
			text = "Quick Kick";
			onButtonClick = "[] spawn DS_fnc_quickKick;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.965;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class HaxorKeysLock : DS_RscButtonMenu {
			idc = 4915;
			text = "Jail Release";
			onButtonClick = "[] spawn DS_fnc_haxorKeysDisable;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.925;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class RestartTimer : DS_RscButtonMenu {
			idc = 4916;
			text = "Restart Weight";
			onButtonClick = "[] spawn DS_fnc_adminRestart;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.925;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Kill : DS_RscButtonMenu {
			idc = 2912;
			text = "Script Kill";
			onButtonClick = "[] call DS_fnc_adminKill;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.925;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Sync : DS_RscButtonMenu {
			idc = 29166;
			text = "Sync All";
			onButtonClick = "[] call DS_fnc_adminSync;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.925;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};