class protocol {
	
	idd = 4900;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[0] spawn life_fnc_protocolinfo";
	
	class controlsBackground {
		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
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

		class list: Life_RscListbox
		{
			idc = 4901;
			text = "";
			sizeEx = 0.0325;
			OnLBSelChanged = "[1] call life_fnc_protocolinfo";
			x = 0;
			y = 0.02;
			w = 0.3625;
			h = 0.94;
		};
		
		class activitytext: Life_RscText
		{
			idc = 4902;
			text = "Aktivitätspunkte 10 / 50";
			x = 0.375;
			y = 0.02;
			w = 0.2375;
			h = 0.08;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class activityinfo: Life_RscStructuredText
		{
			idc = 4903;
			text = "";
			x = 0.375;
			y = 0.12;
			w = 0.625;
			h = 0.74;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class rang: Life_RscText
		{
			idc = 4904;
			text = "Rang: Polizeihauptkommissar (8)";
			x = 0.625;
			y = 0.02;
			w = 0.375;
			h = 0.08;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class befordernbutton: Life_RscButtonMenu
		{
			idc = 4905;
			text = "Befördern";
			OnButtonClick = "";
			x = 0.8375;
			y = 0.9;
			w = 0.1625;
			h = 0.06;
		};
		
		class degradebutton: Life_RscButtonMenu
		{
			idc = 4906;
			text = "Degradieren";
			OnButtonClick = "";
			x = 0.6;
			y = 0.9;
			w = 0.2125;
			h = 0.06;
		};
		
		class suspendbutton: Life_RscButtonMenu
		{
			idc = 4907;
			text = "Suspendieren";
			OnButtonClick = "";
			x = 0.375;
			y = 0.9;
			w = 0.2;
			h = 0.06;
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