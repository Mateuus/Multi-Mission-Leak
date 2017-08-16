class DWEV_wantedadd2 {
	idd = 9900;
	name= "DWEV_wantedadd2";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; [] spawn DWEV_fnc_wantedadd2;";
	
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
			text = "Fahndungs suche";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
		
		class PlayerList : DWEV_RscListBox 
		{
			colorBackground[] = {0,0,0,0};
			idc = 9902;
			text = "";
			sizeEx = 0.025;
			onLBSelChanged = "[_this] spawn DWEV_fnc_adminQuery";
			x = 0.12;
			y = 0.26;
			w = 0.15;
			h = 0.4;
		};
		
        class Gruende_Fahndungsliste: DWEV_RscListBox
        {
			colorBackground[] = {0,0,0,0};
            idc = 9991;
			text = "";
			sizeEx = 0.025;
			x = 0.28;
			y = 0.26;
			w = 0.60;
			h = 0.4;
        };
		
		class ctrl_grafik_Hinzufuegen: DWEV_RscPicture
		{
			idc = 507025;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_hinzufuegen.paa";
			x = 0.46;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_Hinzufuegen: DWEV_RscButtonInvisible
		{
			idc = 507026;
			text = "";
			tooltip = "Zur Fahndungsliste hinzufügen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_wanted2;";
			x = 0.46;
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
			tooltip = "Fahndungs suche schließen";
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