class life_admin_menu {
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_adminMenu;";
	
	class controlsBackground {
		/*class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};*/
	    class fondtablet: Life_RscPicture
		{
			idc = 9090909;
			text = "images\ANL\anl_menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};		
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
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
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminID : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Admin_GetID";
			onButtonClick = "[] call life_fnc_admingetID;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Compensate : Life_RscButtonMenu {
			idc = 2904;
			text = "$STR_Admin_Compensate";
			onButtonClick = "createDialog ""Life_Admin_Compensate"";";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Spectate : Life_RscButtonMenu {
			idc = 2905;
			text = "$STR_Admin_Spectate";
			onButtonClick = "[] call life_fnc_adminSpectate;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Teleport : Life_RscButtonMenu {
			idc = 2906;
			text = "$STR_Admin_Teleport";
			onButtonClick = "[] call life_fnc_adminTeleport; hint 'Ou voulez vous allez ce soir ?';";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class TeleportHere : Life_RscButtonMenu {
			idc = 2907;
			text = "$STR_Admin_TpHere";
			onButtonClick = "[] call life_fnc_adminTpHere;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class God : Life_RscButtonMenu {
			idc = 2908;
			text = "$STR_Admin_God";
			onButtonClick = "[] call life_fnc_adminGodMode;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Freeze : Life_RscButtonMenu {
			idc = 2909;
			text = "$STR_Admin_Freeze";
			onButtonClick = "[] call life_fnc_adminFreeze;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Markers : Life_RscButtonMenu {
			idc = 2910;
			text = "$STR_Admin_Markers";
			onButtonClick = "[] spawn life_fnc_adminMarkers;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Debug : Life_RscButtonMenu {
			idc = 2911;
			text = "$STR_Admin_Debug";
			onButtonClick = "[] call life_fnc_adminDebugCon; hint 'De grands pouvoirs impliquent de grandes responsabilites !';";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Purge : Life_RscButtonMenu {
			idc = 2912;
			text = "Purge";
			onButtonClick = "[] execVM 'core\functions\fn_purge.sqf'";
			colorBackground[] = { 0.584, 0.086, 0.086, 1.0 };
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Airdrop : Life_RscButtonMenu {
			idc = 2913;
			text = "AirDrop";
			onButtonClick = "[[position player],'TON_fnc_generateAirdrop',false,false] spawn life_fnc_MP";
			colorBackground[] = { 0.584, 0.086, 0.086, 1.0 };
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Kart : Life_RscButtonMenu {
			idc = 2914;
			text = "Karting";
			onButtonClick = "[] execVM 'scripts\kart.sqf'";
			colorBackground[] = { 0.584, 0.086, 0.086, 1.0 };
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};	
		class Convoi : Life_RscButtonMenu {
			idc = 2914;
			text = "Convoi";
			onButtonClick = "[[player],'TON_fnc_initConvoy2',false,false] spawn life_fnc_MP";
			colorBackground[] = { 0.584, 0.086, 0.086, 1.0 };
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};			
		class Bourse : Life_RscButtonMenu {
			idc = 2915;
			text = "Bourse";
			onButtonClick = createDialog "life_dynmarket_changeprice";
			colorBackground[] = { 0.584, 0.086, 0.086, 1.0 };
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		/*
		class Arsenal : Life_RscButtonMenu {
			idc = 2916;
			text = "Arsenal";
			onButtonClick = "[] spawn BIS_fnc_arsenal";
			colorBackground[] = { 0.584, 0.086, 0.086, 1.0 };
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class admin_kick: Life_RscButtonMenu
		{
			idc = 2417;
			text = "Kick"; //--- ToDo: Localize;
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.715;
			w = (6.25 / 40);
			h = (1 / 25);
			onButtonClick = "[] spawn life_fnc_adminkick";
			colorBackground[] = {0.078, 0.231, 0.392, 0.937124};
		};
		class admin_ban: Life_RscButtonMenu
		{
			idc = 2418;
			text = "Ban"; //--- ToDo: Localize;
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.715;
			w = (6.25 / 40);
			h = (1 / 25);
			onButtonClick = "[] spawn life_fnc_adminBan;";
			colorBackground[] = {0.078, 0.231, 0.392, 0.937124};
		};
		class admin_cam: Life_RscButtonMenu
		{
			idc = 2419;
			text = "Cam libre"; //--- ToDo: Localize;
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.715;
			w = (6.25 / 40);
			h = (1 / 25);
			onButtonClick = "[] spawn life_fnc_admin_cam;";
			colorBackground[] = {0.078, 0.231, 0.392, 0.937124};
		};	
		*/
	};
};