class esg_fuelkiller {
    idd = 5523;
    movingEnable = 1;
    enableSimulation = 1;

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = 1200;
        	text = "texture\misc\bg_menu.paa";
        	x = 0.17 * safezoneW + safezoneX;
        	y = 0.115 * safezoneH + safezoneY;
        	w = 0.665156 * safezoneW;
        	h = 0.693 * safezoneH;
        };
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Fuelkiller/EMP-System</t>"; //--- ToDo: Localize;
        	x = 0.369062 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.239219 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class title_listbox: Life_RscTitle
        {
        	idc = -1;
        	text = "Fahrzeuge in der Nähe"; //--- ToDo: Localize;
        	x = 0.180312 * safezoneW + safezoneX;
        	y = 0.203 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        };
    };

    class controls {
        class btn_close: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Schliessen"; //--- ToDo: Localize;
        	x = 0.180312 * safezoneW + safezoneX;
        	y = 0.764 * safezoneH + safezoneY;
        	w = 0.0876563 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "closeDialog 0;";
        };
        class VehicleList: Life_RscListbox
        {
        	idc = 1500;
			text = "";
        	x = 0.180312 * safezoneW + safezoneX;
        	y = 0.236 * safezoneH + safezoneY;
        	w = 0.345469 * safezoneW;
        	h = 0.517 * safezoneH;
			sizeEx = 0.035;
        };
        class refresh_btn: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Fahrzeugliste aktualisieren"; //--- ToDo: Localize;
        	x = 0.546406 * safezoneW + safezoneX;
        	y = 0.236 * safezoneH + safezoneY;
        	w = 0.262969 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			onButtonClick = "[]call esg_fnc_openFuelKiller;";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class warn_btn: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Ausgewähltes Fahrzeug Vorwarnen"; //--- ToDo: Localize;
        	x = 0.546406 * safezoneW + safezoneX;
        	y = 0.302 * safezoneH + safezoneY;
        	w = 0.262969 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			onButtonClick = "[0]call esg_fnc_sendFuelKiller;";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class end_btn: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Ausgewähltes Fahrzeug Ausser Gefecht setzen"; //--- ToDo: Localize;
        	x = 0.546406 * safezoneW + safezoneX;
        	y = 0.388 * safezoneH + safezoneY;
        	w = 0.257813 * safezoneW;
        	h = 0.053 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			onButtonClick = "[1]call esg_fnc_sendFuelKiller;";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
    };
};
