////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////

class Life_key_management {
  idd = 2705;
  name= "life_key_chain";
  movingEnable = 0;
  enableSimulation = 1;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.335 * safezoneH + safezoneY;
    	w = 0.226875 * safezoneW;
    	h = 0.308 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Key Chain"; //--- ToDo: Localize;
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.335 * safezoneH + safezoneY;
    	w = 0.226875 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,0.8};
    };
  };
  class controls {
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 1500;
      text = "";
    	x = 0.39172 * safezoneW + safezoneX;
    	y = 0.368 * safezoneH + safezoneY;
    	w = 0.216563 * safezoneW;
    	h = 0.231 * safezoneH;
      colorBackground[] = {0,0,0,0.6};
      sizeEx = 0.035;
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Remove"; //--- ToDo: Localize;
    	x = 0.391719 * safezoneW + safezoneX;
    	y = 0.61 * safezoneH + safezoneY;
    	w = 0.103125 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_xastamepra";
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Report Stolen"; //--- ToDo: Localize;
    	x = 0.505155 * safezoneW + safezoneX;
    	y = 0.61 * safezoneH + safezoneY;
    	w = 0.103125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2402: Life_RscButtonMenu
    {
    	idc = 2402;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.643 * safezoneH + safezoneY;
    	w = 0.226875 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
  };
};
