class life_admin_menu {
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0.05, 0.05, 0.7};
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
			text = "Asylum Admin Menu";
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
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminCam : Life_RscButtonMenu {
			idc = 1000;
			text = "Admin Cam";
			onButtonClick = "[] call BIS_fnc_camera;";
			x = 0.10 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class RestartServer : Life_RscButtonMenu {
			idc = 2000;
			text = "Restart Server";
			onButtonClick = "[[player],""ASY_fnc_rebootMonitor"",false,false] spawn BIS_fnc_MP;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminSpectate : Life_RscButtonMenu {
			idc = 2101;
			text = "Spectate";
			onButtonClick = "[] call life_fnc_spec";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminJail : Life_RscButtonMenu {
			idc = 7331;
			text = "JAIL THEM";
			onButtonClick = "[true] call life_fnc_spec";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.92 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminTeleport : Life_RscButtonMenu {
			idc = 2102;
			text = "Teleport";
			onButtonClick = "[false] call life_fnc_tp";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminTphere : Life_RscButtonMenu {
			idc = 2104;
			text = "TPtoME";
			onButtonClick = "[true] call life_fnc_tp";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.92 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class AdminTpThere : Life_RscButtonMenu {
			idc = 1337;
			text = "TPtoTHEM";
			onButtonClick = "[true,true] call life_fnc_tp";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.92 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class revive : Life_RscButtonMenu {
			idc = 1338;
			text = "Revive";
			onButtonClick = "[true] call life_fnc_vis";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.92 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminInvisible : Life_RscButtonMenu {
			idc = 2103;
			text = "Invisible";
			onButtonClick = "[] call life_fnc_vis";
			x = 0.10 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.92 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};