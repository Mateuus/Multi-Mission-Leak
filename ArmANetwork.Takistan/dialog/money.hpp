#include "player_sys.sqf"
////////////////////////////////////////////////////////
// ArmA.Network
// R4thbone
// Jeims
////////////////////////////////////////////////////////
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
    	text = "icons\moneyinv.paa";
    	x = -0.0625;
    	y = -0.3;
    	w = 1.1375;
    	h = 1.5;
    };
    class givebuttonimage: Life_RscPicture
    {
    	idc = -1;
    	text = "icons\givebutton.paa";
    	x = -0.0625;
    	y = -0.3;
    	w = 1.1375;
    	h = 1.5;
    };
  };
  class controls {
    class playerlistmoney: Life_RscCombo
    {
    	idc = 2022;
    	x = 0.325;
    	y = 0.38;
    	w = 0.375;
    	h = 0.04;
    	colorBackground[] = {0,0,0,0};
    };
    class atmcashdisplay: Life_RscStructuredText
    {
    	idc = 1100;
      text = "";
    	x = 0.3625;
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
    	x = 0.3625;
    	y = 0.27;
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
    	x = 0.325;
    	y = 0.76;
    	w = 0.375;
    	h = 0.04;
    };
    class closebutton: Life_RscButtonInvisible
    {
    	idc = -1;
      shortcuts[] = {0x00050000 + 2};
      tooltip = "Return to Main Menu";
      onButtonClick = "closeDialog 0;";
    	x = 0.3875;
    	y = 0.94;
    	w = 0.25;
    	h = 0.04;
    };
    class givemoneybutton: Life_RscButtonInvisible
    {
    	idc = -1;
      onButtonClick = "[] call life_fnc_giveMoney";
			tooltip = "Give Money to selected Player";
    	x = 0.45;
    	y = 0.82;
    	w = 0.125;
    	h = 0.04;
    };
  };
};
