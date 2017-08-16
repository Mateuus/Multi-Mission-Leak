class life_admin_menu {
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_adminMenu;";

	class controlsBackground {

	    class fondtablet: Life_RscPicture
		{
			idc = 9090909;
			text = "textures\allgemein\tablets\adminmenu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.2};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
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
			text = "schliessen";
			onButtonClick = "closeDialog 0;";			
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
		};
		class AdminID : Life_RscButtonMenu {
			idc = -1;
			text = "Ts3 Holen";
			onButtonClick = "[] call life_fnc_admints3;";
            x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
		};
		
		class Compensate : Life_RscButtonMenu {
			idc = 2904;
			text = "Überweisen";		
			onButtonClick = "createDialog ""Life_Admin_Compensate"";";
            x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
		};	
		
		class restart : Life_RscButtonMenu {
			idc = 2935;
			text = "S Restart";
            colorBackground[] = {1,0,0,1};
			onButtonClick = "remoteExec ['life_fnc_armageddon', 0, true];";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.705;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Nucleare : Life_RscButtonMenu {
			idc = 2913;
			text = "Nucleare";
            colorBackground[] = {1,0,0,1};
			onButtonClick = "remoteExec ['life_fnc_nuke', 0, true];";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.755;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class erd : Life_RscButtonMenu {
			idc = 2923;
			text = "Erdbeben";
			colorBackground[] = {1,0,0,1};
			onButtonClick = "[] execVM 'scripts\events\earthquake.sqf'";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.755;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Spectate : Life_RscButtonMenu {
			idc = 2905;
			text = "Spectaten";
			colorBackground[] = {0, 0, 0, 0.0};	
			onButtonClick = "[] call life_fnc_adminSpectate;";
            x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
		};
		class Teleport : Life_RscButtonMenu {
			idc = 2906;
			text = "$STR_Admin_Teleport";		
			onButtonClick = "[] call life_fnc_adminTeleport; hint 'Wähle auf der Map den Teleportierung punkt aus';";
            x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
		};
		class TeleportHere : Life_RscButtonMenu {
			idc = 2907;
			text = "$STR_Admin_TpHere";			
			onButtonClick = "[] call life_fnc_adminTpHere;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.885;
            w = (6.25 / 40);
            h = (1 / 25);
		};
		class God : Life_RscButtonMenu {
			idc = 2908;
			text = "GodMode";			
			onButtonClick = "[] call life_fnc_adminGodMode;";
            x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.885;
            w = (6.25 / 40);
            h = (1 / 25);
		};
		class Purge : Life_RscButtonMenu {
			idc =2927;
			text = "The Purge";
            colorBackground[] = {1,0,0,1};
			onButtonClick = "[] execVM 'core\functions\fn_purge.sqf'";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.755;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class siren : Life_RscButtonMenu {
			idc = 2928;
			text = "Notstand";
            colorBackground[] = {1,0,0,1};
			onButtonClick = "[] execVM 'core\admin\sirene_kavala.sqf'";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.755;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Freeze : Life_RscButtonMenu {
			idc = 2909;
			text = "Freeze";				
			onButtonClick = "[] call life_fnc_adminFreeze;";
            x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.885;
            w = (6.25 / 40);
            h = (1 / 25);
		};
		class ammo : Life_RscButtonMenu {
			idc = 2914;
			text = "MuniBox";
            colorBackground[] = {1,0,0,1};
			onButtonClick = "[] execVM 'scripts\events\fillCrate.sqf'";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.755;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Markers : Life_RscButtonMenu {
            idc = 2910;
            text = "Marker";
            onButtonClick = "[] spawn life_fnc_adminMarkers;";
            x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.885;
            w = (6.25 / 40);
            h = (1 / 25);
		};
		
		class Debug : Life_RscButtonMenu {
			idc = 2911;
			text = "Debug";
			onButtonClick = "[] call life_fnc_adminDebugCon;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};	
		class ATM : Life_RscButtonMenu {
			idc = 2912;
			text = "E-Banking";
			onButtonClick = "[] spawn life_fnc_adminATM";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.93;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class DeleteVehicle : Life_RscButtonMenu {
			idc = 2922;
			text = "Vehicle Lö";
			onButtonClick = "[] call life_fnc_adminDeleteVehicle;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.93;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Unrestrain : Life_RscButtonMenu {
			idc = 2915;
			text = "Entfesseln";
			onButtonClick = "[] call life_fnc_adminUnrestrain;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.93;
			w = (6.25 / 40); 
			h = (1 / 25);
		};
		class Restrain : Life_RscButtonMenu {
			idc = 2916;
			text = "Fesseln";
			onButtonClick = "[] call life_fnc_adminRestrain;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.93;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class ARevive : Life_RscButtonMenu {
			idc = 2917;
			text = "Revive";
			onButtonClick = "[] call life_fnc_adminRevive;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.93;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		/*
		class Stealth : Life_RscButtonMenu {
			idc = 2918;
			text = "Unsichtbar";
			onButtonClick = "[] call life_fnc_adminhide;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.975;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Ban : Life_RscButtonMenu {
			idc = 2929;
			text = "Ban user";
			onButtonClick = "[] call life_fnc_adminBan;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.975;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		*/
		class Ride : Life_RscButtonMenu {
			idc = 2920;
			text = "Car spawn";
			onButtonClick = "[] call life_fnc_adminRide;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.975;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class FlyRide : Life_RscButtonMenu {
			idc = 2921;
			text = "Heli spawn";
			onButtonClick = "[] call life_fnc_adminFlyRide;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.975;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminCon2 : Life_RscButtonMenu {
			idc = 2923;
			text = "Admin Aktion";				
			onButtonClick = "[] call life_fnc_adminActions;";
            x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.975;
            w = (6.25 / 40);
            h = (1 / 25);
		};
		
	};
};
