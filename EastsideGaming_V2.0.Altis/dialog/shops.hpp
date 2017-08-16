class life_weapon_shop {
    idd = 38400;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_klein_menu.paa";
        	x = 0.340156 * safezoneW + safezoneX;
        	y = 0.17 * safezoneH + safezoneY;
        	w = 0.309375 * safezoneW;
        	h = 0.583 * safezoneH;
        };
        class itemList: Life_RscListbox
        {
          idc = 38403;
          onLBSelChanged = "_this call life_fnc_weaponShopSelection";
          sizeEx = 0.035;
        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.247 * safezoneH + safezoneY;
        	w = 0.232031 * safezoneW;
        	h = 0.352 * safezoneH;
        };
        class itemInfo: Life_RscStructuredText
        {
          idc = 38404;
          text = "";
          sizeEx = 0.035;
        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.643 * safezoneH + safezoneY;
        	w = 0.226875 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class FilterList: Life_RscCombo
        {
          idc = 38402;
          onLBSelChanged = "_this call life_fnc_weaponShopFilter";
        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.61 * safezoneH + safezoneY;
        	w = 0.113437 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t font='PuristaBold' size='1.5'>Waffenshop</t>"; //--- ToDo: Localize;
        	x = 0.402031 * safezoneW + safezoneX;
        	y = 0.181 * safezoneH + safezoneY;
        	w = 0.0928125 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
    };

    class controls {
        class BtnSell: Life_RscButtonMenu
        {
          idc = 38405;
          text = "Kaufen"; //--- ToDo: Localize;
          onButtonClick = "[] spawn life_fnc_weaponShopBuySell; true";
          x = 0.427812 * safezoneW + safezoneX;
          y = 0.698 * safezoneH + safezoneY;
          w = 0.118594 * safezoneW;
          h = 0.044 * safezoneH;
          colorBackground[] = {0.753,0.145,0.145,1};
		  class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class btnClose: ESG_RscCloseButton
        {
          idc = -1;
          onButtonClick = "closeDialog 0;";
          x = 0.592812 * safezoneW + safezoneX;
          y = 0.181 * safezoneH + safezoneY;
          w = 0.020625 * safezoneW;
          h = 0.033 * safezoneH;
          colorBackground[] = {-1,-1,-1,0};
        };
    };
};
