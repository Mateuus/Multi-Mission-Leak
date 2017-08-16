class life_wantedadd2 {
	
	idd = 9900;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_wantedAdd2;";
	
	class controlsBackground {
		
		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.1,0.1,0.1,1)";
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
			text = "Fahndungsliste";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class persontitle: Life_RscText
		{
			idc = -1;
			text = "Personenliste";
			x = 0.0125;
			y = 0.14;
			w = 0.275;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
		class aktetitle: Life_RscText
		{
			idc = -1;
			text = "Liste der Delikte";
			x = 0.3125;
			y = 0.14;
			w = 0.675;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
	};
	
	class controls {
		
		class personenliste: Life_RscListBox 
		{
			idc = 9902;
			text = "";
			sizeEx = 0.032;
			//onLBSelChanged = "[_this] spawn life_fnc_adminQuery";
			
			x = 0.0125;
			y = 0.2;
			w = 0.275;
			h = 0.72;
		};
		

        class delikteliste: Life_RscListBox
        {
            idc = 9991;
			text = "";
			sizeEx = 0.04;
			x = 0.3125;
			y = 0.2;
			w = 0.675;
			h = 0.66;
			colorBackground[] = {0,0,0,0.5};
        };

		class hinzufuegen: Life_RscButtonMenu 
		{
			idc = -1;
			text = "Person zur Fahndung ausrufen";
			onButtonClick = "[] call life_fnc_wanted2;";
			x = 0.6;
			y = 0.88;
			w = 0.3875;
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
			OnButtonClick = "[1] spawn life_fnc_closedialog;";
			tooltip = "Inventar";
			x = 0.386364;
			y = 1.02357;
			w = 0.05;
			h = 0.06;
		};		
	};
};