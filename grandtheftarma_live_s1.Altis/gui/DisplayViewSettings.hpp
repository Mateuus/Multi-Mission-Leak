/**
* Copyright © 2015 DnA, Grand Theft ArmA.
* All Rights Reserved.
*/

class GTA_DisplayViewSettings
{
  idd = IDD_DISPLAYVIEWSETTINGS;
  scriptName = "GTA_DisplayViewSettings";
  scriptPath = "GUI";
  onLoad = "[_this, ""GTA_DisplayViewSettings""] call GTA_fnc_initDisplay";

  class ControlsBackground
  {
    class Background: GTA_ctrlStaticBackground
    {
      x = "((getResolution select 2) * 0.5 * (1 / (getResolution select 2))) - (100 * 0.5) * ((1 / (getResolution select 2)) * 1.25 * 4)";
      y = "0.5 - (62 * 0.5 - 2 * 5) * ((1 / (getResolution select 3)) * 1.25 * 4)";
      w = "100 * ((1 / (getResolution select 2)) * 1.25 * 4)";
      h = "(62 - 5 - 10) * ((1 / (getResolution select 3)) * 1.25 * 4)";

      colorBackground[] = {0.1, 0.1, 0.1, 1};
    };

    class BackgroundButtons: GTA_ctrlStaticFooter
    {
      x = "((getResolution select 2) * 0.5 * (1 / (getResolution select 2))) - (100 * 0.5) * ((1 / (getResolution select 2)) * 1.25 * 4)";
      y = "0.5 + (62 * 0.5 - 2 * 5 - 2) * ((1 / (getResolution select 3)) * 1.25 * 4)";
      w = "100 * ((1 / (getResolution select 2)) * 1.25 * 4)";
      h = "(5 + 2) * ((1 / (getResolution select 3)) * 1.25 * 4)";

      colorBackground[] = {0, 0, 0, 0};
    };
  };

  class Controls
  {
    class Title: GTA_ctrlStaticTitle
    {
      x = "((getResolution select 2) * 0.5 * (1 / (getResolution select 2))) - (100 * 0.5) * ((1 / (getResolution select 2)) * 1.25 * 4)";
      y = "0.5 - (62 * 0.5 - 5) * ((1 / (getResolution select 3)) * 1.25 * 4)";
      w = "100 * ((1 / (getResolution select 2)) * 1.25 * 4)";
      h = "5 * ((1 / (getResolution select 3)) * 1.25 * 4)";

      text = "View Settings";
    };

    class Tabs: GTA_ctrlToolbox
    {
      idc = IDC_DISPLAYVIEWSETTINGS_TABS;
      x = "((getResolution select 2) * 0.5 * (1 / (getResolution select 2))) - (100 * 0.5) * ((1 / (getResolution select 2)) * 1.25 * 4)";
      y = "0.5 - (62 * 0.5 - 11) * ((1 / (getResolution select 3)) * 1.25 * 4)";
      w = "100 * ((1 / (getResolution select 2)) * 1.25 * 4)";
      h = "6 * ((1 / (getResolution select 3)) * 1.25 * 4)";

      colorBackground[] = {0, 0, 0, 0};
      colorSelectedBg[] = {0.2, 0.2, 0.2, 1};
      columns = 3;
      font = "PuristaLight";
      strings[] = {"Infantry", "Ground", "Air"};
    };

    class PanelTab: GTA_ctrlControlsGroupNoScrollbars
    {
      x = "((getResolution select 2) * 0.5 * (1 / (getResolution select 2))) - (100 * 0.5) * ((1 / (getResolution select 2)) * 1.25 * 4)";
      y = "0.5 - (62 * 0.5 - 17) * ((1 / (getResolution select 3)) * 1.25 * 4)";
      w = "100 * ((1 / (getResolution select 2)) * 1.25 * 4)";
      h = "33 * ((1 / (getResolution select 3)) * 1.25 * 4)";

      class Controls
      {
        class PanelTabBackground: GTA_ctrlStatic
        {
          x = 0;
          y = 0;
          w = "100 * ((1 / (getResolution select 2)) * 1.25 * 4)";
          h = "33 * ((1 / (getResolution select 3)) * 1.25 * 4)";

          colorBackground[] = {0.2, 0.2, 0.2, 1};
        };

        class HeaderSettings: GTA_ctrlStatic
        {
          x = 0;
          y = "2 * ((1 / (getResolution select 3)) * 1.25 * 4)";
          w = "(100 / 3) * ((1 / (getResolution select 2)) * 1.25 * 4)";
          h = "5 * ((1 / (getResolution select 3)) * 1.25 * 4)";

          colorBackground[] = {0.1, 0.1, 0.1, 1};
          text = "Distance";
        };

        class TitleSync: GTA_ctrlStatic
        {
          x = "2 * ((1 / (getResolution select 2)) * 1.25 * 4)";
          y = "8 * ((1 / (getResolution select 3)) * 1.25 * 4)";
          w = "18 * ((1 / (getResolution select 2)) * 1.25 * 4)";
          h = "5 * ((1 / (getResolution select 3)) * 1.25 * 4)";

          style = 1;
          text = "SYNC:";
        };

        class CheckSync: GTA_ctrlCheckbox
        {
          idc = IDC_DISPLAYVIEWSETTINGS_CHECKSYNC;
          x = "20 * ((1 / (getResolution select 2)) * 1.25 * 4)";
          y = "8 * ((1 / (getResolution select 3)) * 1.25 * 4)";
          w = "5 * ((1 / (getResolution select 2)) * 1.25 * 4)";
          h = "5 * ((1 / (getResolution select 3)) * 1.25 * 4)";
        };

        class TitleView: TitleSync
        {
          y = "14 * ((1 / (getResolution select 3)) * 1.25 * 4)";

          text = "VIEW:";
        };

        class SliderView: GTA_ctrlXSliderH
        {
          idc = IDC_DISPLAYVIEWSETTINGS_SLIDERVIEW;
          x = "20 * ((1 / (getResolution select 2)) * 1.25 * 4)";
          y = "14 * ((1 / (getResolution select 3)) * 1.25 * 4)";
          w = "60 * ((1 / (getResolution select 2)) * 1.25 * 4)";
          h = "5 * ((1 / (getResolution select 3)) * 1.25 * 4)";
        };

        class EditView: GTA_ctrlEdit
        {
          idc = IDC_DISPLAYVIEWSETTINGS_EDITVIEW;
          x = "81 * ((1 / (getResolution select 2)) * 1.25 * 4)";
          y = "14 * ((1 / (getResolution select 3)) * 1.25 * 4)";
          w = "17 * ((1 / (getResolution select 2)) * 1.25 * 4)";
          h = "5 * ((1 / (getResolution select 3)) * 1.25 * 4)";

          canModify = 0;
        };

        class TitleObject: TitleSync
        {
          y = "20 * ((1 / (getResolution select 3)) * 1.25 * 4)";

          text = "OBJECT:";
        };

        class SliderObject: SliderView
        {
          idc = IDC_DISPLAYVIEWSETTINGS_SLIDEROBJECT;
          y = "20 * ((1 / (getResolution select 3)) * 1.25 * 4)";
        };

        class EditObject: EditView
        {
          idc = IDC_DISPLAYVIEWSETTINGS_EDITOBJECT;
          y = "20 * ((1 / (getResolution select 3)) * 1.25 * 4)";
        };

        class TitleShadow: TitleSync
        {
          y = "26 * ((1 / (getResolution select 3)) * 1.25 * 4)";

          text = "SHADOWS:";
        };

        class SliderShadows: SliderView
        {
          idc = IDC_DISPLAYVIEWSETTINGS_SLIDERSHADOWS;
          y = "26 * ((1 / (getResolution select 3)) * 1.25 * 4)";
        };

        class EditShadow: EditView
        {
          idc = IDC_DISPLAYVIEWSETTINGS_EDITSHADOWS;
          y = "26 * ((1 / (getResolution select 3)) * 1.25 * 4)";
        };
      };
    };

    class ButtonApply: GTA_ctrlButtonOK
    {
      x = "((getResolution select 2) * 0.5 * (1 / (getResolution select 2))) + (100 * 0.5 - 50 - 2) * ((1 / (getResolution select 2)) * 1.25 * 4)";
      y = "0.5 + (62 * 0.5 - 2 * 	5 - 1) * ((1 / (getResolution select 3)) * 1.25 * 4)";
      w = "25 * ((1 / (getResolution select 2)) * 1.25 * 4)";
      h = "5 * ((1 / (getResolution select 3)) * 1.25 * 4)";

      text = "Apply";
    };

    class ButtonCancel: GTA_ctrlButtonCancel
    {
      x = "((getResolution select 2) * 0.5 * (1 / (getResolution select 2))) + (100 * 0.5 - 25 - 1) * ((1 / (getResolution select 2)) * 1.25 * 4)";
      y = "0.5 + (62 * 0.5 - 2 * 	5 - 1) * ((1 / (getResolution select 3)) * 1.25 * 4)";
      w = "25 * ((1 / (getResolution select 2)) * 1.25 * 4)";
      h = "5 * ((1 / (getResolution select 3)) * 1.25 * 4)";
    };
  };
};
