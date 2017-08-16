////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////
class JawsOfLife {

	idd = 54321;
	movingEnable = 0;
	enableSimulation = 1;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.345312 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.309375 * safezoneW;
    	h = 0.286 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    	colorActive[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Jaws of Life: Vehicle Crew"; //--- ToDo: Localize;
    	x = 0.345312 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.309375 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
  };
  class controls {
    class RscText_1002: Life_RscText
    {
    	idc = 1002;
    	text = "Select a Player to revive"; //--- ToDo: Localize;
    	x = 0.443281 * safezoneW + safezoneX;
    	y = 0.379 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.044 * safezoneH;
    };
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 1500;
			sizeEx = 0.040;
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.423 * safezoneH + safezoneY;
    	w = 0.28875 * safezoneW;
    	h = 0.154 * safezoneH;
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
			onButtonClick = "[] call life_fnc_wrafakedrap";
    	text = "Confirm & Revive"; //--- ToDo: Localize;
    	x = 0.453594 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.0876563 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = -1;
      onButtonClick = "closeDialog 0;";
    	text = "Cancel"; //--- ToDo: Localize;
    	x = 0.345312 * safezoneW + safezoneX;
    	y = 0.643 * safezoneH + safezoneY;
    	w = 0.309375 * safezoneW;
    	h = 0.022 * safezoneH;
    };
  };
};
