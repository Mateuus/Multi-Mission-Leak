class Life_craft {
	
	idd = 666;
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn life_fnc_craft";
	
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
	};

	class controls {

		class mainTitle : Life_RscTitle {
			idc = -1;
			text = "WeCraft";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class titlemenge: Life_RscText
		{
			idc = -1;
			text = "Menge";
			x = 0.3125;
			y = 0.88;
			w = 0.0875;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};

		class craftListHeader : Life_RscCombo
		{
			idc = 673;
			onLBSelChanged  = "[] call life_fnc_craft_updateFilter";
			text = "";
			sizeEx = 0.032;
			x = 0.0125;
			y = 0.14;
			w = 0.2875;
			h = 0.04;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {1,1,1,1};
		};
		
		class mengenfield: Life_RscEdit
		{
			idc = 665;
			text = "1";
			x = 0.4;
			y = 0.88;
			w = 0.2;
			h = 0.04;
		};

		class craftList : life_RscListBox
		{
			idc = 669;
			sizeEx = 0.032;
			onLBSelChanged = "[] spawn life_fnc_craft_update";
			x = 0.0125;
			y = 0.2;
			w = 0.2875;
			h = 0.76;
			colorBackground[] = {0,0,0,0.5};
		};

		class materialListHeader : Life_RscText
		{
			idc = 670;
			text = "Benötigte Gegenstände";
			sizeEx = 0.04;
			x = 0.3125;
			y = 0.22;
			w = 0.675;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};

		class materialList : Life_RscControlsGroup
		{
			idc = 671;
			x = 0.3125;
			y = 0.28;
			w = 0.675;
			h = 0.54;
			colorBackground[] = {0,0,0,0.5};

			class Controls
			{
				class mats : Life_RscStructuredText
				{
					idc = 672;
					sizeEx = 0.032;
					text = "";
					x = 0;
					y = 0;
					w = 0.675; 
					h = 0.54;
					colorBackground[] = {0,0,0,0.5};
				};
			};
		};

		class ButtonCraft : Life_RscButtonMenu {
			idc = 674;
			text = "Auswahl drucken";
			onButtonClick = "if(!life_is_processing) then {[] spawn life_fnc_craftAction} else {hint 'Du stellst schon etwas her!'}";
			x = 0.65;
			y = 0.88;
			w = 0.3375;
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