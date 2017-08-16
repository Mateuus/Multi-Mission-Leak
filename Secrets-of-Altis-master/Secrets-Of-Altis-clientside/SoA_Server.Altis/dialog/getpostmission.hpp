class getpostmission {

	idd = 640;
	movingEnable = 0;
	EnableSimulation = 1;
	OnLoad = "[] spawn life_fnc_getauktionen";
	
	class controlsBackground {

		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.4,0.4,0,1)";
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
			text = "Altis Post AG";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.08;
			colorBackground[] = {1,1,1,0.5};
		};

		class beschreibung: Life_RscStructuredText
		{
			idc = -1;
			sizeEx = 0.03;
			size = 0.03;
			text = "Für einen Paketlieferauftrag benötigst du einen Altis Postwagen. Anschließend werden dir 3 Briefkästen auf ganz Altis zugetragen, an denen du Pakete abliefern musst. Du hast 45 Minuten Zeit die Pakete auszuliefern, je knapper die Zeit, desto weniger Geld erhältst du im Nachhinein.";
			x = 0.0125;
			y = 0.76;
			w = 0.975;
			h = 0.14;
			colorBackground[] = {0,0,0,0.5};
		};

		class liztitle: Life_RscText
		{
			idc = -1;
			text = "Aktuelle Auktionen";
			x = 0.0125;
			y = 0.12;
			w = 0.975;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};

		class infotitle: Life_RscText
		{
			idc = -1;
			text = "Paketlieferaufträge";
			x = 0.0125;
			y = 0.7;
			w = 0.975;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
	};
	
	class controls {

		class auktionbox: Life_RscListNbox
		{
			idc = 641;
			idcLeft = -1;
			idcRight = -1;
			text = "";
			sizeEx = 0.033;
			x = 0.0125;
			y = 0.18;
			w = 0.975;
			h = 0.46;
			colorBackground[] = {0,0,0,0.7};
			columns[] = {0,0.20,0.42,0.57,0.77};
			drawSideArrows = false;
			rowHeight = 0.038;
			colorSelectBackground[] = {0.5,0.5,0.5,0.2};
			colorSelectBackground2[] = {0.5,0.5,0.5,0.1};
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
			//period = 3;
		};

		class auftragbutton: Life_RscButtonMenu
		{
			idc = -1;
			text = "Auftrag annehmen";
			OnButtonClick = "[] spawn life_fnc_getPostMission";
			x = 0.0125;
			y = 0.92;
			w = 0.325;
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