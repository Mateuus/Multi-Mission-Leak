class guthaben {
	
	idd = 3600;
	movingEnable = false;
	enableSimulation = true;


	class controlsBackground {

		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.5,0.2,0.7,1)";
			x = -0.0875;
			y = 0;
			w = 1.175;
			h = 1;
		};

		class Life_RscPicture_1200: Life_RscPicture
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

		class Text: Life_RscText
		{
			idc = -1;
			text = "Handy-Guthaben erhältst du in jedem Elektroladen deiner Wahl!";
			x = 0.0125;
			y = 0.12;
			w = 0.7125;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};

		class title: Life_RscText
		{
			idc = -1;
			text = "Altis-Talk";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class backgroundmiddle: Life_RscText
		{
			idc = -1;
			x = 0.3;
			y = 0.44;
			w = 0.425;
			h = 0.18;
			colorBackground[] = {0,0,0,0.5};
		};
				
		class versandinfo: Life_RscStructuredText
		{
			idc = -1;
			size = 0.025;
			text = "Die vollständigen Preis- und wichtigen Vertragsbestandteile erscheinen, wenn Sie mit ihr monatliches Abonnement abgeschlossen haben.  Alle Preise verstehen sich inklusive 19 % Umsatzsteuer. Für das Versenden von Geräten fallen Versandkosten in Höhe von ca. 1.000€ an. Bei Zahlung per Nachnahme übernimmt Altis-Talk nicht die zusätzlich anfallende Nachnahmegebühr in Höhe von 200.000€. Der Versand erfolgt in einer umweltfreundlichen Verpackung.";
			x = 0.0124999;
			y = 0.82;
			w = 0.975;
			h = 0.16;
			colorBackground[] = {0,0,0,0.3};
		};
	};
	
	class controls {

		class guthabentitle: Life_RscText
		{
			idc = 3601;
			text = "";
			x = 0.325;
			y = 0.48;
			w = 0.375;
			h = 0.04;
			colorBackground[] = {0.3,1,0,0.5};
		};

		/*class loadupbutton: Life_RscButtonMenu
		{
			idc = -1;
			text = "Guthaben aufladen";
			OnButtonClick = "[1] spawn life_fnc_guthaben;";
			x = 0.3875;
			y = 0.56;
			w = 0.25;
			h = 0.04;
		};*/
		
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
			OnButtonClick = "[] spawn {_handle = [] spawn life_fnc_closedialog; WaitUntil{scriptDone _handle} [] call life_fnc_inventory}";
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
