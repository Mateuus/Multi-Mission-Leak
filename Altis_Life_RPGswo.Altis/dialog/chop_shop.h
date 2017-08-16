class Chop_Shop
{
	idd = 39400;
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
		
		class Shopname_Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Fahrzeugschieber";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
		
		class priceInfo : DWEV_RscStructuredText
		{
			idc = 39401;
			text = "";
			sizeEx = 0.035;
			x = 0.34;
			y = 0.64;
			w = 0.2;
			h = 0.2;
		};
	};
	
	class controls
	{
		class vehicleList : DWEV_RscListBox
		{
			idc = 39402;
			onLBSelChanged = "_this call DWEV_fnc_chopShopSelection";
			sizeEx = 0.04;
			colorBackground[] = {0, 0, 0, 0};
			x = 0.35;
			y = 0.25;
			w = 0.3;
			h = 0.38;
		};
		
		class ctrl_grafik_Verkaufen: DWEV_RscPicture
		{
			idc = 507007;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_carVK.paa";
			x = 0.4625;
			y = 0.70;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_Verkaufen: DWEV_RscButtonInvisible
		{
			idc = 507008;
			text = "";
			tooltip = "Fahrzeug verkaufen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] spawn DWEV_fnc_chopShopSell;";
			x = 0.4625;
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