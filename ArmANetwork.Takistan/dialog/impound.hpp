////////////////////////////////////////////////////////
// ArmA.Network
// R4thbone
////////////////////////////////////////////////////////
class Life_impound_menu
{
	idd = 2800;
	name="life_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.83 * safezoneW + safezoneX;
    	y = 0.192 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.561 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    	colorActive[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Your Garage"; //--- ToDo: Localize;
    	x = 0.835156 * safezoneW + safezoneX;
    	y = 0.203 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
    };
  };
  class controls {
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 2802;
      text = "";
			sizeEx = 0.035;
    	x = 0.835155 * safezoneW + safezoneX;
    	y = 0.236 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.198 * safezoneH;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
			onLBSelChanged = "_this call life_fnc_garageLBChange;";
    };
    class RscText_1002: Life_RscText
    {
    	idc = -1;
    	text = "Vehicle Information"; //--- ToDo: Localize;
    	x = 0.835156 * safezoneW + safezoneX;
    	y = 0.445 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscStructuredText_1100: Life_RscStructuredText
    {
      idc = 2803;
      text = "";
    	x = 0.835156 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.264 * safezoneH;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = -1;
    	text = " X "; //--- ToDo: Localize;
      onButtonClick = "closeDialog 0;";
    	x = 0.974375 * safezoneW + safezoneX;
    	y = 0.753 * safezoneH + safezoneY;
    	w = 0.020625 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = -1;
    	text = "Retrieve"; //--- ToDo: Localize;
			onButtonClick = "[] call life_fnc_unimpound;";
    	x = 0.907343 * safezoneW + safezoneX;
    	y = 0.753 * safezoneH + safezoneY;
    	w = 0.0670312 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    /*
    class RscButtonMenu_2402: Life_RscButtonMenu
    {
    	idc = 2402;
    	text = "Sell Vehicle"; //--- ToDo: Localize;
      onButtonClick = "[] call life_fnc_sellGarage;";
    	x = 0.83 * safezoneW + safezoneX;
    	y = 0.753 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    */
  };
};
