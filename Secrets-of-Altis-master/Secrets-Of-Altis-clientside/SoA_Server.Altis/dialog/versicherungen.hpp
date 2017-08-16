class versicherungen {

	idd = 5100;
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {

		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.05,0.05,0.08,1)";
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
			text = "EGO-Versicherungen";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.08;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class versicherunganzeigeframe: Life_RscFrame
		{
			idc = -1;
			x = 0.3875;
			y = 0.24;
			w = 0.5625;
			h = 0.12;
		};
	};
	
	class controls {

		class listbox: Life_RscListbox
		{
			idc = 5101;
			text = "";
			sizeEx = 0.035;
			size = 0.035;
			OnLBSelChanged = "[1] call life_fnc_versicherung";
			x = 0.0125;
			y = 0.12;
			w = 0.325;
			h = 0.84;
		};

		class teilkaskotext: Life_RscStructuredText
		{
			idc = 5102;
			text = "";
			sizeEx = 0.034;
			size = 0.034;
			x = 0.35;
			y = 0.5;
			w = 0.3125;
			h = 0.34;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class vollkaskotext: Life_RscStructuredText
		{
			idc = 5103;
			text = "";
			sizeEx = 0.034;
			size = 0.034;
			x = 0.675;
			y = 0.5;
			w = 0.3125;
			h = 0.34;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class teilkaskobutton: Life_RscButtonMenu
		{
			idc = 5104;
			text = "Teilkasko";
			OnButtonClick = "[2,'teilkasko'] call life_fnc_versicherung";
			x = 0.35;
			y = 0.86;
			w = 0.3125;
			h = 0.1;
		};
		
		class vollkaskobutton: Life_RscButtonMenu
		{
			idc = 5105;
			text = "Vollkasko";
			OnButtonClick = "[2,'vollkasko'] call life_fnc_versicherung";
			x = 0.675;
			y = 0.86;
			w = 0.3125;
			h = 0.1;
		};
		
		class versichertanzeige: Life_RscText
		{
			idc = 5106;
			style = 2;
			sizeEx = 0.04;
			text = "";
			x = 0.4;
			y = 0.26;
			w = 0.5375;
			h = 0.08;
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