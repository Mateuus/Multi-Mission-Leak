class AH_buy 
{
	idd = 15100;
	movingEnable = 0;
	enableSimulation = 1;
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
			text = "MARCHE NOIR"; //--- ToDo: Localize;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.246958 * safezoneH + safezoneY;
			w = 0.163935 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 15101;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.279963 * safezoneH + safezoneY;
			w = 0.461447 * safezoneW;
			h = 0.440074 * safezoneH;
			sizeEx = 0.03;
			onLBSelChanged = "_this spawn life_fnc_vAH_select";
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = -1;
			text = "ACHETER"; //--- ToDo: Localize;
			onButtonClick = "[] spawn life_fnc_vAH_buy;";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.730039 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.24,0.58,0,1};
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = -1;
			text = "FERMER"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.730039 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.04;
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = -1;
			text = "MES OBJETS"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;[] spawn life_fnc_vAH_loadInventory;";
			x = 0.334 * safezoneW + safezoneX;
			y = 0.730039 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04;
		};
		class RscPic_2403: Life_RscPicture
		{
			idc = 15160;
			text = "";
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.10528089 * safezoneH;
		};
		class textEdit : Life_RscEdit {
			idc = 15102;
			text = "";
			x = 0.54 * safezoneW + safezoneX;
			y = 0.730039 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.04;
		};
		class RscButtonMenu_2404: Life_RscButtonMenu
		{
			idc = -1;
			text = "RECHERCHER"; //--- ToDo: Localize;
			onButtonClick = "_search = ctrlText 15102;closeDialog 0;[_search] spawn life_fnc_vAH_load;";
			x = 0.625 * safezoneW + safezoneX;
			y = 0.730039 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04;
		};
	};
};