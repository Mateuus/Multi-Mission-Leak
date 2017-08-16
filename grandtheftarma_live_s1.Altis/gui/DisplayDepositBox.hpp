/**
* Copyright © 2015 DnA, Grand Theft Altis.
* All Rights Reserved.
*/

class GTA_DisplayDepositBox
{
  idd = IDD_DISPLAYDEPOSITBOX;
  scriptName = "GTA_DisplayDepositBox";
  scriptPath = "GUI";
  onLoad = "[_this, ""GTA_DisplayDepositBox"", true] call GTA_fnc_initDisplay";

  class ControlsBackground
  {
    class Background: GTA_ctrlStaticBackground
    {
      x = "((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5) * (pixelW * 1.25 * 4)";
      y = "0.5 - (90 * 0.5 - 2 * 5) * (pixelH * 1.25 * 4)";
      w = "140 * (pixelW * 1.25 * 4)";
      h = "(90 - 5 - 10) * (pixelH * 1.25 * 4)";
    };

    class BackgroundListItems: GTA_ctrlStaticOverlay
    {
      x = "((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5 - 1) * (pixelW * 1.25 * 4)";
      y = "0.5 - (90 * 0.5 - 16) * (pixelH * 1.25 * 4)";
      w = "138 * (pixelW * 1.25 * 4)";
      h = "(90 - 29) * (pixelH * 1.25 * 4)";
    };

    class BackgroundListHeaders: GTA_ctrlStatic
    {
      x = "((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5 - 1) * (pixelW * 1.25 * 4)";
      y = "0.5 - (90 * 0.5 - 11) * (pixelH * 1.25 * 4)";
      w = "138 * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";

      colorBackground[] = {0, 0, 0, 1};
    };

    class BackgroundButtons: GTA_ctrlStaticFooter
    {
      x = "((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5) * (pixelW * 1.25 * 4)";
      y = "0.5 + (safezoneH min (90 * (pixelH * 	1.25 * 4))) * 0.5 - 2 * (5 + 1) * (pixelH * 1.25 * 4)";
      w = "140 * (pixelW * 	1.25 * 4)";
      h = "(5 + 2) * (pixelH * 	1.25 * 4)";
    };
  };

  class Controls
  {
    class Title: GTA_ctrlStaticTitle
    {
      idc = IDC_DISPLAYDEPOSITBOX_TITLE;
      x = "((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5) * (pixelW * 1.25 * 4)";
      y = "0.5 - (90 * 0.5 - 5) * (pixelH * 1.25 * 4)";
      w = "140 * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";

      text = "Deposit Box";
    };

    class TextStatus: GTA_ctrlStatic
    {
      idc = IDC_DISPLAYDEPOSITBOX_TEXTSTATUS;
      x = "((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5 - 69 + 30) * (pixelW * 1.25 * 4)";
      y = "0.5 - (90 * 0.5 - 16 - 28) * (pixelH * 1.25 * 4)";
      w = "60 * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";

      style = 2;
      text = "Fetching data...";
    };

    class ProgressData: GTA_ctrlProgress
    {
      idc = IDC_DISPLAYDEPOSITBOX_PROGRESSDATA;
      x = "((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5 - 69 + 30) * (pixelW * 1.25 * 4)";
      y = "0.5 - (90 * 0.5 - 16 - 34) * (pixelH * 1.25 * 4)";
      w = "60 * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";

      colorFrame[] = {0, 0, 0, 0};
    };

    class ListItems: GTA_ctrlListNBox
    {
      idc = IDC_DISPLAYDEPOSITBOX_LISTITEMS;
      x = "((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5 - 1) * (pixelW * 1.25 * 4)";
      y = "0.5 - (90 * 0.5 - 16) * (pixelH * 1.25 * 4)";
      w = "138 * (pixelW * 1.25 * 4)";
      h = "(90 - 29) * (pixelH * 1.25 * 4)";

      colorBackground[] = {0.2, 0.2, 0.2, 1};
      columns[] = {0, 0.3};
      disableOverflow = 1;
    };

    class ListHeaders: GTA_ctrlListNBox
    {
      idc = IDC_DISPLAYDEPOSITBOX_LISTHEADERS;
      x = "((getResolution select 2) * 0.5 * pixelW) - (140 * 0.5 - 1) * (pixelW * 1.25 * 4)";
      y = "0.5 - (90 * 0.5 - 2 * 5.5) * (pixelH * 1.25 * 4)";
      w = "138 * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";

      disableOverflow = 1;
      columns[] = {0, 0.3};

      class Items
      {
        class Amount
        {
          text = "Amount";
          value = -1;
        };
        class Note
        {
          text = "Note";
          value = -1;
        };
      };
    };

    class ButtonClaim: GTA_ctrlButton
    {
      idc = IDC_DISPLAYDEPOSITBOX_BUTTONCLAIM;
      x = "((getResolution select 2) * 0.5 * pixelW) + (140 * 0.5 - 50 - 2) * (pixelW * 1.25 * 4)";
      y = "0.5 + (90 * 0.5 - 2 * 	5 - 1) * (pixelH * 1.25 * 4)";
      w = "25 * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";

      text = "Claim";
    };

    class ButtonClose: GTA_ctrlButtonOK
    {
      x = "((getResolution select 2) * 0.5 * pixelW) + (140 * 0.5 - 25 - 1) * (pixelW * 1.25 * 4)";
      y = "0.5 + (90 * 0.5 - 2 * 	5 - 1) * (pixelH * 1.25 * 4)";
      w = "25 * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";

      text = "Close";
    };
  };
};
