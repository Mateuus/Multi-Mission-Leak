/*
//--Repentz for Arma Nexus
*/

class Life_key_management {
idd = 2700;
name= "life_key_chain";
movingEnable = false;
enableSimulation = true;
onLoad = "[] spawn life_fnc_keyMenu;";

  class controlsBackground {

    class BackgroundImage: Life_RscPictureKeepAspect
    {
    	idc = -1;
    	text = "images\Textures\Phone\phoneKeys.paa";
    	x = -0.0625;
    	y = -0.3;
    	w = 1.1375;
    	h = 1.5;
    };
  };
  class controls {

    class RscListbox_1500: Life_RscListbox
    {
      idc = 2701;
      text = "";
			sizeEx = 0.025;
      x = 0.340;
      y = 0.125;
      w = 0.334;
      h = 0.5;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscCombo_2100: Life_RscCombo
    {
    	idc = 2702;
      x = 0.3542;
      y = 0.7;
      w = 0.3;
      h = 0.04;
    };
    class GiveKeyButton: Life_RscButtonInvisible2
    {
    	idc = -1;
      onButtonClick = "[] call life_fnc_keyGive";
      tooltip = "Give keys to selected player";
      x = 0.345;
      y = 0.857;
      w = 0.072;
      h = 0.04;
    };
    class DropKeyButton: Life_RscButtonInvisible2
    {
    	idc = -1;
      onButtonClick = "[] call life_fnc_keyDrop";
      tooltip = "Remove Keys";
      x = 0.5430;
      y = 0.857;
      w = 0.096;
      h = 0.04;
    };
    class CloseKeyMenu: Life_RscButtonInvisible2
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
