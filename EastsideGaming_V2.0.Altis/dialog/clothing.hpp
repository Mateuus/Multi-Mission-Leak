class Life_Clothing {
    idd = 3100;
    name= "Life_Clothing";
    movingEnable = 1;
    enableSimulation = 1;

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_klein_menu.paa";
        	x = -0.015625 * safezoneW + safezoneX;
        	y = 0.17 * safezoneH + safezoneY;
        	w = 0.309375 * safezoneW;
        	h = 0.583 * safezoneH;
        };
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t font='PuristaBold' size='1.5'>Kleidung</t>"; //--- ToDo: Localize;
        	x = 0.051406 * safezoneW + safezoneX;
        	y = 0.181 * safezoneH + safezoneY;
        	w = 0.108281 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
    };

    class controls {
        class ClothingList: Life_RscListbox
        {
          idc = 3101;
          text = "";
          sizeEx = 0.035;
          onLBSelChanged = "[_this] call life_fnc_changeClothes;";
          x = 0.020469 * safezoneW + safezoneX;
          y = 0.247 * safezoneH + safezoneY;
          w = 0.232031 * safezoneW;
          h = 0.352 * safezoneH;
        };
        class BtnBuy: Life_RscButtonMenu
        {
          idc = -1;
          onButtonClick = "[] call life_fnc_buyClothes;";
          text = "Kaufen"; //--- ToDo: Localize;
          x = 0.072031 * safezoneW + safezoneX;
          y = 0.698 * safezoneH + safezoneY;
          w = 0.118594 * safezoneW;
          h = 0.044 * safezoneH;
          colorBackground[] = {0.753,0.145,0.145,1};
          class Attributes {
            align = "center";
            font = "PuristaBold";
          }
        };
        class PriceTag: Life_RscStructuredText
        {
          idc = 3102;
          text = "";
          sizeEx = 0.035;
          x = 0.020469 * safezoneW + safezoneX;
          y = 0.643 * safezoneH + safezoneY;
          w = 0.108281 * safezoneW;
          h = 0.044 * safezoneH;
          colorBackground[] = {-1,-1,-1,0};
        };
        class btnClose: ESG_RscCloseButton
        {
          idc = -1;
          onButtonClick = "closeDialog 0; []spawn life_fnc_clothingFix; [] call life_fnc_playerSkins;";
          x = 0.237031 * safezoneW + safezoneX;
          y = 0.181 * safezoneH + safezoneY;
          w = 0.020625 * safezoneW;
          h = 0.033 * safezoneH;
          colorBackground[] = {-1,-1,-1,0};
        };
        class TotalPrice: Life_RscStructuredText
        {
          idc = 3106;
          text = "";
          sizeEx = 0.035;
          x = 0.139063 * safezoneW + safezoneX;
          y = 0.643 * safezoneH + safezoneY;
          w = 0.108281 * safezoneW;
          h = 0.044 * safezoneH;
          colorBackground[] = {-1,-1,-1,0};
        };
        class FilterList: Life_RscCombo
        {
          idc = 3105;
          colorBackground[] = {0,0,0,0.7};
          onLBSelChanged  = "_this call life_fnc_clothingFilter";
          x = 0.020469 * safezoneW + safezoneX;
          y = 0.61 * safezoneH + safezoneY;
          w = 0.113437 * safezoneW;
          h = 0.022 * safezoneH;
        };
    };
};
