class life_admin_menu {
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_adminMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {.8,0,0,1};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
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
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminID : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Admin_GetID";
			onButtonClick = "[] call life_fnc_admingetID;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Compensate : Life_RscButtonMenu {
			idc = 2904;
			text = "$STR_Admin_Compensate";
			onButtonClick = "createDialog ""Life_Admin_Compensate"";";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Spectate : Life_RscButtonMenu {
			idc = 2905;
			text = "$STR_Admin_Spectate";
			onButtonClick = "[] call life_fnc_adminSpectate;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Teleport : Life_RscButtonMenu {
			idc = 2906;
			text = "$STR_Admin_Teleport";
			onButtonClick = "[] call life_fnc_adminTeleport; hint 'Select where you would like to teleport';";
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
			text = "$STR_Admin_God";
			onButtonClick = "[] call life_fnc_adminGodMode;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Freeze : Life_RscButtonMenu {
			idc = 2909;
			text = "$STR_Admin_Freeze";
			onButtonClick = "[] call life_fnc_adminFreeze;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Markers : Life_RscButtonMenu {
			idc = 2910;
			text = "$STR_Admin_Markers";
			onButtonClick = "[] spawn life_fnc_adminMarkers;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Debug : Life_RscButtonMenu {
			idc = 2911;
			text = "$STR_Admin_Debug";
			onButtonClick = "[] call life_fnc_adminDebugCon;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ATM : Life_RscButtonMenu {
			idc = 2912;
			text = "$STR_Admin_ATM";
			onButtonClick = "[] spawn life_fnc_adminATM";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.93;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class TpToPlayer : Life_RscButtonMenu {
			idc = 2913;
			text = "$STR_Admin_TpToPlayer";
			onButtonClick = "[] call life_fnc_adminTpTo;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.93;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class DeleteVehicle : Life_RscButtonMenu {
			idc = 2914;
			text = "$STR_Admin_DeleteVehicle";
			onButtonClick = "[] call life_fnc_adminDeleteVehicle;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.93;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Unrestrain : Life_RscButtonMenu {
			idc = 2915;
			text = "$STR_Admin_Unrestrain";
			onButtonClick = "[] call life_fnc_adminUnrestrain;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.93;
			w = (6.25 / 40); 
			h = (1 / 25);
		};
		class Restrain : Life_RscButtonMenu {
			idc = 2916;
			text = "$STR_Admin_Restrain";
			onButtonClick = "[] call life_fnc_adminRestrain;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.93;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class ARevive : Life_RscButtonMenu {
			idc = 2917;
			text = "$STR_Admin_Revive";
			onButtonClick = "[] call life_fnc_adminRevive;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.975;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Stealth : Life_RscButtonMenu {
			idc = 2918;
			text = "$STR_Admin_Stealth";
			onButtonClick = "[] call life_fnc_adminStealth;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.975;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class TpInFront : Life_RscButtonMenu {
			idc = 2919;
			text = "$STR_Admin_TpInFront";
			onButtonClick = "[] call life_fnc_adminTpInFront;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.975;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Dynamic : Life_RscButtonMenu {
			idc = 2920;
			text = "Sell Prices";
			onButtonClick = "createDialog ""life_dynmarket_changeprice"";";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.975;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class RestartServer : Life_RscButtonMenu {
			idc = 2921;
			text = "Restart Server";
			onButtonClick = "[] call life_fnc_shutdownMessage;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.975;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};