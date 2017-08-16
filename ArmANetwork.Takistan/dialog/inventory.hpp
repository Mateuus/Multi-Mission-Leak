#include "player_sys.sqf"
////////////////////////////////////////////////////////
// ArmA.Network
// R4thbone
// Jeims
////////////////////////////////////////////////////////
class Life_inventory_menu {
idd = playersys_DIALOG;
name= "life_inventory_menu";
movingEnable = false;
enableSimulation = true;
onLoad = "[] spawn life_fnc_inventory";

  class controlsBackground {
    class RscPicture_1200: Life_RscPictureKeepAspect
    {
    	idc = 1200;
    	text = "icons\backpackmenu.paa";
    	x = -0.0625;
    	y = -0.3;
    	w = 1.1375;
    	h = 1.5;
    };
    class RscPicture_1201: Life_RscPicture
    {
    	idc = 1201;
    	text = "icons\removebackpack.paa";
    	x = -0.0625;
    	y = -0.3;
    	w = 1.1375;
    	h = 1.5;
    };
    class RscPicture_1202: Life_RscPicture
    {
    	idc = 1202;
    	text = "icons\givebackpack.paa";
    	x = -0.0625;
    	y = -0.3;
    	w = 1.1375;
    	h = 1.5;
    };
    class RscPicture_1203: Life_RscPicture
    {
    	idc = 1203;
    	text = "icons\usebackpack.paa";
    	x = -0.0625;
    	y = -0.3;
    	w = 1.1375;
    	h = 1.5;
    };
  };
  class controls {
    class RscListbox_1500: Life_RscListbox
    {
    	idc = item_list;
      sizeEx = 0.030;
    	x = 0.3125;
    	y = 0.12;
    	w = 0.4;
    	h = 0.5;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscCombo_2100: Life_RscCombo
    {
    	idc = 2023;
    	x = 0.3125;
    	y = 0.62;
    	w = 0.4;
    	h = 0.06;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscEdit_1400: Life_RscEdit
    {
    	idc = item_edit;
      text = "1";
    	x = 0.325;
    	y = 0.8;
    	w = 0.375;
    	h = 0.04;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscStructuredText_1100: Life_RscStructuredText
    {
    	idc = carry_weight;
      text = "";
      colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
      x = 0.575;
	    y = 0.07;
	    w = 0.1;
	    h = 0.06;
    };
    class givebuttoninv: Life_RscButtonInvisible
    {
    	idc = 2400;
      onButtonClick = "[] call life_fnc_giveItem;";
    	x = 0.3125;
    	y = 0.86;
    	w = 0.1125;
    	h = 0.04;
    };
    class removebuttoninv: Life_RscButtonInvisible
    {
    	idc = 2401;
      onButtonClick = "[] call life_fnc_removeItem;";
    	x = 0.45;
    	y = 0.86;
    	w = 0.1125;
    	h = 0.04;
    };
    class usebuttoninv: Life_RscButtonInvisible
    {
    	idc = 2402;
      onButtonClick = "[] call life_fnc_useItem;";
    	x = 0.5875;
    	y = 0.86;
    	w = 0.1125;
    	h = 0.04;
    };
    class RscButtonMenu_2403: Life_RscButtonInvisible
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
