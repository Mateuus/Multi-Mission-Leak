class altismaps {
	
	idd = 3800;
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		
		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.15,0.55,0.85,1)";
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
			text = "AltisMaps©";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};

		class titlelist: Life_RscText
		{
			idc = -1;
			text = "Interessante Orte";
			x = 0.0125;
			y = 0.14;
			w = 0.25;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
	};
	
	class controls {
		
		class mapview: Life_RscMapControl
		{
			idc = 3801;
			x = 0.275;
			y = 0.14;
			w = 0.7125;
			h = 0.84;
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};
		
		class listbox: Life_RscListbox
		{
			idc = 3802;
			sizeEx = 0.032;
			OnLBSelChanged = "[((findDisplay 3800) displayCtrl 3801),1,0.07,getMarkerPos (lbData[3802,(lbCurSel 3802)])] call life_fnc_setMapPosition;";
			x = 0.0125;
			y = 0.2;
			w = 0.25;
			h = 0.78;
			colorBackground[] = {0,0,0,0.4};
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