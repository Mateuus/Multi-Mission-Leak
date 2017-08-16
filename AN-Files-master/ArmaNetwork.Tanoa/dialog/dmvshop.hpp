////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Rath Bone, v1.063, #Dazidu)
////////////////////////////////////////////////////////
class dmv_shop {
	idd = 79874;
	name= "dmv_shop";
	movingEnable = 0;
	enableSimulation = 1;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
      text = "";
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.346 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.297 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "DMV - Available Licenses"; //--- ToDo: Localize;
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.335 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
  };
  class controls {
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 1500;
      text = "";
    	x = 0.422656 * safezoneW + safezoneX;
    	y = 0.379 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.22 * safezoneH;
      sizeEx = 0.035;
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Buy License"; //--- ToDo: Localize;
    	x = 0.443281 * safezoneW + safezoneX;
    	y = 0.61 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_wutes;";
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.643 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
  };
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
