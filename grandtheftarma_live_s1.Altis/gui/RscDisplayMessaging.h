/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplayMessaging
{
  idd = IDD_RSCDISPLAYMESSAGING;
  scriptName = "GTA_RscDisplayMessaging";
  scriptPath = "GUI";
  onLoad = "[ _this, ""GTA_RscDisplayMessaging"" ] call GTA_fnc_initDisplay";

  class ControlsBackground
  {

    class Tiles: GTA_RscTiles {};

  };

  class Controls
  {

    class GroupInbox: GTA_RscControlsGroupNoScrollbars
    {
      idc = IDC_RSCDISPLAYMESSAGING_GROUPINBOX;
      x = "1.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "0 * ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
      w = "12 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "23.2 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      class Controls
      {

        class Title: GTA_RscTitle
        {
          idc = -1;
          x = "0 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "0 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "12 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          text = "INBOX";
        };

        class Background: GTA_RscText
        {
          idc = -1;
          x = "0 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "1.1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "12 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "21 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 0, 0, 0, 0.7 };
        };

        class ListInbox: GTA_RscListBox
        {
          idc = IDC_RSCDISPLAYMESSAGING_LISTINBOX;
          x = "0.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "1.6 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "11 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "20 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.1 };
          colorPictureSelected[] = { 1, 1, 1, 1 };
          colorSelect[] = { 0, 0, 0, 1 };
          colorSelect2[] = { 0, 0, 0, 1 };
          colorSelectBackground[] = { 1, 1, 1, 0.5 };
          colorSelectBackground2[] = { 1, 1, 1, 0.5 };
          rowHeight = "1.4 *       ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          //sizeEx = "0.8 *       ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
        };

        class ButtonClose: GTA_RscButtonMenuOK
        {
          x = "0 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "22.2 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          shortcuts[] = {};
          default = 0;
          text = "Close";
        };

      };

    };

    class GroupMessage: GTA_RscControlsGroupNoScrollbars
    {
      idc = IDC_RSCDISPLAYMESSAGING_GROUPMESSAGE;
      x = "14.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "0 * ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
      w = "24 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "23.2 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      class Controls
      {

        class Title: GTA_RscTitle
        {
          idc = -1;
          x = "0 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "0 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "24 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          text = "MESSAGE";
        };

        class Background: GTA_RscText
        {
          idc = -1;
          x = "0 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "1.1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "24 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "21 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 0, 0, 0, 0.7 };
        };

        class TextFrom: GTA_RscText
        {
          idc = -1;
          x = "0.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "1.6 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.2 };
          shadow = 0;
          text = "From";
        };

        class ValueFrom: GTA_RscText
        {
          idc = IDC_RSCDISPLAYMESSAGING_VALUEFROM;
          x = "6.6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "1.6 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "16.9 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.1 };
          shadow = 0;
        };

        class TextDate: GTA_RscText
        {
          idc = -1;
          x = "0.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "2.7 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.2 };
          shadow = 0;
          text = "Time";
        };

        class ValueDate: GTA_RscText
        {
          idc = IDC_RSCDISPLAYMESSAGING_VALUEDATE;
          x = "6.6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "2.7 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "16.9 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.1 };
          shadow = 0;
        };

        class TextLocation: GTA_RscText
        {
          idc = -1;
          x = "0.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "3.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.2 };
          shadow = 0;
          text = "Location";
        };

        class ValueLocation: GTA_RscText
        {
          idc = IDC_RSCDISPLAYMESSAGING_VALUELOCATION;
          x = "6.6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "3.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "16.9 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.1 };
          shadow = 0;
        };

        class TextMessage: GTA_RscEdit
        {
          idc = IDC_RSCDISPLAYMESSAGING_TEXTMESSAGE;
          x = "0.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "5.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "23 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "16.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          canModify = 0;
          colorBackground[] = { 1, 1, 1, 0.1 };
          shadow = 0;
          style = "0x00 + 16 + 0x200";
        };

        class ButtonReply: GTA_RscButtonMenu
        {
          idc = IDC_RSCDISPLAYMESSAGING_BUTTONREPLY;
          x = "11.9 *         ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "22.2 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          text = "Reply";
        };

        class ButtonNew: GTA_RscButtonMenu
        {
          idc = IDC_RSCDISPLAYMESSAGING_BUTTONNEW;
          x = "18 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "22.2 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          text = "New";
        };

      };

    };

    class GroupCompose: GTA_RscControlsGroupNoScrollbars
    {
      idc = IDC_RSCDISPLAYMESSAGING_GROUPCOMPOSE;
      x = "14.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
      y = "0 * ( (  ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
      w = "24 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
      h = "23.2 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      class Controls
      {

        class Title: GTA_RscTitle
        {
          idc = -1;
          x = "0 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "0 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "24 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          text = "COMPOSE";
        };

        class Background: GTA_RscText
        {
          idc = -1;
          x = "0 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "1.1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "24 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "21 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 0, 0, 0, 0.7 };
        };

        class TextType: GTA_RscText
        {
          idc = -1;
          x = "0.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "1.6 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.2 };
          shadow = 0;
          text = "Type";
        };

        class ValueType: GTA_RscText
        {
          idc = IDC_RSCDISPLAYMESSAGING_VALUETYPE;
          x = "6.6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "1.6 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "16.9 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.1 };
          shadow = 0;
        };

        class TextLength: GTA_RscText
        {
          idc = -1;
          x = "0.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "2.7 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.2 };
          shadow = 0;
          text = "Length";
        };

        class ValueLength: GTA_RscText
        {
          idc = IDC_RSCDISPLAYMESSAGING_VALUELENGTH;
          x = "6.6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "2.7 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "16.9 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.1 };
          shadow = 0;
        };

        class TextLocation: GTA_RscText
        {
          idc = -1;
          x = "0.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "3.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.2 };
          shadow = 0;
          text = "Location";
        };

        class CheckLocation: GTA_RscCheckbox
        {
          idc = IDC_RSCDISPLAYMESSAGING_CHECKLOCATION;
          x = "6.6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "3.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "1 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          tooltip = "Enabling location will send your current GRID reference with the message.";
        };

        class BackgroundCompose: GTA_RscText
        {
          idc = -1;
          x = "0.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "5.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "23 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "16.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorBackground[] = { 1, 1, 1, 0.1 };
        };

        class EditCompose: GTA_RscEdit
        {
          idc = IDC_RSCDISPLAYMESSAGING_EDITCOMPOSE;
          x = "0.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "5.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "23 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "16.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          shadow = 0;
          style = "0x00 + 16 + 0x200";
        };

        class TextCompose: GTA_RscText
        {
          idc = IDC_RSCDISPLAYMESSAGING_TEXTCOMPOSE;
          x = "0.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "5.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "23 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "16.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          colorText[] = { 1, 1, 1, 0.7 };
          shadow = 0;
          style = 2;
          text = "Message...";
        };

        class ButtonDiscard: GTA_RscButtonMenu
        {
          idc = IDC_RSCDISPLAYMESSAGING_BUTTONDISCARD;
          x = "11.9 *         ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "22.2 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          text = "Discard";
        };

        class ButtonSend: GTA_RscButtonMenu
        {
          idc = IDC_RSCDISPLAYMESSAGING_BUTTONSEND;
          x = "18 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          y = "22.2 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
          w = "6 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
          h = "1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

          shortcuts[] = { "0x00050000 + 0", 28, 57, 156 };
          text = "Send";
        };

      };

    };

  };

};
