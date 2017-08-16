class DWEV_taxi_ziel
{
	idd = 38600;
	movingEnabled = false;
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
		
		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "TAXI Wolf";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		}; 
		
		class SpawnPointTitle : DWEV_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 38601;
			style = 0x02;
			text = "";
			x = 0.049;
			y = 0.2;
			w = 0.9;
			h = 0.04;
		};
		
		class MapView : DWEV_RscMapControl 
		{
			idc = 38602;
			x = 0.377;
			y = 0.26;
			w = 0.56;
			h = 0.472;
			colorBackground[] = {0, 0, 0, 0.7};
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;
		};
	};
	
	class controls
	{	
		class SpawnPointList: DWEV_RscListNBox
		{
			idc = 38610;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.054;
			y = 0.26;
			w = 0.325;
			h = 0.4;
			onLBSelChanged = "_this call DWEV_fnc_taxiPointSelected;";
		};
		
		class spawnButton : DWEV_RscButtonMenu
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.5};
			text = "Los Fahren";
			onButtonClick = "[] call DWEV_fnc_taxiPointConfirm";
			x = 0.1375;
			y = 0.69;
			w = 0.15;
			h = 0.04;
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