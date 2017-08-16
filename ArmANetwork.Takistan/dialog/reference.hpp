////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////

class loading_screen {

  idd = 98342;
  name = "loading_screen";
  movingEnable = true;
  enableSimulation = true;
  fadeout=0;
  fadein=0;
  duration = 999;

  class controlsBackground {
    class RscPicture_1200: Life_RscPicture
    {
    	idc = 1200;
    	text = "icons\loading.paa";
    	x = -0.03625 * safezoneW + safezoneX;
    	y = -0.446 * safezoneH + safezoneY;
    	w = 1.0725 * safezoneW;
    	h = 1.892 * safezoneH;
    };
  };
  class controls {
    class LoadingProgress: Life_RscProgress
    {
    	idc = 1800;
    	x = 0.29375 * safezoneW + safezoneX;
    	y = 0.291 * safezoneH + safezoneY;
    	w = 0.4125 * safezoneW;
    	h = 0.044 * safezoneH;
    	colorText[] = {0,0,0,1};
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscStructuredText_1100: Life_RscStructuredText
    {
    	idc = 1100;
    	x = 0.29375 * safezoneW + safezoneX;
    	y = 0.335 * safezoneH + safezoneY;
    	w = 0.4125 * safezoneW;
    	h = 0.44 * safezoneH;
    };
    class RscText_1000: Life_RscText
    {
    	idc = 1000;
    	text = "Loading Information...";
    	x = 0.45875 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.0928125 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorText[] = {0,0,0,1};
    };
  };
};
