/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplayAction
{
  idd = IDD_RSCDISPLAYACTION;
  scriptName = "GTA_RscDisplayAction";
  scriptPath = "GUI";
  onLoad = "[ _this, ""GTA_RscDisplayAction"" ] call GTA_fnc_initDisplay";

  class Controls
  {

    class Background: GTA_RscText
    {
      idc = -1;
      x = "10 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "safezoneY + safezoneH - 5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
      w = "20 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      colorBackground[] = { "( profilenamespace getVariable [ 'IGUI_BCG_RGB_R', 0 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_G', 1 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_B', 1 ] )", 0.8 };
    };

    class Progress: GTA_RscProgress
    {
      idc = IDC_RSCDISPLAYACTION_PROGRESS;
      x = "10 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "safezoneY + safezoneH - 5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
      w = "20 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
    };

    class TextProgress: GTA_RscText
    {
      idc = IDC_RSCDISPLAYACTION_TEXTPROGRESS;
      x = "10 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "safezoneY + safezoneH - 5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
      w = "20 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      colorText[] = { 1, 1, 1, 1 };
      style = 2;
      text = "50%";
    };

    class TextAction: GTA_RscText
    {
      idc = IDC_RSCDISPLAYACTION_TEXTACTION;
      x = "10 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "safezoneY + safezoneH - 6.2 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
      w = "20 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      colorText[] = { 1, 1, 1, 1 };
      font = "PuristaMedium";
      style = 2;
    };

  };
};
