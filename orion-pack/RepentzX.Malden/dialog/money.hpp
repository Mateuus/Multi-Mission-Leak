/*
//--Repentz for Arma Nexus
*/

#include "player_sys.sqf"

class Life_money_menu {
idd = playersys_DIALOG;
name= "life_money_menu";
movingEnable = false;
enableSimulation = false;
onLoad = "[] spawn life_fnc_money";

  class controlsBackground {
    class imagebackground: Life_RscPictureKeepAspect
    {
    	idc = -1;
      //moving = 1;
    	text = "images\Textures\Phone\phoneMoney.paa";
    	x = -0.0625;
    	y = -0.3;
    	w = 1.1375;
    	h = 1.5;
    };
    class inBank: Life_RscPicture
    {
    	idc = -1;
      text = "images\Textures\Phone\subIcons\bankPhone.paa";
      x = 0.47;
      y = 0.09;
      w = 0.029 * safezoneW;
			h = 0.049 * safezoneH;
    };
    class inHand: Life_RscPicture
    {
    	idc = -1;
      text = "images\Textures\Phone\subIcons\inhandPhone.paa";
      x = 0.47;
      y = 0.29;
      w = 0.029 * safezoneW;
			h = 0.049 * safezoneH;
    };
  };
  class controls {
    class playerlistmoney: Life_RscCombo
    {
    	idc = 2022;
      x = 0.3542;
      y = 0.7;
      w = 0.3;
      h = 0.04;
    	colorBackground[] = {0,0,0,0.7};
    };
    class atmcashdisplay: Life_RscStructuredText
    {
    	idc = 1100;
      text = "";
    	x = 0.425;
    	y = 0.18;
    	w = 0.3375;
    	h = 0.06;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class cashonhanddisplay: Life_RscStructuredText
    {
    	idc = 1101;
      text = "";
    	x = 0.425;
    	y = 0.38;
    	w = 0.3375;
    	h = 0.06;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class amountogive: Life_RscEdit
    {
    	idc = 2018;
      text = "1";
      colorBackground[] = {0,0,0,0};
      x = 0.3542;
      y = 0.76;
      w = 0.3;
      h = 0.04;
    };
    class closebutton: Life_RscButtonInvisible
    {
    	idc = -1;
      shortcuts[] = {0x00050000 + 2};
      onButtonClick = "closeDialog 0; createDialog ""smartphone"";";
			tooltip = "Previous Menu";
      x = 0.40294 * safezoneW + safezoneX;
      y = 0.733 * safezoneH + safezoneY;
      w = 0.059 * safezoneW;
      h = 0.049 * safezoneH;
    };
    class givemoneybutton: Life_RscButtonInvisible
    {
    	idc = -1;
      onButtonClick = "[] call life_fnc_giveMoney";
			tooltip = "Give Money to selected Player";
      x = 0.444;
      y = 0.857;
      w = 0.072;
      h = 0.04;
    };
  };
};
