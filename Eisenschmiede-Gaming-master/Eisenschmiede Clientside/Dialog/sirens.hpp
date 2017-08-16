class ES_sirens
{
	idd = 9876;
	movingEnable = true;
	enableSimulation = 1;
	onLoad = "[0] spawn ES_fnc_sirens;";

	class controlsBackground
	{
		class Main: ES_RscText
		{
			idc = -1;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.634219 * safezoneW;
			h = 0.726 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};

		class Statustitle: ES_RscTitle
		{
			idc = -1;
			text = "Status :"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class strich: ES_RscText
		{
			idc = -1;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.715 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};

		class bedientitle: ES_RscTitle
		{
			idc = -1;
			text = "Bedienoberfläche :"; //--- ToDo: Localize;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class head: ES_RscTitle
		{
			idc = -1;
			text = "Sirenen Menü - Eisenschmiede-Gaming.de"; //--- ToDo: Localize;
			x = 0.175677 * safezoneW + safezoneX;
			y = 0.0525926 * safezoneH + safezoneY;
			w = 0.634219 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};

		class kavtext: ES_RscText
		{
			idc = -1;
			text = "Kavala Sirene:"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class kavhqtext: ES_RscText
		{
			idc = -1;
			text = "Kavala HQ Sirene:"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class kavseutext: ES_RscText
		{
			idc = -1;
			text = "Kavala Seuchen Sirene:"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class kavkrtext: ES_RscText
		{
			idc = -1;
			text = "Kavala Krankenhaus Sirene:"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class softext: ES_RscText
		{
			idc = -1;
			text = "Sofia Sirene:"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class attext: ES_RscText
		{
			idc = -1;
			text = "Athira Sirene:"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class pyrtext: ES_RscText
		{
			idc = -1;
			text = "Pyrgos Sirene:"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class alltext: ES_RscText
		{
			idc = -1;
			text = "Alle Sirenen:"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class testtext: ES_RscText
		{
			idc = -1;
			text = "Testalarm:"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};

	class controls 
	{
		class close: ES_RscButtonMenu
		{
			idc = -1;
			text = "Schließen"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.174229 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Schließen"; //--- ToDo: Localize;
		};

		class aktu: ES_RscButtonMenu
		{
			idc = -1;
			text = "Aktualisieren"; //--- ToDo: Localize;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,0.7,-1,1};
			onButtonClick = "[0] spawn ES_fnc_sirens;";
		};

		class kavsir: ES_RscStructuredText
		{
			idc = 9999;
			text = ""; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class kavseu: ES_RscStructuredText
		{
			idc = 9994;
			text = ""; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class kavhq: ES_RscStructuredText
		{
			idc = 9998;
			text = ""; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class kavkr: ES_RscStructuredText
		{
			idc = 9997;
			text = ""; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class ath: ES_RscStructuredText
		{
			idc = 9996;
			text = ""; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class pyr: ES_RscStructuredText
		{
			idc = 9995;
			text = ""; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class sof: ES_RscStructuredText
		{
			idc = 9993;
			text = ""; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class test: ES_RscStructuredText
		{
			idc = 9992;
			text = ""; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class kavakt: ES_RscButtonMenu
		{
			idc = -1;
			text = "Aktivieren"; //--- ToDo: Localize;
			onButtonClick = "[1] spawn ES_fnc_sirens;";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class bastiiii: ES_RscButtonMenu
		{
			idc = 1234567;
			text = "Basti"; //--- ToDo: Localize;
			onButtonClick = "[18] spawn ES_fnc_sirens;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class kavhqakt: ES_RscButtonMenu
		{
			idc = -1;
			text = "Aktivieren"; //--- ToDo: Localize;
			onButtonClick = "[5] spawn ES_fnc_sirens;";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		/*
		class kavhqdea: ES_RscButtonMenu
		{
			idc = -1;
			text = "Deaktivieren"; //--- ToDo: Localize;
			onButtonClick = "[6] spawn ES_fnc_sirens;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		*/
		class kavseuakt: ES_RscButtonMenu
		{
			idc = -1;
			text = "Aktivieren"; //--- ToDo: Localize;
			onButtonClick = "[3] spawn ES_fnc_sirens;";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		/*
		class kavseudea: ES_RscButtonMenu
		{
			idc = -1;
			text = "Deaktivieren"; //--- ToDo: Localize;
			onButtonClick = "[4] spawn ES_fnc_sirens;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		*/
		class kavkrakt: ES_RscButtonMenu
		{
			idc = -1;
			text = "Aktivieren"; //--- ToDo: Localize;
			onButtonClick = "[7] spawn ES_fnc_sirens;";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		/*
		class kavkrdea: ES_RscButtonMenu
		{
			idc = -1;
			text = "Deaktivieren"; //--- ToDo: Localize;
			onButtonClick = "[8] spawn ES_fnc_sirens;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		*/
		class atakt: ES_RscButtonMenu
		{
			idc = -1;
			text = "Aktivieren"; //--- ToDo: Localize;
			onButtonClick = "[9] spawn ES_fnc_sirens;";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		/*
		class atdea: ES_RscButtonMenu
		{
			idc = -1;
			text = "Deaktivieren"; //--- ToDo: Localize;
			onButtonClick = "[10] spawn ES_fnc_sirens;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		*/
		class pyrakt: ES_RscButtonMenu
		{
			idc = -1;
			text = "Aktivieren"; //--- ToDo: Localize;
			onButtonClick = "[11] spawn ES_fnc_sirens;";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		/*
		class pyrdea: ES_RscButtonMenu
		{
			idc = -1;
			text = "Deaktivieren"; //--- ToDo: Localize;
			onButtonClick = "[12] spawn ES_fnc_sirens;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		*/
		class sofakt: ES_RscButtonMenu
		{
			idc = -1;
			text = "Aktivieren"; //--- ToDo: Localize;
			onButtonClick = "[13] spawn ES_fnc_sirens;";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		/*
		class sofdea: ES_RscButtonMenu
		{
			idc = -1;
			text = "Deaktivieren"; //--- ToDo: Localize;
			onButtonClick = "[14] spawn ES_fnc_sirens;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		*/
		class allakt: ES_RscButtonMenu
		{
			idc = -1;
			text = "Aktivieren"; //--- ToDo: Localize;
			onButtonClick = "[16] spawn ES_fnc_sirens;";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		/*
		class alldea: ES_RscButtonMenu
		{
			idc = -1;
			text = "Deaktivieren"; //--- ToDo: Localize;
			onButtonClick = "[15] spawn ES_fnc_sirens;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		*/
		class testakt: ES_RscButtonMenu
		{
			idc = -1;
			text = "Aktivieren"; //--- ToDo: Localize;
			onButtonClick = "[17] spawn ES_fnc_sirens;";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};