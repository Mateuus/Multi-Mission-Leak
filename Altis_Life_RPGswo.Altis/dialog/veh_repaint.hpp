class DWEV_vehicle_repaint {
	idd = 2300;
	name= "DWEV_vehrepaint_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton;";
	
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
		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Fahrzeug umlakieren";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
		
		class VehicleList : DWEV_RscListBox 
		{
			idc = 2302;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] call DWEV_fnc_Repaintcolor";
			x = 0.12;
			y = 0.26;
			w = 0.76;
			h = 0.4;
		};
		
		class ColorList : DWEV_RscCombo
		{
			idc = 2303;
			colorBackground[] = {0,0,0,0.5};
			x = 0.3625;
			y = 0.68;
			w = 0.275;
			h = 0.03;
		};
		
		class ctrl_grafik_nehmen: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ok.paa";
			x = 0.4625;
			y = 0.76;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_nehmen: DWEV_RscButtonInvisible
		{
			idc = 507006;
			text = "";
			tooltip = "Fahrzeug für 50.000 € umlackieren";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_RepaintVehicle;";
			x = 0.4625;
			y = 0.76;
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