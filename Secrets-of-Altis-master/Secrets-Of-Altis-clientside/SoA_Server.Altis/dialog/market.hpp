class marketView
{
	idd = 39500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		
		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.1,0.3,0.5,1)";
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
			text = "Online Banking";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class background_fin: Life_RscText
		{
			idc = -1;
			x = 0.0125;
			y = 0.24;
			w = 0.625;
			h = 0.14;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class banktitle: Life_RscText
		{
			idc = -1;
			text = "Bankkonto:";
			x = 0.025;
			y = 0.26;
			w = 0.1375;
			h = 0.04;
		};
		
		class bartitle: Life_RscText
		{
			idc = -1;
			text = "Bargeld:";
			x = 0.025;
			y = 0.32;
			w = 0.1375;
			h = 0.04;
		};
		
		class backgroundkurse: Life_RscText
		{
			idc = -1;
			x = 0.0125;
			y = 0.52;
			w = 0.625;
			h = 0.46;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class fintitle: Life_RscText
		{
			idc = -1;
			text = "Finanzen";
			x = 0.0125;
			y = 0.18;
			w = 0.625;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class kursetitle: Life_RscText
		{
			idc = -1;
			text = "Börsenkurse";
			x = 0.0125;
			y = 0.46;
			w = 0.625;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class listboxtitle: Life_RscText
		{
			idc = -1;
			text = "Börsenbestände";
			x = 0.6625;
			y = 0.18;
			w = 0.325;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};

		class frameentw: Life_RscFrame
		{
			idc = -1;
			x = 0.025;
			y = 0.7;
			w = 0.6;
			h = 0.26;
		};
		
		class lblResourceName: Life_RscText
		{
			idc = 1000;
			text = "";
			style = 2;
			x = 0.15;
			y = 0.56;
			w = 0.35;
			h = 0.04;
			sizeEx = 0.05;
		};

		class lblResourcePrice: Life_RscText
		{
			idc = 1001;
			text = "";
			style = 2;
			x = 0.225;
			y = 0.62;
			w = 0.2125;
			h = 0.04;
			colorText[] = {0,1,0,1};
			sizeEx = 0.04;
		};

		class Life_RscStructuredText_1101: Life_RscText
		{
			idc = 1101;
			text = "Entwicklung";
			sizeEx = 0.045;
			style = 2;
			x = 0.175;
			y = 0.72;
			w = 0.3;
			h = 0.06;
		};
		
		class picTrendGlobal: Life_RscPicture
		{
			idc = 1200;
			text = "";
			x = 0.2875;
			y = 0.8;
			w = 0.05;
			h = 0.08;
		};
		
		class picTrendLocal: Life_RscPicture
		{
			idc = 1201;
			text = "";
			x = 0.2875;
			y = 0.88;
			w = 0.05;
			h = 0.08;
		};
		
		class Life_RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Langfristig";
			x = 0.02575;
			y = 0.82;
			w = 0.1375;
			h = 0.04;
			sizeEx = 0.04;
		};
		class Life_RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Kurzfristig";
			x = 0.02575;
			y = 0.9;
			w = 0.1375;
			h = 0.04;
			sizeEx = 0.04;
		};
		class lblTrendGlobal: Life_RscText
		{
			idc = 1004;
			text = "";
			x = 0.375;
			y = 0.82;
			w = 0.225;
			h = 0.04;
		};
		class lblTrendLocal: Life_RscText
		{
			idc = 1005;
			text = "";
			x = 0.375;
			y = 0.9;
			w = 0.225;
			h = 0.04;
		};
	};
	
	class controls
	{
		
		class banknr: Life_RscText
		{
			idc = 1006;
			text = "";
			x = 0.3625;
			y = 0.26;
			w = 0.2375;
			h = 0.04;
		};
		
		class barnr: Life_RscText
		{
			idc = 1007;
			text = "";
			x = 0.3625;
			y = 0.32;
			w = 0.2375;
			h = 0.04;
		};
		
		class listResources: Life_RscListbox
		{
			idc = 1500;
			x = 0.6625;
			y = 0.24;
			w = 0.325;
			h = 0.74;
			sizeEx = 0.032;
			onLBSelChanged = "[] spawn life_fnc_refreshMarketView";
		};
		
		class geldgebenbutton: Life_RscButtonMenu
		{
			idc = 1008;
			text = "Geld Übergeben";
			OnButtonClick = "[] call life_fnc_giveMoney";
			x = 0.4375;
			y = 0.4;
			w = 0.2;
			h = 0.04;
		};
		
		class playerlist: Life_RscCombo
		{
			idc = 1009;
			x = 0.0125;
			y = 0.4;
			w = 0.2375;
			h = 0.04;
		};
		
		class geldfeld: Life_RscEdit
		{
			idc = 1010;
			text = "";
			x = 0.2625;
			y = 0.4;
			w = 0.1625;
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

