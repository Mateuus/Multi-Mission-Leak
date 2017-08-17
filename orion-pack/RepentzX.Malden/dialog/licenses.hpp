/*
//--Repentz for Arma Nexus
*/

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
    	text = "images\Textures\Phone\phoneBlank.paa";
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
    	x = 0.365;
    	y = 0.12;
    	w = 0.2925;
    	h = 0.78;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscText_1000: Life_RscText
    {
    	idc = 1000;
    	text = "Licenses";
    	x = 0.4525;
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
      onButtonClick = "closeDialog 0; createDialog ""smartphone"";";
			tooltip = "Previous Menu";
      x = 0.40294 * safezoneW + safezoneX;
      y = 0.733 * safezoneH + safezoneY;
      w = 0.059 * safezoneW;
      h = 0.049 * safezoneH;
    };
  };
};
