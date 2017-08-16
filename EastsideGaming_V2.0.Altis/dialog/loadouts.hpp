class ESG_loadouts {
    idd = 3333;
    name= "ESG_loadouts";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn ESG_fnc_getLoadout";

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
        class btnClose: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Schliessen"; //--- ToDo: Localize;
          onButtonClick = "closeDialog 0;";
        	x = 0.190625 * safezoneW + safezoneX;
        	y = 0.742 * safezoneH + safezoneY;
        	w = 0.0876563 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
        };
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t font='PuristaBold' size='1.5'>Loadoutsystem</t>"; //--- ToDo: Localize;
        	x = 0.469062 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.139219 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class title_edit: Life_RscTitle
        {
        	idc = -1;
        	text = "Loadoutname"; //--- ToDo: Localize;
        	x = 0.463906 * safezoneW + safezoneX;
        	y = 0.225 * safezoneH + safezoneY;
        	w = 0.0928125 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class title_loadouts: Life_RscTitle
        {
        	idc = -1;
        	text = "Verfügbare Loadouts"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.225 * safezoneH + safezoneY;
        	w = 0.159844 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class title_preis: Life_RscTitle
        {
        	idc = -1;
        	text = "Loadoutkosten"; //--- ToDo: Localize;
        	x = 0.463906 * safezoneW + safezoneX;
        	y = 0.313 * safezoneH + safezoneY;
        	w = 0.0928125 * safezoneW;
        	h = 0.022 * safezoneH;
        };
    };

    class controls {
        class loadouts: Life_RscListbox
        {
        	idc = 1500;
          sizeEx = 0.032;
    			onLBSelChanged = "[]spawn ESG_fnc_loadout_lbchange;";
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.258 * safezoneH + safezoneY;
        	w = 0.268125 * safezoneW;
        	h = 0.253 * safezoneH;
        };
        class edit_name: Life_RscEdit
        {
          idc = 1400;
    			text = "";
        	x = 0.469062 * safezoneW + safezoneX;
        	y = 0.258 * safezoneH + safezoneY;
        	w = 0.170156 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class preis: Life_RscText
        {
          idc = 1404;
    			text = "";
        	x = 0.463906 * safezoneW + safezoneX;
        	y = 0.346 * safezoneH + safezoneY;
        	w = 0.134062 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class save: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Speichern"; //--- ToDo: Localize;
        	x = 0.463906 * safezoneW + safezoneX;
        	y = 0.478 * safezoneH + safezoneY;
        	w = 0.0876563 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "if(ctrlText 1400 in ["""",""Nicht belegt"",""Nicht Belegt"",""nicht belegt"",""nicht Belegt""])then{hint ""Geb erst einen Namen ein!"";}else{[]spawn ESG_fnc_loadoutUpdateRequest;};";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class load: Life_RscButtonMenu
        {
        	idc = 2402;
        	text = "Ausgewähltes Loadout laden"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.522 * safezoneH + safezoneY;
        	w = 0.232031 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "[] spawn ESG_fnc_loadoutLaden";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
    };
};
