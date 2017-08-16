class life_wanted_menu {
    idd = 2400;
    name= "life_wanted_menu";
    movingEnable = false;
    enableSimulation = true;
    //onLoad = "[] spawn life_fnc_wantedadd2;";

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_menu.paa";
        	x = 0.17 * safezoneW + safezoneX;
        	y = 0.115 * safezoneH + safezoneY;
        	w = 0.665156 * safezoneW;
        	h = 0.693 * safezoneH;
        };
        class title_header: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t font='PuristaBold' size='1.5'>Fahndungsliste</t>"; //--- ToDo: Localize;
        	x = 0.175156 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.262969 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class strich: Life_RscText
        {
        	idc = -1;
        	x = 0.180312 * safezoneW + safezoneX;
        	y = 0.5 * safezoneH + safezoneY;
        	w = 0.639375 * safezoneW;
        	h = 0.0055 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,1};
        };
        class title_wanted: Life_RscTitle
        {
        	idc = -1;
        	text = "Aktuelle Fahndungen"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.203 * safezoneH + safezoneY;
        	w = 0.139219 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class title_add: Life_RscTitle
        {
        	idc = -1;
        	text = "Fahndung ausrufen"; //--- ToDo: Localize;
        	x = 0.180312 * safezoneW + safezoneX;
        	y = 0.511 * safezoneH + safezoneY;
        	w = 0.139219 * safezoneW;
        	h = 0.022 * safezoneH;
        };
      };

      class controls {
        class btn_close: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Schliessen"; //--- ToDo: Localize;
        	x = 0.7475 * safezoneW + safezoneX;
        	y = 0.764 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "closeDialog 0;";
		  class Attributes {
						align = "center";
					};
        };
        class WantedConnection: Life_RscTitle
        {
          idc = 2404;
          style = 1;
          text = "";
        	x = 0.350469 * safezoneW + safezoneX;
        	y = 0.17 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class WantedList: Life_RscListbox
        {
        	idc = 2401;
          text = "";
          sizeEx = 0.035;
          onLBSelChanged = "[] spawn life_fnc_wantedGrab";
        	x = 0.190625 * safezoneW + safezoneX;
        	y = 0.236 * safezoneH + safezoneY;
        	w = 0.242344 * safezoneW;
        	h = 0.253 * safezoneH;
        };
        class Playerlist: Life_RscListbox
        {
			idc = 2406;
			text = "";
			sizeEx = 0.035;
			x = 0.190625 * safezoneW + safezoneX;
        	y = 0.544 * safezoneH + safezoneY;
        	w = 0.242344 * safezoneW;
        	h = 0.253 * safezoneH;
        };
        class WantedAddL: Life_RscListbox
        {
        	idc = 2407;
			text = "";
			sizeEx = 0.035;
        	x = 0.448438 * safezoneW + safezoneX;
        	y = 0.544 * safezoneH + safezoneY;
        	w = 0.242344 * safezoneW;
        	h = 0.253 * safezoneH;
        };
        class ButtonWantedAdd: Life_RscButtonMenu
        {
        	idc = 9800;
        	text = "Hinzufügen"; //--- ToDo: Localize;
          onButtonClick = "[] call life_fnc_wantedAddP;";
        	x = 0.701094 * safezoneW + safezoneX;
        	y = 0.544 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
						align = "center";
					};
        };
        class BountyPrice: Life_RscText
        {
          idc = 2403;
          text = "";
        	x = 0.448438 * safezoneW + safezoneX;
        	y = 0.236 * safezoneH + safezoneY;
        	w = 0.190781 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class WantedDetails: Life_RscListbox
        {
          idc = 2402;
          text = "";
          sizeEx = 0.035;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.28 * safezoneH + safezoneY;
        	w = 0.201094 * safezoneW;
        	h = 0.209 * safezoneH;
        };
        class PardonButtonKey: Life_RscButtonMenu
        {
        	idc = 2405;
        	text = "Eintrag löschen"; //--- ToDo: Localize;
          onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";
        	x = 0.665 * safezoneW + safezoneX;
        	y = 0.28 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
						align = "center";
					};
        };
    };
};
