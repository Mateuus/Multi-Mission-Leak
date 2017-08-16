/*
* @Author:  DnA
* @Profile: http://steamcommunity.com/id/dna_uk
* @Date:    2015-02-05 13:45:04
* @Last Modified by:   DnA
* @Last Modified time: 2015-02-05 15:09:51
*/

class life_weapon_shop
{
  idd = 38400;

  class Controls
  {

    class Title: GTA_RscTitle
    {
      idc = 38401;
      x = "12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "0 * ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
      w = "15 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      text = "";
    };

    class Background: GTA_RscText
    {
      idc = -1;
      x = "12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "1.1 * ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
      w = "15 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "23 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      colorBackground[] = { 0, 0, 0, 0.7 };
    };

    class ListPlayers: GTA_RscListBox
    {
      idc = 38403;
      x = "13 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "3.1 * ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
      w = "14 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "19 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      colorBackground[] = { 1, 1, 1, 0.1 };
      colorPictureSelected[] = { 1, 1, 1, 1 };
      colorSelect[] = { 1, 1, 1, 1 };
      colorSelect2[] = { 1, 1, 1, 1 };
      colorSelectBackground[] = { 1, 1, 1, 0.5 };
      colorSelectBackground2[] = { 1, 1, 1, 0.5 };
      onLBDblClick = "[] spawn life_fnc_weaponShopBuySell;";
      onLBSelChanged = "_this call life_fnc_weaponShopSelection";
      rowHeight = "1.4 *       ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
      sizeEx = "0.8 *       ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
    };

    class ComboFilter: GTA_RscCombo
    {
      idc = 38402;
      x = "13 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "1.6 * ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
      w = "14 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      onLBSelChanged = "_this call life_fnc_weaponShopFilter";
    };

    class TextPrice: GTA_RscStructuredText
    {
      idc = 38404;
      x = "13 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "22.6 * ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
      w = "14 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      colorBackground[] = { 1, 1, 1, 0.1 };
      text = "";
    };

    class ButtonClose: GTA_RscButtonMenuOK
    {
      x = "12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "24.2 * ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
      w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      text = "Close";
    };

    class ButtonBuy: GTA_RscButtonMenu
    {
      idc = 38405;
      x = "21.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "24.2 * ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
      w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      onButtonClick = "[] spawn life_fnc_weaponShopBuySell; true";
      text = "Buy";
    };

  };

};
