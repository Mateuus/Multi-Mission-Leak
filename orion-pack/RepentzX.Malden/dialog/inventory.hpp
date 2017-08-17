/*
//--Repentz for Arma Nexus
*/

#include "player_sys.sqf"

class Life_inventory_menu {
  idd = playersys_DIALOG;
  name = "life_inventory_menu";
  movingEnable = false;
  enableSimulation = true;
  onLoad = "[] spawn life_fnc_inventory";
  class controlsBackground {
    class RscPicture_1200: Life_RscPictureKeepAspect {
      idc = 1200;
      text = "images\Textures\Phone\phoneInventory.paa";
      x = -0.0625;
      y = -0.3;
      w = 1.1375;
      h = 1.5;
    };
  };
  class controls {
    class itemList: Life_RscListbox {
      idc = item_list;
      sizeEx = 0.030;
      x = 0.363;
      y = 0.125;
      w = 0.29;
      h = 0.5;
      colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscCombo_2100: Life_RscCombo {
      idc = 2023;
      x = 0.3535;
      y = 0.7;
      w = 0.3;
      h = 0.04;
      colorBackground[] = {0,0,0,0};
      colorActive[] = {0,0,0,0};
    };
    class RscEdit_1400: Life_RscEdit {
      idc = item_edit;
      text = "1";
      x = 0.468;
      y = 0.76;
      w = 0.07;
      h = 0.04;
      colorBackground[] = {0,0,0,0};
      colorActive[] = {0,0,0,0};
    };
    class RscStructuredText_1100: Life_RscStructuredText {
      idc = carry_weight;
      text = "";
      colorBackground[] = {0,0,0,0};
      colorActive[] = {0,0,0,0};
      x = 0.595;
      y = 0.05;
      w = 0.15;
      h = 0.06;
    };
    class givebuttoninv: Life_RscButtonInvisible {
      idc = 2400;
      onButtonClick = "[] call life_fnc_giveItem;";
      tooltip = "Give Selected Item";
      x = 0.296;
      y = 0.883;
      w = 0.14;
      h = 0.155;
    };
    class removebuttoninv: Life_RscButtonInvisible {
      idc = 2401;
      onButtonClick = "[] call life_fnc_removeItem;";
      tooltip = "Remove Selected Item";
      x = 0.4430;
      y = 0.883;
      w = 0.12;
      h = 0.164;
    };
    class usebuttoninv: Life_RscButtonInvisible {
      idc = 2402;
      onButtonClick = "[] call life_fnc_useItem;";
      tooltip = "Use Selected Item";
      x = 0.581;
      y = 0.883;
      w = 0.128;
      h = 0.155;
    };
  };
};
