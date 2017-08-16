class life_hilfe
{
	idd = 989898;
	movingEnable = true;
	enableSimulation = true;

	class controlsBackground
	{
		
		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0.3,0,1)";
			x = -0.0875;
			y = 0;
			w = 1.175;
			h = 1;
		};
		
		class Tablet: Life_RscPicture
		{
			idc = -1;
			text = "images\tablet\tablet.paa";
			x = -0.4125;
			y = -0.16;
			w = 1.825;
			h = 1.32;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.4};
		};
		
		class maintitle: Life_RscText
		{
			idc = -1;
			text = "Hilfe und Tutorialguide";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};

		class Title : life_RscTitle
		{
			idc = 1616;
			text = "Wichtig!";
			colorBackground[] = {1,1,1,0.5};
			colorText[] = {1,1,1,1};
			sizeEx =  0.045;		
			x = 0.325;
			y = 0.16;
			w = 0.6625;
			h = 0.06;
		};
	};
	
	class controls
	{
		class Content: life_RscStructuredText
		{
			idc = 2400;
			sizeEx = 0.035;
			size = 0.035;
			colorBackground[] = {0,0,0,0.5};
			text = "<t color='#ffffff'>Menügröße 'Klein' für richtige Darstellung vorausgesetzt! (Konfigurieren -> Grafik -> Anzeige)</t>";
			x = 0.325;
			y = 0.24;
			w = 0.6625;
			h = 0.72;
		};
		
		class SelContent: life_RscListBox
		{
			idc = 1500;
			onLBSelChanged = "[] call life_fnc_hilfe;";
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.032;
			rowHeight = 0.05;
			x = 0.0125;
			y = 0.16;
			w = 0.3;
			h = 0.8;
		};
		
		class ButtonCancel: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "closedialog 0; closedialog 0;";
			tooltip = "Schließen";
			x = 0.464646;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class ButtonReturn: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "closedialog 0;";
			tooltip = "Zurück";
			x = 0.54798;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class ButtonOhrstoepsel: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "[] spawn life_fnc_fadeSound;";
			tooltip = "Ohrstöpsel verwenden";
			x = 0.616162;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class ButtonHome: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "[0] spawn life_fnc_closedialog;";
			tooltip = "Home";
			x = 0.311364;
			y = 1.02674;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class ButtonInventory: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "[] call life_fnc_inventory;";
			tooltip = "Inventar";
			x = 0.386364;
			y = 1.02357;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
	};
};