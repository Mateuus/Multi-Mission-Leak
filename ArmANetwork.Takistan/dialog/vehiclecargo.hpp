////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////
class vehiclecargo {
idd = 482;
movingEnable = false;
enableSimulation = true;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.365937 * safezoneW + safezoneX;
    	y = 0.335 * safezoneH + safezoneY;
    	w = 0.257813 * safezoneW;
    	h = 0.308 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    	colorActive[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Vehicle Cargo"; //--- ToDo: Localize;
    	x = 0.365937 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.257813 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
  };
  class controls {
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 1500;
    	x = 0.37625 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.237187 * safezoneW;
    	h = 0.242 * safezoneH;
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Close";
      onButtonClick = "closeDialog 0;";
    	x = 0.365937 * safezoneW + safezoneX;
    	y = 0.643 * safezoneH + safezoneY;
    	w = 0.257813 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    /*
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Confiscate"; //--- ToDo: Localize;
    	x = 0.45875 * safezoneW + safezoneX;
    	y = 0.61 * safezoneH + safezoneY;
    	w = 0.061875 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    */
  };
};
