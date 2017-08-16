class AH_vsell 
{
	idd = 15600;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {};
	
	class controls {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.235956 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.528089 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "ZU VERKAUFEN"; //--- ToDo: Localize;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.246958 * safezoneH + safezoneY;
			w = 0.163935 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 15601;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.279963 * safezoneH + safezoneY;
			w = 0.461447 * safezoneW;
			h = 0.440074 * safezoneH;
			sizeEx = 0.04;
			onLBSelChanged = "_this spawn life_fnc_vAH_select";
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = -1;
			text = "VERKAUFEN"; //--- ToDo: Localize;
			onButtonClick = "[] spawn life_fnc_vAH_sell;";
			x = 0.665 * safezoneW + safezoneX; //399 - 604
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.0220037 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.24,0.58,0,1};
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = -1;
			text = "Schliessen"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		/*
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = -1;
			text = "AMOUNT"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;[] spawn life_fnc_vAH_loadInventory;";
			x = 0.334 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		*/
		class RscPic_2403: Life_RscPicture
		{
			idc = 15660;
			text = "textures\fattony.jpg";
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.10528089 * safezoneH;
		};
		class RscText_1002: Life_RscText
		{
			idc = -1;
			text = "Anzahl"; //--- ToDo: Localize;
			x = 0.435 * safezoneW + safezoneX; //334
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class textEdit : Life_RscEdit {
			idc = 15602;
			text = "1";
			x = 0.48 * safezoneW + safezoneX; //464
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.022 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscText_1003: Life_RscText
		{
			idc = -1;
			text = "Totaler Preis $"; //--- ToDo: Localize;
			x = 0.523 * safezoneW + safezoneX; //334
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.067 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class textEdit2 : Life_RscEdit {
			idc = 15603;
			text = "50";
			x = 0.600 * safezoneW + safezoneX; //464
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		
		class RscButtonMenu_2404: Life_RscButtonMenu
		{
			idc = -1;
			text = "ZURÜCKNEHMEN"; //--- ToDo: Localize;
			onButtonClick = "[] spawn life_fnc_vAH_takeBack;";
			x = 0.345 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.0220037 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {1,0.54,0,1};
		};
	
	};
};