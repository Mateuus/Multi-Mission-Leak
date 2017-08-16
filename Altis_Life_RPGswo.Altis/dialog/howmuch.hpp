class DWEV_howmuch
{
	idd = 2659;
	name = "DWEV_howmuch";
	movingEnabled = false;
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
	
	class controls 
	{
		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 26651;
			text = "";
			style = 0x02;
			x = 0;
			y = 0.25;
			w = 1;
			h = 0.04;
		};
		
		class howMuchTitle : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Anzahl eingeben";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		}; 
		
		class numberEdit : DWEV_RscEdit 
		{
			idc = 26552;
			text = "1";
			sizeEx = 0.030;
			colorBackground[] = {0, 0, 0, 0.5};
			x = 0.375;
			y = 0.4;
			w = 0.25;
			h = 0.03;
		};
		
		class ctrl_grafik_accept: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ok.paa";
			x = 0.4625;
			y = 0.45;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_accept: DWEV_RscButtonInvisible
		{
			idc = 507006;
			text = "";
			tooltip = "Bestätigen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "hint format [%1, ctrlText((findDisplay 2659) displayCtrl 26552)]";
			x = 0.4625;
			y = 0.45;
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