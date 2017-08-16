class life_wanted_menu {
	idd = 2400;
	movingEnable = false;
	enableSimulation = true;
	
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
			idc = 2406;
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
			w = 0.3125;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class aktetitle: Life_RscText
		{
			idc = -1;
			text = "Akte zur Person";
			x = 0.35;
			y = 0.14;
			w = 0.6375;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
	};
	
	class controls {
		
		class WantedConnection : Life_RscText 
		{
			idc = 2404;
			text = "";
			x = 0.75;
			y = 0.02;
			w = 0.2375;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class WantedList : Life_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.032;
			size = 0.032;
			onLBSelChanged = "[] call life_fnc_wantedInfo";
			x = 0.0125;
			y = 0.2;
			w = 0.3125;
			h = 0.72;
		};
		
		class WantedDetails : Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.032;
			size = 0.032;
			x = 0.35;
			y = 0.28;
			w = 0.6375;
			h = 0.58;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class BountyPrice : Life_RscText
		{
			idc = 2403;
			text = "";
			sizeEx = 0.04;
			x = 0.35;
			y = 0.2;
			w = 0.6375;
			h = 0.08;
		};
		
		class PardonButtonKey : Life_RscButtonMenu {
			idc = 2405;
			text = "Person erlassen";
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";
			x = 0.775;
			y = 0.88;
			w = 0.2125;
			h = 0.04;
		};
		
		class fahndungplus: Life_RscButtonMenu
		{
			idc = -1;
			text = "Person zur Fahndung ausrufen";
			OnButtonClick = "createdialog 'life_wantedadd2'";
			x = 0.35;
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