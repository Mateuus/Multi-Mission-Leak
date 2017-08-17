class taxi_rechnung {
	idd = 6500;
	name = "taxi_rechnung";
	movingEnabled = 0;
	enableSimulation = 0;
	class controlsBackground {
		class hg_o: Life_RscText
		{
			idc = -1;

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,0,0.75};
		};
		class hg: Life_RscText
		{
			idc = -1;

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.3394 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.2002 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class hg_u: Life_RscText
		{
			idc = -1;

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,0,0.75};
		};
		class hg_kosten: Life_RscText
		{
			idc = -1;

			x = 0.519595 * safezoneW + safezoneX;
			y = 0.3746 * safezoneH + safezoneY;
			w = 0.121687 * safezoneW;
			h = 0.132 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.75};
		};
		class tKosten: Life_RscText
		{
			idc = -1;

			text = "Cost summary"; //--- ToDo: Localize;
			x = 0.519595 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.121687 * safezoneW;
			h = 0.0242 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
		};
		class tlb: Life_RscText
		{
			idc = -1;

			text = "List of riders"; //--- ToDo: Localize;
			x = 0.357688 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.0242 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
		};
	};
	class controls {
		class lb: Life_RscListbox
		{
			idc = 6501;
			sizeEx = 0.034;
			x = 0.357688 * safezoneW + safezoneX;
			y = 0.3746 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class anzeige_kosten: Life_RscStructuredText
		{
			idc = 6502;
			sizeEx = 0.025;
			x = 0.519595 * safezoneW + safezoneX;
			y = 0.3746 * safezoneH + safezoneY;
			w = 0.121687 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class kn_schliessen: Life_RscButtonMenu
		{
			idc = -1;

			text = "CONCLUDE"; //--- ToDo: Localize;
			x = 0.357687 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Do not issue an invoice";
			onButtonClick = "closeDialog 0;";
		};
		class kn_austellen: Life_RscButtonMenu
		{
			idc = -1;

			text = "EXHIBIT"; //--- ToDo: Localize;
			x = 0.554657 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "taxi_rechnung spawn fvs_fnc_taxiRechnungAusstellen;";
			tooltip = "Invoice to the selected customer"; //--- ToDo: Localize;
		};
	};
};