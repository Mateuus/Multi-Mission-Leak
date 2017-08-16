class Chop_Shop {
    idd = 39400;
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
				class title: Life_RscStructuredText
				{
					idc = -1;
					text = "<t font='PuristaBold' size='1.5'>Schrottplatz</t>"; //--- ToDo: Localize;
					x = 0.407187 * safezoneW + safezoneX;
					y = 0.181 * safezoneH + safezoneY;
					w = 0.108281 * safezoneW;
					h = 0.033 * safezoneH;
					colorBackground[] = {-1,-1,-1,0};
				};
        class priceInfo: Life_RscStructuredText
        {
          idc = 39401;
          text = "";
          sizeEx = 0.035;
        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.621 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
    };

    class controls {
        class vehicleList: Life_RscListbox
        {
          idc = 39402;
          onLBSelChanged = "_this call life_fnc_chopShopSelection";
          sizeEx = 0.04;
          x = 0.37625 * safezoneW + safezoneX;
          y = 0.247 * safezoneH + safezoneY;
          w = 0.232031 * safezoneW;
          h = 0.352 * safezoneH;
        };
        class BtnSell: Life_RscButtonMenu
        {
          idc = -1;
          onButtonclick = "[] call life_fnc_chopShopSell;";
          text = "Verkaufen"; //--- ToDo: Localize;
          x = 0.427812 * safezoneW + safezoneX;
          y = 0.698 * safezoneH + safezoneY;
          w = 0.118594 * safezoneW;
          h = 0.044 * safezoneH;
          colorBackground[] = {0.753,0.145,0.145,1};
          class Attributes {
            align = "center";
            font = "PuristaBold";
          };
        };
        class btnClose: ESG_RscCloseButton
        {
          idc = -1;
          onButtonClick = "closeDialog 0";
          x = 0.592812 * safezoneW + safezoneX;
          y = 0.181 * safezoneH + safezoneY;
          w = 0.020625 * safezoneW;
          h = 0.033 * safezoneH;
          colorBackground[] = {-1,-1,-1,0};
        };
    };
};
