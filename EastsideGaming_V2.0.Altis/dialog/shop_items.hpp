class shops_menu {
    idd = 2400;
    name= "shops_menu";
    movingEnable = 0;
    enableSimulation = 1;

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
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Item-Shop</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class vasText: Life_RscTitle
        {
          idc = -1;
          text = "$STR_VS_SI";
          x = 0.190625 * safezoneW + safezoneX;
          y = 0.214 * safezoneH + safezoneY;
          w = 0.237187 * safezoneW;
          h = 0.022 * safezoneH;
        };
        class vasgText: Life_RscTitle
        {
          idc = -1;
          x = 0.572187 * safezoneW + safezoneX;
          y = 0.214 * safezoneH + safezoneY;
          w = 0.237187 * safezoneW;
          h = 0.022 * safezoneH;
          text = "$STR_VS_PI";
        };
    };

    class controls {
          class btn_close: Life_RscButtonMenu
          {
          	idc = -1;
          	text = "Schliessen"; //--- ToDo: Localize;
          	x = 0.180312 * safezoneW + safezoneX;
          	y = 0.753 * safezoneH + safezoneY;
          	w = 0.0773437 * safezoneW;
          	h = 0.033 * safezoneH;
          	colorBackground[] = {0.149,0.149,0.149,1};
			onButtonClick = "closeDialog 0;";
          };
          class itemList: Life_RscListbox
          {
            idc = 2401;
            text = "";
            sizeEx = 0.030;
          	x = 0.190625 * safezoneW + safezoneX;
          	y = 0.258 * safezoneH + safezoneY;
          	w = 0.237187 * safezoneW;
          	h = 0.341 * safezoneH;
          };
          class pItemList: Life_RscListbox
          {
            idc = 2402;
            text = "";
            sizeEx = 0.030;
          	x = 0.572187 * safezoneW + safezoneX;
          	y = 0.258 * safezoneH + safezoneY;
          	w = 0.237187 * safezoneW;
          	h = 0.341 * safezoneH;
          };
          class PlayersName: Life_RscTitle
          {
            idc = 601;
            style = 1;
            text = "";
          	x = 0.17 * safezoneW + safezoneX;
          	y = 0.159 * safezoneH + safezoneY;
          	w = 0.438281 * safezoneW;
          	h = 0.022 * safezoneH;
          };
          class buyEdit: Life_RscEdit
          {
            idc = 2404;
            sizeEx = 0.030;
          	text = "1"; //--- ToDo: Localize;
          	x = 0.190625 * safezoneW + safezoneX;
          	y = 0.61 * safezoneH + safezoneY;
          	w = 0.0928125 * safezoneW;
          	h = 0.022 * safezoneH;
          };
          class sellEdit: Life_RscEdit
          {
            idc = 2405;
            sizeEx = 0.030;
          	text = "1"; //--- ToDo: Localize;
          	x = 0.572187 * safezoneW + safezoneX;
          	y = 0.61 * safezoneH + safezoneY;
          	w = 0.0928125 * safezoneW;
          	h = 0.022 * safezoneH;
          };
          class ButtonAddG: Life_RscButtonMenu
          {
          	idc = -1;
          	text = "Kaufen"; //--- ToDo: Localize;
            onButtonClick = "[] spawn life_fnc_virt_buy;";
          	x = 0.190625 * safezoneW + safezoneX;
          	y = 0.643 * safezoneH + safezoneY;
          	w = 0.0773437 * safezoneW;
          	h = 0.033 * safezoneH;
          	colorBackground[] = {0.149,0.149,0.149,1};
          };
          class ButtonRemoveG: Life_RscButtonMenu
          {
          	idc = -1;
          	text = "Verkaufen"; //--- ToDo: Localize;
            onButtonClick = "[] call life_fnc_virt_sell;";
          	x = 0.572187 * safezoneW + safezoneX;
          	y = 0.643 * safezoneH + safezoneY;
          	w = 0.0773437 * safezoneW;
          	h = 0.033 * safezoneH;
          	colorBackground[] = {0.149,0.149,0.149,1};
          };
          class ButtonRemoveAllG: Life_RscButtonMenu
          {
          	idc = -1;
          	text = "Alles Verkaufen"; //--- ToDo: Localize;
            onButtonClick = "[] call life_fnc_virt_sellAll;";
          	x = 0.659844 * safezoneW + safezoneX;
          	y = 0.643 * safezoneH + safezoneY;
          	w = 0.108281 * safezoneW;
          	h = 0.033 * safezoneH;
          	colorBackground[] = {0.149,0.149,0.149,1};
          };
      };
};
