class AH_vsell 
{
	idd = 15600;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {};
	
	class controls {
		class RscText_1000: DWEV_RscText
		{
			idc = -1;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.235956 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.528089 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: DWEV_RscText
		{
			idc = -1;
			text = "Zum verkauf";
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.246958 * safezoneH + safezoneY;
			w = 0.163935 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscListbox_1500: DWEV_RscListbox
		{
			idc = 15601;
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.279963 * safezoneH + safezoneY;
			w = 0.461447 * safezoneW;
			h = 0.440074 * safezoneH;
			sizeEx = 0.04;
			onLBSelChanged = "_this spawn DWEV_fnc_vAH_select";
		};
		class RscButtonMenu_2400: DWEV_RscButtonMenu
		{
			idc = -1;
			text = "Verkaufen";
			onButtonClick = "[] spawn DWEV_fnc_vAH_sell;";
			x = 0.669 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.15;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.24,0.58,0,1};
		};
		class RscButtonMenu_2401: DWEV_RscButtonMenu
		{
			idc = -1;
			text = "Schließen";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {0.988, 0, 0,1};
			x = 0.269276 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.15;
			h = 0.04;
		};
		/*
		class RscButtonMenu_2402: DWEV_RscButtonMenu
		{
			idc = -1;
			text = "AMOUNT"; //
			onButtonClick = "closeDialog 0;[] spawn DWEV_fnc_vAH_loadInventory;";
			x = 0.334 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		*/
		class RscPic_2403: DWEV_RscPicture
		{
			idc = 15660;
			text = "textures\Wolflogo\ah.paa";
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.10528089 * safezoneH;
		};
		class RscText_1002: DWEV_RscText
		{
			idc = -1;
			text = "Anzahl";
			x = 0.429 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class textEdit : DWEV_RscEdit {
			idc = 15602;
			text = "1";
			x = 0.49 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.022 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscText_1003: DWEV_RscText
		{
			idc = -1;
			text = "Gesamtpreis €";
			x = 0.529 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.275;
			h = 0.04;
		};
		class textEdit2 : DWEV_RscEdit {
			idc = 15603;
			text = "50";
			x = 0.604 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.15;
			h = 0.04;
		};
		
		class RscButtonMenu_2404: DWEV_RscButtonMenu
		{
			idc = -1;
			text = "Zurücknehmen";
			onButtonClick = "[] spawn DWEV_fnc_vAH_takeBack;";
			x = 0.334 * safezoneW + safezoneX;
			y = 0.731039 * safezoneH + safezoneY;
			w = 0.20;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {1,0.54,0,1};
		};
	};
};