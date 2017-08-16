////////////////////////////////////////////////////////
// ArmA.Network
// R4thbone
////////////////////////////////////////////////////////
class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = false;
	enableSimulation = true;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.835156 * safezoneW + safezoneX;
    	y = 0.192 * safezoneH + safezoneY;
    	w = 0.159844 * safezoneW;
    	h = 0.539 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    	colorActive[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = 2403;
    	text = "";
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.192 * safezoneH + safezoneY;
    	w = 0.144375 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorText[] = {0.05,0.75,0,1};
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
  };

  class controls {
    class RscText_1002: Life_RscText
    {
    	idc = -1;
    	text = "Shop";
    	x = 0.902187 * safezoneW + safezoneX;
    	y = 0.28 * safezoneH + safezoneY;
    	w = 0.0309375 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorText[] = {0,0.95,0,1};
    };
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 2401;
			sizeEx = 0.035;
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.154 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscEdit_1400: Life_RscEdit
    {
    	idc = 2404;
    	text = "1";
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.456 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = -1;
    	text = "Buy Item(s)";
      onButtonClick = "[] spawn life_fnc_virt_buy;";
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscText_1003: Life_RscText
    {
    	idc = -1;
    	text = "Your Inventory";
    	x = 0.886719 * safezoneW + safezoneX;
    	y = 0.5 * safezoneH + safezoneY;
    	w = 0.0670312 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorText[] = {0,0.95,0,1};
    };
    class RscListbox_1501: Life_RscListbox
    {
    	idc = 2402;
			sizeEx = 0.035;
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.522 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.154 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscEdit_1401: Life_RscEdit
    {
    	idc = 2405;
    	text = "1";
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.676 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = -1;
    	text = "Sell Item(s)";
      onButtonClick = "[] call life_fnc_virt_sell";
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.698 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscStructuredText_1100: Life_RscStructuredText
    {
    	idc = -1;
    	text = "Be aware, the sale of various items/goods will have a direct impact on the market. ";
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.214 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.066 * safezoneH;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscButtonMenu_2402: Life_RscButtonMenu
    {
    	idc = -1;
    	text = "  Close Shop";
      onButtonClick = "closeDialog 0;";
    	x = 0.917656 * safezoneW + safezoneX;
    	y = 0.731 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
  };
};
