class shops_menu {
	idd = 2400;
	name= "shops_menu";
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
		
		class vasText : DWEV_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			text = "Geschäftsinventar";
			sizeEx = 0.04;
			style = 0x02;
			x = 0.12;
			y = 0.27;
			w = 0.325;
			h = 0.04;
		};
		
		class vasgText : DWEV_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			text = "Dein Inventar";
			sizeEx = 0.04;
			style = 0x02;
			x = 0.55;
			y = 0.27;
			w = 0.325;
			h = 0.04;
		};
	};
	
	class controls {

		class itemList : DWEV_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.030;
			colorBackground[] = {0, 0, 0, 0};			
			x = 0.12;
			y = 0.31;
			w = 0.325;
			h = 0.340;
		};
		
		class pItemlist : DWEV_RscListBox 
		{
			idc = 2402;
			text = "";
			sizeEx = 0.030;	
			colorBackground[] = {0, 0, 0, 0};
			x = 0.55;
			y = 0.31;
			w = 0.325;
			h = 0.340;
		};
/*			
		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 2403;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = 0.04;
		};
*/		
		class Shopname_Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 2403;
			text = "";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
/*
		class PlayersName : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 601;
			style = 1;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = 0.04;
		};
*/		
		class buyEdit : DWEV_RscEdit 
		{
			idc = 2404;
			colorBackground[] = {0, 0, 0, 0.5};
			text = "1";
			sizeEx = 0.030;
			x = 0.12;
			y = 0.66;
			w = 0.325;
			h = 0.03;
		};
		
		class ctrl_grafik_kaufen: DWEV_RscPicture
		{
			idc = 507007;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ok.paa";
			x = 0.245;
			y = 0.70;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_kaufen: DWEV_RscButtonInvisible
		{
			idc = 507008;
			text = "";
			tooltip = "Gegenstand kaufen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_virt_buy;";
			x = 0.245;
			y = 0.70;
			w = 0.075;
			h = 0.075;
		};
		
		class sellEdit : DWEV_RscEdit 
		{
			idc = 2405;
			colorBackground[] = {0, 0, 0, 0.5};
			text = "1";
			sizeEx = 0.030;
			x = 0.55;
			y = 0.66;
			w = 0.325;
			h = 0.03;
		};
	
		class ctrl_grafik_verkaufen: DWEV_RscPicture
		{
			idc = 507009;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_nein.paa";
			x = 0.675;
			y = 0.70;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_verkaufen: DWEV_RscButtonInvisible
		{
			idc = 507010;
			text = "";
			tooltip = "Gegenstand verkaufen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_virt_sell";
			x = 0.675;
			y = 0.70;
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