class DWEV_gas_select {
	idd = IDC_GASSTAION_VEHICLESELECTION_MAIN;
	name= "DWEV_gas_select";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton;";

	class controlsBackground
	{
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
			text = "Fahrzeug tanken";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;
		};

		class vehicleListe : DWEV_RscListBox
		{
			idc = IDC_GASSTAION_VEHICLESELECTION_LIST;
			text = "";
			sizeEx = 0.025;
			colorBackground[] = {0, 0, 0, 0};
			x = 0.28;
			y = 0.26;
			w = 0.60;
			h = 0.4;
		};

		class ctrl_grafik_gasVehicle: DWEV_RscPicture
		{
			idc = -1;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_zapf.paa";
			x = 0.375;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_grafik_gasCargo: DWEV_RscPicture
		{
			idc = IDC_GASSTATION_VEHICLESELECTION_ICON_CARGO;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_tank.paa";
			x = 0.475;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_gasVehicle: DWEV_RscButtonInvisible
		{
			idc = -1;
			text = "";
			tooltip = "Fahrzeug befüllen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_gasVehicleOpenStation;";
			x = 0.375;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_button_gasCargo: DWEV_RscButtonInvisible
		{
			idc = IDC_GASSTATION_VEHICLESELECTION_BTN_CARGO;
			text = "";
			tooltip = "Tank befüllen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_gasCargoOpenStation;";
			x = 0.475;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_icon_grafik_schliessen: DWEV_RscPicture
		{
			idc = 507001;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_schliessen.paa";
			x = 0.87;
			y = 0.075;
			w = 0.05;
			h = 0.05;
		};

		class ctrl_icon_button_schliessen: DWEV_RscButtonInvisible
		{
			idc = 507002;
			text = "";
			tooltip = "Auswahl schließen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;";
			x = 0.87;
			y = 0.075;
			w = 0.05;
			h = 0.05;
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
			tooltip = "Tablet kann nicht ausgeschaltet werden, solange ein Programm läuft";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
	};
};
