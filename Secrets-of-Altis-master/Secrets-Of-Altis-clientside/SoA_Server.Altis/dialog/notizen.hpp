class notizen {
	
	idd = 6200;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[0] spawn life_fnc_notizen";

	class controlsBackground {

		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.15,0.1,0.15,1)";
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

		class notizbackground: Life_RscPicture
		{
			idc = -1;
			text = "images\tablet\notizblock.paa";
			x = 0.15;
			y = 0.06;
			w = 0.6625;
			h = 0.76;
			colorText[] = {1,1,1,0.5};
		};

		class texttitle: Life_RscText
		{
			idc = -1;
			text = "Notiz";
			x = 0.0125;
			y = 0.86;
			w = 0.7375;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
	};
	
	class controls {

		class textfield: Life_RscEdit
		{
			idc = 6201;
			text = "";
			x = 0.0125;
			y = 0.92;
			w = 0.7375;
			h = 0.04;
		};
		
		class notizlistctrl: Life_RscControlsGroup
		{
			idc = 6203;
			size = 0.037;
			sizeEx = 0.037;
			x = 0.2625;
			y = 0.2;
			w = 0.475;
			h = 0.56;
			class controls
			{
				class notizlist: Life_RscStructuredText
				{
					idc = 6202;
					size = 0.037;
					sizeEx = 0.037;
					x = 0;
					y = 0;
					w = 0.475;
					h = 1.12;
				};
			};
		};

		class absendebutton: Life_RscButtonMenu
		{
			idc = 6204;
			text = "Notiz eintragen";
			OnButtonClick = "[1] call life_fnc_notizen";
			x = 0.7875;
			y = 0.92;
			w = 0.2;
			h = 0.04;
		};

		class deletebutton: Life_RscButtonMenu
		{
			idc = 6205;
			text = "Notizen löschen";
			OnButtonClick = "[2] call life_fnc_notizen";
			x = 0.0125;
			y = 0.8;
			w = 0.2125;
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
			OnButtonClick = "[] call life_fnc_inventory;";
			tooltip = "Inventar";
			x = 0.386364;
			y = 1.02357;
			w = 0.05;
			h = 0.06;
		};
	};
};