class Federal_Safe {
    idd = 3500;
    name = "Federal_Safe";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_klein_menu.paa";
        	x = 0.340156 * safezoneW + safezoneX;
        	y = 0.159 * safezoneH + safezoneY;
        	w = 0.319688 * safezoneW;
        	h = 0.605 * safezoneH;
        };
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t font='PuristaBold' size='1.5'>Banktresor</t>"; //--- ToDo: Localize;
        	x = 0.402031 * safezoneW + safezoneX;
        	y = 0.181 * safezoneH + safezoneY;
        	w = 0.201094 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class btnClose: ESG_RscCloseButton
        {
        	idc = -1;
        	x = 0.603125 * safezoneW + safezoneX;
        	y = 0.17 * safezoneH + safezoneY;
        	w = 0.020625 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
          onButtonClick = "closeDialog 0;";
        };
    };

    class controls {
        class TakeItem: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Nehmen"; //--- ToDo: Localize;
        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.72 * safezoneH + safezoneY;
        	w = 0.118594 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          onButtonClick = "[] call life_fnc_safeTake;";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class VehicleWeight: Life_RscTitle
        {
        	idc = 3504;
          style = 1;
          text = "";
        	x = 0.365937 * safezoneW + safezoneX;
        	y = 0.236 * safezoneH + safezoneY;
        	w = 0.262969 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class TrunkGear: Life_RscListbox
        {
          idc = 3502;
          text = "";
          sizeEx = 0.030;
        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.28 * safezoneH + safezoneY;
        	w = 0.242344 * safezoneW;
        	h = 0.308 * safezoneH;
        };
        class TrunkEdit: Life_RscEdit
        {
          idc = 3505;
          sizeEx = 0.030;
        	text = "1"; //--- ToDo: Localize;
        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.599 * safezoneH + safezoneY;
        	w = 0.12375 * safezoneW;
        	h = 0.022 * safezoneH;
        };
    };
};
