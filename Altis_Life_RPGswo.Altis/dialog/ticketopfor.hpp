class DWEV_ticketopfor_give
{
	idd = 2750;
	name = "DWEV_ticketopfor_give";
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
			idc = 2751;
			text = "";
			style = 0x02;
			x = 0;
			y = 0.25;
			w = 1;
			h = 0.04;
		};
		
		class BussgeldTitle : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Rechnung ausstellen";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		}; 
		
		class moneyEdit : DWEV_RscEdit 
		{
			idc = 2752;
			text = "100";
			sizeEx = 0.030;
			colorBackground[] = {0, 0, 0, 0.5};
			x = 0.375;
			y = 0.4;
			w = 0.25;
			h = 0.03;
		};
		
		class ctrl_grafik_ausstellen: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ok.paa";
			x = 0.4625;
			y = 0.45;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_ausstellen: DWEV_RscButtonInvisible
		{
			idc = 507006;
			text = "";
			tooltip = "Rechnung ausstellen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_ticketopforGive";
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

class DWEV_ticketopfor_pay
{
	idd = 2700;
	name = "DWEV_ticketopfor_pay";
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
		class Buss12Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Rechnung erhalten";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
		
		class InfoMsg : DWEV_RscStructuredText
		{
			idc = 2701;
			sizeEx = 0.020;
			text = "";
			x = 0.287;
			y = 0.25;
			w = 0.5;
			h = 0.12;
		};
		
		class ctrl_grafik_zahlen: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ok.paa";
			x = 0.325;
			y = 0.45;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_zahlen: DWEV_RscButtonInvisible
		{
			idc = 507006;
			text = "";
			tooltip = "Rechnung bezahlen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_ticketopforPay;";
			x = 0.325;
			y = 0.45;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_grafik_ablehnen: DWEV_RscPicture
		{
			idc = 507007;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_nein.paa";
			x = 0.625;
			y = 0.45;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_ablehnen: DWEV_RscButtonInvisible
		{
			idc = 507008;
			text = "";
			tooltip = "Rechnung nicht bezahlen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;";
			x = 0.625;
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