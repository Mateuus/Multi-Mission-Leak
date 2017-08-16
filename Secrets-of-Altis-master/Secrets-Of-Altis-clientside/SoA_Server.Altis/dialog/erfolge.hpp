class erfolge {

	idd = 2800;
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
		};
		
		class title: Life_RscText
		{
			idc = 2805;
			text = "Erfolge und Tugenden";
			//style = 2;
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class appIcon: Life_RscPicture
		{
			idc = -1;
			text = "images\tablet\apps\achievement.paa";
			x = -0.05;
			y = -0.04;
			w = 0.2125;
			h = 0.28;
			colorText[] = {1,1,1,0};
		};
	};
	
	class controls
	{

		class Life_erfolge : Life_RscListbox
		{
			idc = 2802;
			sizeEx = 0.045;
			colorText[] = {1,1,1,0.2};
			color[] = {0,0,0,1};
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
			text = "";
			rowHeight = 0.085;
			x = 0.0125;
			y = 0.18;
			w = 0.975;
			h = 0.74;
		};
		
		class erfolgebutton: Life_RscButtonMenu
		{
			idc = 2803;
			text = "Mehr Infos";
			OnButtonClick = "[1] call life_fnc_erfolgeinfo";
			style = 2;
			x = 0.8375;
			y = 0.92;
			w = 0.15;
			h = 0.04;
			colorText[] = {0.5,0,0,1};
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


class erfolgebig {

	idd = 2830;
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
		
		class title: Life_RscText
		{
			idc = 2833;
			sizeEx = 0.075;
			style = 2;
			text = "";
			x = 0.3875;
			y = 0.16;
			w = 0.525;
			h = 0.18;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0};
		};

		class Text: Life_RscText
		{
			idc = 2831;
			sizeEx = 0.045;
			style = 2;
			text = "";
			x = 0.0375;
			y = 0.5;
			w = 0.925;
			h = 0.18;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class icon: Life_RscPicture
		{
			idc = 2832;
			text = "";
			x = 0.125;
			y = 0.12;
			w = 0.175;
			h = 0.24;
		};

		class appIcon: Life_RscPicture
		{
			idc = -1;
			text = "images\tablet\apps\achievement.paa";
			x = 0.8125;
			y = 0.72;
			w = 0.2125;
			h = 0.28;
			colorText[] = {1,1,1,0};
		};

		class bordertext: life_RscFrame
		{
			idc = -1;
			x = 0.0249988;
			y = 0.48;
			w = 0.95;
			h = 0.22;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class borderpic: life_RscFrame
		{
			idc = -1;
			x = 0.1125;
			y = 0.1;
			w = 0.2;
			h = 0.28;
			colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls {
		
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