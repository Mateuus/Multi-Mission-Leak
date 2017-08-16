class TrunkMenu {
    idd = 3500;
    name = "TrunkMenu";
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
        	text = "<t align='right' font='PuristaBold' size='1.5'>Fahrzeuginventar</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class Life_RscTrunkText: Life_RscTitle
        {
          idc = -1;
          text = "$STR_Trunk_TInventory";
          sizeEx = 0.04;
        	x = 0.190625 * safezoneW + safezoneX;
        	y = 0.214 * safezoneH + safezoneY;
        	w = 0.237187 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class Life_RscPlayerText: Life_RscTitle
        {
        	idc = -1;
          text = "$STR_Trunk_PInventory";
          sizeEx = 0.04;
        	x = 0.572187 * safezoneW + safezoneX;
        	y = 0.214 * safezoneH + safezoneY;
        	w = 0.237187 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class Life_RscTitleText: Life_RscTitle
        {
          idc = 3501;
          text = "";
        	x = 0.17 * safezoneW + safezoneX;
        	y = 0.159 * safezoneH + safezoneY;
        	w = 0.438281 * safezoneW;
        	h = 0.022 * safezoneH;
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
        class TrunkGear: Life_RscListbox
        {
          idc = 3502;
          text = "";
          sizeEx = 0.030;
        	x = 0.190625 * safezoneW + safezoneX;
        	y = 0.258 * safezoneH + safezoneY;
        	w = 0.237187 * safezoneW;
        	h = 0.341 * safezoneH;
        };
        class PlayerGear: Life_RscListbox
        {
          idc = 3503;
          text = "";
          sizeEx = 0.030;
        	x = 0.572187 * safezoneW + safezoneX;
        	y = 0.258 * safezoneH + safezoneY;
        	w = 0.237187 * safezoneW;
        	h = 0.341 * safezoneH;
        };
        class TrunkEdit: Life_RscEdit
        {
          idc = 3505;
          sizeEx = 0.030;
        	text = "1"; //--- ToDo: Localize;
        	x = 0.190625 * safezoneW + safezoneX;
        	y = 0.61 * safezoneH + safezoneY;
        	w = 0.0928125 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class PlayerEdit: Life_RscEdit
        {
          idc = 3506;
          sizeEx = 0.030;
        	text = "1"; //--- ToDo: Localize;
        	x = 0.572187 * safezoneW + safezoneX;
        	y = 0.61 * safezoneH + safezoneY;
        	w = 0.0928125 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class TakeItem: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Nehmen"; //--- ToDo: Localize;
          onButtonClick = "[] call life_fnc_vehTakeItem;";
        	x = 0.190625 * safezoneW + safezoneX;
        	y = 0.643 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class StoreItem: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Einlagern"; //--- ToDo: Localize;
          onButtonClick = "[] call life_fnc_vehStoreItem;";
        	x = 0.572187 * safezoneW + safezoneX;
        	y = 0.643 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class StoreItemall: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Alles Einlagern"; //--- ToDo: Localize;
        	x = 0.659844 * safezoneW + safezoneX;
        	y = 0.643 * safezoneH + safezoneY;
        	w = 0.108281 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "[] call life_fnc_vehStoreItemAll;";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class TakeItemAll: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Alles Nehmen"; //--- ToDo: Localize;
        	x = 0.278281 * safezoneW + safezoneX;
        	y = 0.643 * safezoneH + safezoneY;
        	w = 0.108281 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "[] call life_fnc_vehTakeItemAll;";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
    };
};
