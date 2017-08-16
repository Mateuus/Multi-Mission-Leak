class inventory {

	idd = 3200;
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {

		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.3,0.1,0.1,1)";
			x = -0.0875;
			y = 0;
			w = 1.175;
			h = 1;
		};
	
		class tablet: Life_RscPicture
		{
			idc = -1;
			text = "images\tablet\tablet.paa";
			x = -0.4125;
			y = -0.16;
			w = 1.825;
			h = 1.32;
		};
			
		class title:  Life_RscText
		{
			idc = -1;
			text = "Inventar";
			x = 0.0125;
			y = 0.02;
			w = 0.65;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class backgroundbottom: RscText
		{
			idc = -1;
			x = 0.0125;
			y = 0.88;
			w = 0.975;
			h = 0.08;
			colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls {
		
		class weight: Life_RscText
		{
			idc = 3207;
			text = "";
			x = 0.675;
			y = 0.02;
			w = 0.3125;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
				
		class Inventory: Life_RscListbox
		{
			idc = 3201;
			sizeEx = 0.04;
			onMouseButtonDblClick = "[] call life_fnc_useItem;";
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
			text = "";
			rowHeight = 0.085;
			x = 0.0125;
			y = 0.1;
			w = 0.975;
			h = 0.74;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class buttondel: Life_RscButtonMenu
		{
			idc = 3202;
			text = "Entfernen";
			onButtonClick = "[] call life_fnc_removeItem;";
			x = 0.3875;
			y = 0.9;
			w = 0.1375;
			h = 0.04;
		};

		/*class buttonuse: Life_RscButtonMenu
		{
			idc = 3203;
			text = "Benutzen";
			onButtonClick = "[] call life_fnc_useItem;";
			x = 0.85;
			y = 0.9;
			w = 0.125;
			h = 0.04;
		};*/

		class combolist: Life_RscCombo
		{
			idc = 3204;
			x = 0.025;
			y = 0.9;
			w = 0.2625;
			h = 0.04;
		};

		class buttongive: Life_RscButtonMenu
		{
			idc = 3205;
			text = "Vergeben";
			onButtonClick = "[] call life_fnc_giveItem;";
			x = 0.55;
			y = 0.9;
			w = 0.1375;
			h = 0.04;
		};

		class itemedit: Life_RscEdit
		{
			idc = 3206;
			sizeEx = 0.032;
			text = "1";
			x = 0.3125;
			y = 0.9;
			w = 0.05;
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
	};
};
