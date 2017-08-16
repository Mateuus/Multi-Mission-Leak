class DWEV_markt_menu {
	idd = 4000;
	name= "DWEV_markt_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; [] spawn DWEV_fnc_marktMenu;";
	
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
		class name_Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 3103;
			text = "Altis Börsenauskunft";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
		
		class ItemList_Market : DWEV_RscListBox 
		{
			idc = 4002;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn DWEV_fnc_marktQuery";
			x = 0.2;
			y = 0.26;
			w = 0.35;
			h = 0.4;
		};
		
		class ItemInfo : DWEV_RscStructuredText
		{
			idc = 4003;
			text = "";
			x = 0.55;
			y = 0.25;
			w = 0.30;
			h = 0.6;
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