class Life_key_management {
	idd = 2700;
	name= "life_key_chain";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_keyMenu;";
	
	class controlsBackground {

		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.4,0.15,0.025,1)";
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

		class keystitle: Life_RscText
		{
			idc = -1;
			text = "Schlüssel-Management24";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class vehicletitle: Life_RscText
		{
			idc = -1;
			text = "Fahrzeuge";
			x = 0.0125;
			y = 0.14;
			w = 0.4625;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};

		class haustitle: Life_RscText
		{
			idc = -1;
			text = "Immobilien";
			x = 0.525;
			y = 0.14;
			w = 0.4625;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};

		class entfernung: Life_RscText
		{
			idc = 2706;
			text = "Entfernung: 200m";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls {
	
		class vehiclelist: Life_RscListbox
		{
			idc = 2701;
			sizeEx = 0.032;
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
			OnLBSelChanged = "['vehicle'] call life_fnc_keyRange";
			text = "";
			rowHeight = 0.05;
			x = 0.0125;
			y = 0.2;
			w = 0.4625;
			h = 0.66;
		};
		
		class immolist: Life_RscListbox
		{
			idc = 2705;
			sizeEx = 0.032;
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
			OnLBSelChanged = "['house'] call life_fnc_keyRange";
			text = "";
			rowHeight = 0.05;
			x = 0.525;
			y = 0.2;
			w = 0.4625;
			h = 0.66;
		};
		
		class fahrzeuggeben: Life_RscButtonMenu
		{
			idc = 2703;
			text = "Fahrzeugschlüssel vergeben";
			onButtonClick = "[0] call life_fnc_keyGive";
			x = 0.0125;
			y = 0.94;
			w = 0.4625;
			h = 0.04;
		};
		
		class hausgeben: Life_RscButtonMenu
		{
			idc = 2704;
			text = "Hausschlüssel vergeben";
			onButtonClick = "[1] call life_fnc_keyGive";
			x = 0.525;
			y = 0.94;
			w = 0.4625;
			h = 0.04;
		};
		
		class wegwerfen: Life_RscButtonMenu
		{
			idc = -1;
			text = "Schlüssel wegwerfen";
			onButtonClick = "[] spawn life_fnc_keyDrop";
			x = 0.0125;
			y = 0.88;
			w = 0.275;
			h = 0.04;
		};

		class playersel: Life_RscCombo
		{
			idc = 2702;
			text = "";
			x = 0.525;
			y = 0.88;
			w = 0.4625;
			h = 0.04;
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