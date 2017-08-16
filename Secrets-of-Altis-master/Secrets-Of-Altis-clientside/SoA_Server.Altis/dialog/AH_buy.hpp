class Auktionshaus {

	idd = 15100;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {

		class background: Life_RscText
		{
			idc = -1;
			x = 0.195781 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.603281 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class maintitle: Life_RscText
		{
			idc = -1;
			text = "Altis Post GmbH - Auktionshaus"; 
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.592969 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class topbar: Life_RscText
		{
			idc = -1;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.510469 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};

		class sidebar: Life_RscText
		{
			idc = -1;
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.429 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};

		class frame: Life_RscFrame
		{
			idc = -1;
			x = 0.195781 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.603281 * safezoneW;
			h = 0.506 * safezoneH;
			colorText[] = {1,0,0,1};
		};

		class titleitem: Life_RscText
		{
			idc = -1;
			text = "Ware"; 
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};

		class mengetitle: Life_RscText
		{
			idc = -1;
			text = "Menge"; 
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};

		class seltenheittitle: Life_RscText
		{
			idc = -1;
			text = "Seltenheit"; 
			x = 0.613438 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};

		class preistitle: Life_RscText
		{
			idc = -1;
			text = "Sofortkaufpreis"; 
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};

		class verkaufertitle: Life_RscText
		{
			idc = -1;
			text = "Eingestellt von";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
		};

		class refreshicon: Life_RscPicture
		{
			idc = -1;
			text = "icons\refresh.paa";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};

	class Controls {

		class warelistbox: Life_RscListNbox
		{
			idc = 15101;
			idcLeft = -1;
			idcRight = -1;
			onLBSelChanged = "[] call life_fnc_CAH_checkStorno;";
			text = "";
			sizeEx = 0.033;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.396 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			columns[] = {0,0.31,0.515,0.64,0.8};
			drawSideArrows = false;
			rowHeight = 0.038;
			colorSelectBackground[] = {0.5,0.5,0.5,0.2};
			colorSelectBackground2[] = {0.5,0.5,0.5,0.1};
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
		};

		class btnsofortkauf: Life_RscButtonMenu
		{
			idc = 15015;
			text = "Sofortkauf";
			onButtonClick = "[] spawn life_fnc_CAH_Buy;";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class btnEinstellen: Life_RscButtonMenu
		{
			idc = 15016;
			text = "Gegenstand einstellen";
			onButtonClick = "[] spawn life_fnc_CAH_loadInventory;";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class refreshbtn: Life_RscButtonMenu
		{
			idc = -1;
			tooltip = "Aktualisieren";
			onButtonClick = "[] spawn life_fnc_CAH_loadOffers;";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};

		class btnclose: Life_RscButtonMenu
		{
			idc = 15017;
			text = "Verlassen";
			onButtonClick = "closedialog 0";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};

