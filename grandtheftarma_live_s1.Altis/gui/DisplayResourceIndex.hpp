/**
* Copyright © 2015 DnA, Grand Theft Altis.
* All Rights Reserved.
*/

class GTA_DisplayResourceIndex
{
  idd = IDD_DISPLAYRESOURCEINDEX;
  scriptName = "GTA_DisplayResourceIndex";
  scriptPath = "GUI";
  onLoad = "[_this, ""GTA_DisplayResourceIndex"", true] call GTA_fnc_initDisplay";

  class ControlsBackground
  {
    class Background: GTA_ctrlStaticBackground
    {
      x = "((getResolution select 2) * 0.5 * pixelW) - (180 * 0.5) * (pixelW * 1.25 * 4)";
      y = "0.5 - (safezoneH min (180 * (pixelH * 1.25 * 4))) * 0.5 + 10 * (pixelH * 1.25 * 4)";
      w = "180 * (pixelW * 1.25 * 4)";
      h = "(safezoneH min (180 * (pixelH * 1.25 * 4))) - (10 + 5) * (pixelH * 1.25 * 4)";
    };

    class BackgroundFilter: GTA_ctrlStatic
    {
      x = "((getResolution select 2) * 0.5 * pixelW) - (180 * 0.5 - 1) * (pixelW * 1.25 * 4)";
      y = "0.5 - (safezoneH min (180 * (pixelH * 1.25 * 4))) * 0.5 + (12 + 5) * (pixelH * 1.25 * 4)";
      w = "(180 - 2) * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";

      colorBackground[] = {0, 0, 0, 1};
    };

    class BackgroundFiles: GTA_ctrlStaticOverlay
    {
      x = "((getResolution select 2) * 0.5 * pixelW) - (180 * 0.5 - 1) * (pixelW * 1.25 * 4)";
      y = "0.5 - (safezoneH min (180 * (pixelH * 1.25 * 4))) * 0.5 + (12 + 5) * (pixelH * 1.25 * 4)";
      w = "(180 - 2) * (pixelW * 1.25 * 4)";
      h = "(safezoneH min (180 * (pixelH * 1.25 * 4))) - (30) * (pixelH * 1.25 * 4)";
    };

    class BackgroundButtons: GTA_ctrlStaticFooter
    {
      x = "((getResolution select 2) * 0.5 * pixelW) - (180 * 0.5) * (pixelW * 1.25 * 4)";
      y = "0.5 + (safezoneH min (180 * (pixelH * 1.25 * 4))) * 0.5 - 2 * (5 + 1) * (pixelH * 1.25 * 4)";
      w = "180 * (pixelW * 1.25 * 4)";
      h = "(5 + 2) * (pixelH * 1.25 * 4)";
    };
  };

  class Controls
  {
    class Dummy: GTA_ctrlStatic {};

    class Title: GTA_ctrlStaticTitle
    {
      x = "((getResolution select 2) * 0.5 * pixelW) - (180 * 0.5) * (pixelW * 1.25 * 4)";
      y = "0.5 - (safezoneH min (180 * (pixelH * 1.25 * 4))) * 0.5 + 5 * (pixelH * 1.25 * 4)";
      w = "180 * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";

      text = "Resource Index";
    };

    class Search: GTA_ctrlEdit
    {
      idc = IDC_DISPLAYRESOURCEINDEX_EDITSEARCH;
      x = "((getResolution select 2) * 0.5 * pixelW) - (180 * 0.5 - 1) * (pixelW * 1.25 * 4)";
      y = "0.5 - (safezoneH min (180 * (pixelH * 1.25 * 4))) * 0.5 + (11) * (pixelH * 1.25 * 4)";
      w = "(45) * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";
    };

    class SearchButton: GTA_ctrlButtonSearch
    {
      idc = IDC_DISPLAYRESOURCEINDEX_BUTTONSEARCH;
      x = "((getResolution select 2) * 0.5 * pixelW) - (180 * 0.5 - 45 - 1) * (pixelW * 1.25 * 4)";
      y = "0.5 - (safezoneH min (180 * (pixelH * 1.25 * 4))) * 0.5 + (11) * (pixelH * 1.25 * 4)";
      w = "5 * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";
    };

    class ListFilter: GTA_ctrlListNBox
    {
      idc = IDC_DISPLAYRESOURCEINDEX_FILTER;
      x = "((getResolution select 2) * 0.5 * pixelW) - (180 * 0.5 - 1) * (pixelW * 1.25 * 4)";
      y = "0.5 - (safezoneH min (180 * (pixelH * 1.25 * 4))) * 0.5 + (12 + 5) * (pixelH * 1.25 * 4)";
      w = "(180 - 2) * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";

      columns[] = {0, 0.5, 0.7};
      disableOverflow = 1;

      class Items
      {
        class Name
        {
          text = "Name";
          value = 0;
        };

        class Weight
        {
          text = "Weight";
          value = -1;
          data = "data";
        };

        class SellPrice
        {
          text = "Sell Price";
          value = -1;
          data = "data";
        };
      };
    };

    class ListItems: GTA_ctrlListNBox
    {
      idc = IDC_DISPLAYRESOURCEINDEX_LISTITEMS;
      x = "((getResolution select 2) * 0.5 * pixelW) - (180 * 0.5 - 1) * (pixelW * 1.25 * 4)";
      y = "0.5 - (safezoneH min (180 * (pixelH * 1.25 * 4))) * 0.5 + (12 + 5 + 5) * (pixelH * 1.25 * 4)";
      w = "(180 - 2) * (pixelW * 1.25 * 4)";
      h = "(safezoneH min (180 * (pixelH * 1.25 * 4))) - (35) * (pixelH * 1.25 * 4)";

      colorBackground[] = {0.2, 0.2, 0.2, 1};
      columns[] = {0, 0.5, 0.7};
      disableOverflow = 1;
    };

    class ButtonClose: GTA_ctrlButtonOK
    {
      x = "((getResolution select 2) * 0.5 * pixelW) + (180 * 0.5 - 25 - 1) * (pixelW * 1.25 * 4)";
      y = "0.5 + (safezoneH min (180 * (pixelH * 1.25 * 4))) * 0.5 - (2 * 5 + 1) * (pixelH * 1.25 * 4)";
      w = "25 * (pixelW * 1.25 * 4)";
      h = "5 * (pixelH * 1.25 * 4)";

      text = "Close";
    };
  };
};
