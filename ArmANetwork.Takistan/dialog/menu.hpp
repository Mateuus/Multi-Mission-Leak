////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////
class infomenu {

  idd = 432123;
  name = "infomenu";
	movingEnabled = false;
	enableSimulation = true;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.324687 * safezoneW + safezoneX;
    	y = 0.269 * safezoneH + safezoneY;
    	w = 0.350625 * safezoneW;
    	h = 0.44 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    	colorActive[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Info Menu";
    	x = 0.324687 * safezoneW + safezoneX;
    	y = 0.269 * safezoneH + safezoneY;
    	w = 0.350625 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
  };
  class controls {
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 1500;
      sizeEx = 0.035;
      onLBSelChanged = "[1] call life_fnc_openInfoMenu;";
    	x = 0.324687 * safezoneW + safezoneX;
    	y = 0.291 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.418 * safezoneH;
    };
    class RscStructuredText_1100: Life_RscStructuredText
    {
    	idc = 1100;
    	x = 0.448438 * safezoneW + safezoneX;
    	y = 0.291 * safezoneH + safezoneY;
    	w = 0.226875 * safezoneW;
    	h = 0.418 * safezoneH;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = -1;
      onButtonClick = "closeDialog 0;";
    	text = "Close Info Menu";
    	x = 0.324687 * safezoneW + safezoneX;
    	y = 0.709 * safezoneH + safezoneY;
    	w = 0.350625 * safezoneW;
    	h = 0.022 * safezoneH;
    };
  };
};
