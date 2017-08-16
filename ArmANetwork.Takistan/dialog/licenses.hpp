////////////////////////////////////////////////////////
// ArmA.Network
// R4thbone
// Jeims
////////////////////////////////////////////////////////
#include "player_sys.sqf"

class Life_license_menu {
idd = playersys_DIALOG;
name= "life_license_menu";
movingEnable = false;
enableSimulation = true;
onLoad = "[] spawn life_fnc_licenses";

  class controlsBackground {
    class RscPicture_1200: Life_RscPictureKeepAspect
    {
    	idc = 1200;
    	text = "icons\blankscreen.paa";
    	x = -0.0625;
    	y = -0.3;
    	w = 1.1375;
    	h = 1.5;
    };
  };
  class controls {
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 2014;
      sizeEx = 0.035;
    	x = 0.325;
    	y = 0.12;
    	w = 0.3625;
    	h = 0.78;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscText_1000: Life_RscText
    {
    	idc = 1000;
    	text = "Licenses";
    	x = 0.3125;
    	y = 0.06;
    	w = 0.1375;
    	h = 0.04;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscButtonMenu_2400: Life_RscButtonInvisible
    {
    	idc = -1;
      shortcuts[] = {0x00050000 + 2};
      text = "";
      onButtonClick = "closeDialog 0;";
			tooltip = "Return to the previous menu";
    	x = 0.3875;
    	y = 0.94;
    	w = 0.25;
    	h = 0.04;
    };
  };
};
