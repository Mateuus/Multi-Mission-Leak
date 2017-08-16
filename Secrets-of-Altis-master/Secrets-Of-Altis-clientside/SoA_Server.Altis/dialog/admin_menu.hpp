class life_admin_menu {
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";
	
	class controlsBackground {
			
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4,0,0,0.5};
			idc = -1;
			x = 0.0625;
			y = 0.2;
			w = 0.875;
			h = 0.04;
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0625;
			y = 0.24;
			w = 0.875;
			h = 0.74;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "$STR_Admin_Title";
			x = 0.0625;
			y = 0.2;
			w = 0.6;
			h = 0.04;
		};
		
		class PlayerList_Admin : Life_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.03;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn life_fnc_adminQuery";
			
			x = 0.075;
			y = 0.26;
			w = 0.2875;
			h = 0.64;
		};
		
		class PlayerBInfo : Life_RscStructuredText
		{
			idc = 2903;
			text = "";
			sizeEx = 0.028;
			x = 0.3875;
			y = 0.26;
			w = 0.5375;
			h = 0.4;
		};

		class AdminRepair : Life_RscButtonMenu {
			idc = 2915;
			text = "Entfernen";
			onButtonClick = "[] spawn life_fnc_RepairBuild;";
			x = 0.3875;
			y = 0.68;
			w = 0.1625;
			h = 0.04;
		};
		
		class AdminCrash : Life_RscButtonMenu {
			idc = 2917;
			text = "Freigeben"; //Crash Ihn
			onButtonClick = "cursorObject setVariable['trunk_in_use',false,true];"; //[] call life_fnc_CrashPlayer;
			x = 0.3875;
			y = 0.74;
			w = 0.1625;
			h = 0.04;
		};
		
		class Compensate : Life_RscButtonMenu {
			idc = 2904;
			text = "$STR_Admin_Compensate";
			onButtonClick = "createDialog ""Life_Admin_Compensate"";";
			x = 0.3875;
			y = 0.8;
			w = 0.1625;
			h = 0.04;
		};
		class ATM : Life_RscButtonMenu {
			idc = 2905;
			text = "$STR_Admin_ATM";
			onButtonClick = "[] spawn life_fnc_adminATM;";
			x = 0.3875;
			y = 0.92;
			w = 0.1625;
			h = 0.04;
		};
		class Teleport : Life_RscButtonMenu {
			idc = 2906;
			text = "$STR_Admin_Teleport";
			onButtonClick = "[] spawn life_fnc_adminTeleport;";
			x = 0.575;
			y = 0.68;
			w = 0.1625;
			h = 0.04;
		};
		class TeleportHere : Life_RscButtonMenu {
			idc = 2907;
			text = "$STR_Admin_TpHere";
			onButtonClick = "[] spawn life_fnc_adminTpHere;";
			x = 0.575;
			y = 0.74;
			w = 0.1625;
			h = 0.04;
		};
		class God : Life_RscButtonMenu {
			idc = 2908;
			text = "$STR_Admin_God";
			onButtonClick = "[] spawn life_fnc_adminGodMode;";
			x = 0.3875;
			y = 0.86;
			w = 0.1625;
			h = 0.04;
		};
		class Freeze : Life_RscButtonMenu {
			idc = 2909;
			text = "$STR_Admin_Freeze";
			onButtonClick = "[] call life_fnc_adminFreeze;";
			x = 0.575;
			y = 0.8;
			w = 0.1625;
			h = 0.04;
		};
		class Markers : Life_RscButtonMenu {
			idc = 2910;
			text = "$STR_Admin_Markers";
			onButtonClick = "[] spawn life_fnc_adminMarkers;";
			x = 0.575;
			y = 0.86;
			w = 0.1625;
			h = 0.04;
		};
		class Spectate : Life_RscButtonMenu {
			idc = 2911;
			text = "$STR_Admin_Spectate";
			onButtonClick = "[] spawn life_fnc_adminSpectate;";
			x = 0.7625;
			y = 0.68;
			w = 0.1625;
			h = 0.04;
		};
		class MassTeleport : Life_RscButtonMenu {
			idc = 2912;
			text = "Massenport";
			onButtonClick = "[] call life_fnc_massTeleport;";
			x = 0.7625;
			y = 0.74;
			w = 0.1625;
			h = 0.04;
		};
		
		class feuerwerk : Life_RscButtonMenu {
			idc = 2913;
			text = "Feuerwerk";
			onButtonClick = "[1] call life_fnc_adminfirework;";
			x = 0.7625;
			y = 0.8;
			w = 0.1625;
			h = 0.04;
		};
	
		class feuerwerk2 : Life_RscButtonMenu {
			idc = 2914;
			text = "Kavalashow";
			onButtonClick = "[0] call life_fnc_adminfirework;";
			x = 0.7625;
			y = 0.86;
			w = 0.1625;
			h = 0.04;
		};
	
		class Vergabe : Life_RscButtonMenu {
			idc = "2918";
			text = "Vergabe";
			onButtonClick = "createdialog 'adminvergabe';";
			x = 0.7625;
			y = 0.92;
			w = 0.1625;
			h = 0.04;
		};
	
		class Unsichtbar : Life_RscButtonMenu {
			idc = 2916;
			text = "Unsichtbar";
			onButtonClick = "[] spawn life_fnc_adminhide;";
			x = 0.575;
			y = 0.92;
			w = 0.1625;
			h = 0.04;
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.075;
			y = 0.92;
			w = 0.1625;
			h = 0.04;
		};
	};
};