////////////////////////////////////////////////////////
// ArmA.Network
// R4thbone
////////////////////////////////////////////////////////
class life_weapon_shop
{
	idd = 38400;
	movingEnabled = false;
	enableSimulation = true;

  class controlsBackground {

    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.866094 * safezoneW + safezoneX;
    	y = 0.28 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.418 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    	colorActive[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
      idc = 38401;
      text = "";
    	x = 0.87125 * safezoneW + safezoneX;
    	y = 0.28 * safezoneH + safezoneY;
    	w = 0.108281 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorText[] = {0.27,0.99,0.11,1};
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
  };
  class controls {
    class RscListbox_1500: Life_RscListbox
    {
      idc = 38403;
      onLBSelChanged = "_this call life_fnc_weaponShopSelection";
			sizeEx = 0.035;
    	x = 0.87125 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.118594 * safezoneW;
    	h = 0.231 * safezoneH;
    	colorText[] = {0.67,0.56,0,1};
    };
    class RscCombo_2100: Life_RscCombo
    {
      idc = 38402;
      onLBSelChanged = "_this call life_fnc_weaponShopFilter";
    	x = 0.87125 * safezoneW + safezoneX;
    	y = 0.533 * safezoneH + safezoneY;
    	w = 0.118594 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 38405;
    	text = "Buy Item(s)";
      onButtonClick = "[] spawn life_fnc_weaponShopBuySell; true";
    	x = 0.87125 * safezoneW + safezoneX;
    	y = 0.665 * safezoneH + safezoneY;
    	w = 0.118594 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = -1;
    	text = "  Close Shop"; //--- ToDo: Localize;
      onButtonClick = "closeDialog 0;";
    	x = 0.917656 * safezoneW + safezoneX;
    	y = 0.698 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscStructuredText_1100: Life_RscStructuredText
    {
      idc = 38404;
      text = "";
    	x = 0.87125 * safezoneW + safezoneX;
    	y = 0.566 * safezoneH + safezoneY;
    	w = 0.118594 * safezoneW;
    	h = 0.088 * safezoneH;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
  };
};
