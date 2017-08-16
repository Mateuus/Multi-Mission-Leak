////////////////////////////////////////////////////////
// ArmA.Network
// R4thbone
// Jeims
////////////////////////////////////////////////////////
class life_spawn_selection {
idd = 38500;
movingEnabled = false;
enableSimulation = true;

  class controlsBackground {
    class RscPicture_1200: Life_RscPicture
    {
    	idc = 1200;
    	text = "icons\spawnscreen.paa";
    	x = 0 * safezoneW + safezoneX;
    	y = 0 * safezoneH + safezoneY;
    	w = 1.01558 * safezoneW;
    	h = 1.07701 * safezoneH;
    };
    class RscPicture_1201: Life_RscPicture
    {
    	idc = 1201;
    	text = "icons\Buyticket.paa";
    	x = -0.0671875 * safezoneW + safezoneX;
    	y = -0.391 * safezoneH + safezoneY;
    	w = 1.09828 * safezoneW;
    	h = 1.8975 * safezoneH;
    };
    class MapControl: Life_RscMapControl
    {
    	idc = 38502;
    	x = 0.530937 * safezoneW + safezoneX;
    	y = 0.5 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.308 * safezoneH;
      maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
    };
  };
  class controls {
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "";
      colorText[] = { 0, 0, 0, 1 };
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.365937 * safezoneW + safezoneX;
    	y = 0.533 * safezoneH + safezoneY;
    	w = 0.118594 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "";
      colorText[] = { 0, 0, 0, 1 };
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.365937 * safezoneW + safezoneX;
    	y = 0.588 * safezoneH + safezoneY;
    	w = 0.118594 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2402: Life_RscButtonMenu
    {
    	idc = 2402;
    	text = "";
      colorText[] = { 0, 0, 0, 1 };
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.365937 * safezoneW + safezoneX;
    	y = 0.6375 * safezoneH + safezoneY;
    	w = 0.118594 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2403: Life_RscButtonMenu
    {
    	idc = 2403;
    	text = "";
      colorText[] = { 0, 0, 0, 1 };
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.365937 * safezoneW + safezoneX;
    	y = 0.6925 * safezoneH + safezoneY;
    	w = 0.118594 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2404: Life_RscButtonMenu
    {
    	idc = 2404;
    	text = "";
      colorText[] = { 0, 0, 0, 1 };
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.365937 * safezoneW + safezoneX;
    	y = 0.742 * safezoneH + safezoneY;
    	w = 0.118594 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class SpawnButton: Life_RscButtonInvisible
    {
    	idc = 2405;
      onButtonClick = "[] call life_fnc_spawnConfirm;";
    	x = 0.613437 * safezoneW + safezoneX;
    	y = 0.412 * safezoneH + safezoneY;
    	w = 0.0567187 * safezoneW;
    	h = 0.044 * safezoneH;
    };
  };
};
