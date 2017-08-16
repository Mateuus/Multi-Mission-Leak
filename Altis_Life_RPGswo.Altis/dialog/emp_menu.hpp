class nanoEMPConsole {
	idd = 3494;
	name= "nanoEMPConsole";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; [] spawn DWEV_fnc_openEmpMenu;";
	
	class controlsBackground {
		class wolftablet: DWEV_RscPicture
		{
			idc = 505000;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
	};
	
	class controls {
		class Shopname_Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "EMP Konsole";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
		
		class PlayerList : DWEV_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0};			
			x = 0.275;
			y = 0.26;
			w = 0.45;
			h = 0.4;
		};
		// wird nicht genutz?
		class PlayerBInfo : DWEV_RscStructuredText
		{
			idc = 2903;
			text = "";
			colorBackground[] = {0,0,0,0};
			x = 0.57;
			y = 0.25;
			w = 0.35;
			h = 0.6;
		};
		
		class ctrl_grafik_scan: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_scan.paa";
			x = 0.275;
			y = 0.68;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_scan: DWEV_RscButtonInvisible
		{
			idc = 507006;
			text = "";
			tooltip = "Umgebung nach Helikopter suchen.";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_scanVehicles;";
			x = 0.275;
			y = 0.68;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_grafik_deaktivieren: DWEV_RscPicture
		{
			idc = 507007;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ban.paa";
			x = 0.650;
			y = 0.68;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_deaktivieren: DWEV_RscButtonInvisible
		{
			idc = 507008;
			text = "";
			tooltip = "Helikopter deaktivieren.";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_empVehicle;";
			x = 0.650;
			y = 0.68;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_grafik_warnen: DWEV_RscPicture
		{
			idc = 507009;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_warn.paa";
			x = 0.4625;
			y = 0.68;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_warnen: DWEV_RscButtonInvisible
		{
			idc = 507010;
			text = "";
			tooltip = "Helikopter warnen.";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_warnVehicle;";
			x = 0.4625;
			y = 0.68;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_icon_grafik_shutdown: DWEV_RscPicture
		{
			idc = 507003;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_shutdown.paa";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
		
		class ctrl_icon_button_shutdown: DWEV_RscButtonInvisible
		{
			idc = 507004;
			text = "";
			tooltip = "Tablet ausschalten";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
	};
};
