class DWEV_gasCargo_refuel
{
	idd = IDC_GASSTAION_FUELVEHICLE_MAIN;
	name = "DWEV_gas_refuel";
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

		class vehTitle : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Fahrzeug auftanken";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;
		};

		class veh : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = IDC_GASSTAION_FUELVEHICLE_VEHINFOTXT;
			text = "Fahrzeug: Unbekannt";
			x = 0.10;
			y = 0.25;
			w = 0.4;
			h = 0.04;
		};

    class inhalt : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = IDC_GASSTAION_FUELVEHICLE_FUELCAPACITY;
			text = "Tankinhalt: Unbekannt";
			x = 0.10;
			y = 0.30;
			w = 0.4;
			h = 0.04;
		};

		class liter : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = IDC_GASSTAION_FUELVEHICLE_MISSINGFUEL;
			text = "fehlende Liter: Unbekannt";
			x = 0.10;
			y = 0.35;
			w = 0.4;
			h = 0.04;
		};

		class PriceperLiter : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = IDC_GASSTAION_FUELVEHICLE_LITERPRICE;
			text = "Preis je Liter:";
			x = 0.10;
			y = 0.40;
			w = 0.4;
			h = 0.04;
		};

    class liter2 : DWEV_RscTitle
    {
      colorBackground[] = {0, 0, 0, 0};
      idc = IDC_GASSTAION_FUELVEHICLE_REFUELD;
      text = "Liter getankt: Unbekannt";
      x = 0.50;
      y = 0.25;
      w = 0.4;
      h = 0.04;
    };

    class price : DWEV_RscTitle
    {
      colorBackground[] = {0, 0, 0, 0};
      idc = IDC_GASSTAION_FUELVEHICLE_REFUELPRICE;
      text = "Preis: Unbekannt";
      x = 0.50;
      y = 0.30;
      w = 0.4;
      h = 0.04;
    };

		class AbgeschlossenButton : DWEV_RscButtonMenu
			{
				idc = 888891;
				text = "Tanken";
				colorBackground[] = {0.022, 0.627, 0.022,1};
//				onButtonDown = "[] spawn DWEV_fnc_gasCargoFillFuel;";
//				onButtonClick = "DWEV_gas_refuel = 0;";
//				onButtonUp = "DWEV_gas_refuel = 0;";
				onMouseEnter = "[] spawn DWEV_fnc_gasCargoFillFuel;";
				onMouseExit = "DWEV_gas_refuel = 0;";
				x = 0.255;
				y = 0.75;
				w = 0.16;
				h = 0.10;
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
			tooltip = "Tanken schließen";
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