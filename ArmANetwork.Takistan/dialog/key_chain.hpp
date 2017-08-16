////////////////////////////////////////////////////////
// ArmA.Network
// R4thbone
// Jeims
////////////////////////////////////////////////////////
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
    	text = "icons\keychainscreen.paa";
    	x = -0.0625;
    	y = -0.3;
    	w = 1.1375;
    	h = 1.5;
    };
    class RscPicture_1201: Life_RscPicture
    {
    	idc = -1;
    	text = "icons\givekeychain.paa";
    	x = -0.0625;
    	y = -0.3;
    	w = 1.1375;
    	h = 1.5;
    };
    class RscPicture_1202: Life_RscPicture
    {
    	idc = -1;
    	text = "icons\dropkeychain.paa";
    	x = -0.0625;
    	y = -0.3;
    	w = 1.1375;
    	h = 1.5;
    };
    class RscPicture_1203: Life_RscPicture
    {
    	idc = -1;
    	text = "icons\reportkeychain.paa";
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
    	x = 0.3125;
    	y = 0.14;
    	w = 0.395;
    	h = 0.44;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscCombo_2100: Life_RscCombo
    {
    	idc = 2702;
    	x = 0.3125;
    	y = 0.58;
    	w = 0.395;
    	h = 0.045;
    };
    class GiveKeyButton: Life_RscButtonInvisible
    {
    	idc = -1;
      onButtonClick = "[] call life_fnc_keyGive";
    	x = 0.3125;
    	y = 0.86;
    	w = 0.1125;
    	h = 0.04;
    };
    class ReportMissingButton: Life_RscButtonInvisible
    {
    	idc = -1;
    	x = 0.4375;
    	y = 0.86;
    	w = 0.15;
    	h = 0.04;
    };
    class DropKeyButton: Life_RscButtonInvisible
    {
    	idc = -1;
      onButtonClick = "[] call life_fnc_keyDrop";
    	x = 0.6;
    	y = 0.86;
    	w = 0.1125;
    	h = 0.04;
    };
    class CloseKeyMenu: Life_RscButtonInvisible
    {
      idc = -1;
      shortcuts[] = {0x00050000 + 2};
      text = "";
      onButtonClick = "closeDialog 0;";
      tooltip = "Return to the previous menu";
    	x = 0.3875;
    	y = 0.94;
    	w = 0.2375;
    	h = 0.04;
    };
  };
};
