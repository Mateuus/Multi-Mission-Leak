class appstore {

	idd = 3300;
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {

		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.5,0.4,0.2,1)";
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
				
		class appstoretitle: Life_RscText
		{
			idc = -1;
			text = "Appstore";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class descriptiontitle: Life_RscText
		{
			idc = -1;
			text = "Informationen";
			x = 0.5625;
			y = 0.14;
			w = 0.425;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
	};
	
	class controls {
		
		class applist: Life_RscListbox
		{
			idc = 3301;
			sizeEx = 0.04;
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
			text = "";
			rowHeight = 0.085;
			x = 0.0125;
			y = 0.0999999;
			w = 0.45;
			h = 0.76;
		};

		class preis: Life_RscText
		{
			idc = 3302;
			text = "Preis:";
			x = 0.0125;
			y = 0.88;
			w = 0.45;
			h = 0.06;
			colorBackground[] = {0,0,0,0.5};
		};

		class buy: Life_RscButtonMenu
		{
			idc = 3303;
			text = "Kaufen";
			OnButtonClick = "[1] spawn life_fnc_appstore;";
			x = 0.85;
			y = 0.88;
			w = 0.1375;
			h = 0.06;
		};

		class deinstall: Life_RscButtonMenu
		{
			idc = 3305;
			text = "Deinstallieren";
			OnButtonClick = "[2] spawn life_fnc_appstore;";
			x = 0.5625;
			y = 0.88;
			w = 0.2375;
			h = 0.06;
		};
		
		class descriptiontext: Life_RscStructuredText
		{
			idc = 3304;
			text = "";
			x = 0.5625;
			y = 0.2;
			w = 0.425;
			h = 0.66;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class download: Life_RscText
		{
			idc = 3306;
			text = "";
			x = 0.5625;
			y = 0.02;
			w = 0.425;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
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
		
		class ButtonReturn: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "closedialog 0;";
			tooltip = "Zurück";
			x = 0.54798;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonOhrstoepsel: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[] spawn life_fnc_fadeSound;";
			tooltip = "Ohrstöpsel verwenden";
			x = 0.616162;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonHome: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[0] spawn life_fnc_closedialog;";
			tooltip = "Home";
			x = 0.311364;
			y = 1.02674;
			w = 0.05;
			h = 0.06;
		};
	
		class ButtonInventory: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[] call life_fnc_inventory;";
			tooltip = "Inventar";
			x = 0.386364;
			y = 1.02357;
			w = 0.05;
			h = 0.06;
		};
	};
};