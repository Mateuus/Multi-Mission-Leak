/**
* Copyright © 2015 DnA, Grand Theft ArmA.
* All Rights Reserved.
*/

class GTA_ScrollBar
{
  color[] = {1,1,1,0.6};
  colorActive[] = {1,1,1,1};
  colorDisabled[] = {1,1,1,0.3};
  thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
  arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
  arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
  border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
  shadow = 0;
  scrollSpeed = 0.06;
  width = 0;
  height = 0;
  autoScrollEnabled = 0;
  autoScrollSpeed = -1;
  autoScrollDelay = 5;
  autoScrollRewind = 0;
};

class GTA_RscControlsGroup
{
  type = 15;
  style = 16;
  idc = -1;
  x = 0;
  y = 0;
  w = 1;
  h = 1;
  shadow = 0;
  class VScrollbar: GTA_ScrollBar
  {
    width = 0.021;
    autoScrollEnabled = 1;
  };
  class HScrollbar: GTA_ScrollBar
  {
    height = 0.028;
  };
  class Controls{};
};

class GTA_RscControlsGroupNoHScrollbars: GTA_RscControlsGroup
{
  class HScrollbar: HScrollbar
  {
    height = 0;
  };
};

class GTA_RscControlsGroupNoVScrollbars: GTA_RscControlsGroup
{
  class VScrollbar: VScrollbar
  {
    width = 0;
  };
};

class GTA_RscControlsGroupNoScrollbars: GTA_RscControlsGroup
{
  class VScrollbar: VScrollbar
  {
    width = 0;
  };
  class HScrollbar: HScrollbar
  {
    height = 0;
  };
};

class GTA_RscText
{
  access = 0;
  type = 0;
  text = "";
  x = 0;
  y = 0;
  h = 0.037;
  w = 0.3;
  style = 0;
  shadow = 1;
  colorShadow[] = {0,0,0,0.5};
  font = "PuristaMedium";
  SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  colorText[] = {1,1,1,1.0};
  colorBackground[] = {0,0,0,0};
  linespacing = 1;
  tooltipColorText[] = {1,1,1,1};
  tooltipColorBox[] = {1,1,1,1};
  tooltipColorShade[] = {0,0,0,0.65};
};

class GTA_RscTitle: GTA_RscText
{
  shadow = 0;
  style = 0;
  sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  colorBackground[] = { "( profilenamespace getVariable [ 'GUI_BCG_RGB_R', 0.77 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_G', 0.51 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_B', 0.08 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_A', 0.8 ] )" };
  colorSelect[] = {0.95,0.95,0.95,1};
};

class GTA_RscWatermark: GTA_RscText
{
  shadow = 0;
  style = 1;
  text = "GTA";
  colorSelect[] = {0.95,0.95,0.95,1};
};

class GTA_RscStructuredText
{
  type = 13;
  style = 0;
  x = 0;
  y = 0;
  h = 0.035;
  w = 0.1;
  text = "";
  size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
  colorText[] = {1,1,1,1.0};
  shadow = 1;
  class Attributes
  {
    font = "PuristaMedium";
    color = "#ffffff";
    align = "left";
    shadow = 1;
  };
};

class GTA_RscActiveText
{
  access = 0;
  default = 0;
  type = 11;
  idc = -1;
  x = 0;
  y = 0;
  h = 0.035;
  w = 0.035;
  text = "";
  font = "PuristaMedium";
  shadow = 2;
  sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  color[] = {0,0,0,1};
  colorText[] = {0,0,0,1};
  colorActive[] = {0.3,0.4,0,1};
  colorDisabled[] = {1, 1, 1, 0.25};
  tooltipColorText[] = {1,1,1,1};
  tooltipColorBox[] = {1,1,1,1};
  tooltipColorShade[] = {0,0,0,0.65};
  soundClick[] = {"",0.1,1};
  soundEnter[] = {"",0.1,1};
  soundEscape[] = {"",0.1,1};
  soundPush[] = {"",0.1,1};
};

class GTA_RscActivePicture: GTA_RscActiveText
{
  style = 48;
  color[] = {1,1,1,0.5};
  colorActive[] = {1,1,1,1};
};

class GTA_RscActivePictureKeepAspect: GTA_RscActivePicture
{
  style = "0x30 + 0x800";
};

class GTA_RscEdit
{
  type = 2;
  autoComplete = "";
  text = "";
  style = "0x00 + 0x40";
  font = "PuristaMedium";
  shadow = 2;
  sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  colorBackground[] = {0,0,0,0};
  colorText[] = {0.95,0.95,0.95,1};
  colorDisabled[] = {1,1,1,0.25};
  colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
  canModify = 1;
  tooltipColorText[] = {1,1,1,1};
  tooltipColorBox[] = {1,1,1,1};
  tooltipColorShade[] = {0,0,0,0.65};
};

class GTA_RscPicture
{
  access = 0;
  type = 0;
  idc = -1;
  style = 48;
  shadow = 0;
  colorText[] = {1,1,1,1};
  colorBackground[] = {0,0,0,0};
  text = "";
  font = "PuristaMedium";
  sizeEx = 0;
  lineSpacing = 0;
  fixedWidth = 0;
  x = 0;
  y = 0;
  w = 0.2;
  h = 0.15;
  tooltipColorText[] = {1,1,1,1};
  tooltipColorBox[] = {1,1,1,1};
  tooltipColorShade[] = {0,0,0,0.65};
};

class GTA_RscPictureKeepAspect: GTA_RscPicture
{
  style = "0x30 + 0x800";
};

class GTA_RscCheckBox
{
  idc = -1;
  type = 77;
  style = 0;
  checked = 0;
  x = "0.375* safezoneW + safezoneX";
  y = "0.36* safezoneH + safezoneY";
  w = "0.025* safezoneW";
  h = "0.04* safezoneH";
  color[] = {1,1,1,0.7};
  colorFocused[] = {1,1,1,1};
  colorHover[] = {1,1,1,1};
  colorPressed[] = {1,1,1,1};
  colorDisabled[] = {1,1,1,0.2};
  colorBackground[] = {0,0,0,0};
  colorBackgroundFocused[] = {0,0,0,0};
  colorBackgroundHover[] = {0,0,0,0};
  colorBackgroundPressed[] = {0,0,0,0};
  colorBackgroundDisabled[] = {0,0,0,0};
  textureChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
  textureUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
  textureFocusedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
  textureFocusedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
  textureHoverChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
  textureHoverUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
  texturePressedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
  texturePressedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
  textureDisabledChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
  textureDisabledUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
  tooltipColorText[] = {1,1,1,1};
  tooltipColorBox[] = {1,1,1,1};
  tooltipColorShade[] = {0,0,0,0.65};
  soundEnter[] = {"",0.1,1};
  soundPush[] = {"",0.1,1};
  soundClick[] = {"",0.1,1};
  soundEscape[] = {"",0.1,1};
};

class GTA_RscToolbox
{
  type = 6;
  style = 2;
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.025;
	rows = 1;
	columns = 2;
	strings[] = {"",""};
	colorText[] = {0.95,0.95,0.95,1};
	color[] = {0.95,0.95,0.95,1};
	colorTextSelect[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorTextDisable[] = {0.4,0.4,0.4,1};
	colorDisable[] = {0.4,0.4,0.4,1};
	colorSelectedBg[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",0.5};
	font = "RobotoCondensed";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
};

class GTA_RscTextCheckBox
{
  idc = -1;
  type = 7;
  style = 0;
  x = "LINE_X(XVAL)";
  y = "LINE_Y";
  w = "LINE_W(WVAL)";
  h = 0.029412;
  colorText[] = {1,0,0,1};
  color[] = {0,0,0,0};
  colorBackground[] = {0,0,1,1};
  colorTextSelect[] = {0,0.8,0,1};
  colorSelectedBg[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
  colorSelect[] = {0,0,0,1};
  colorTextDisable[] = {0.4,0.4,0.4,1};
  colorDisable[] = {0.4,0.4,0.4,1};
  tooltipColorText[] = {1,1,1,1};
  tooltipColorBox[] = {1,1,1,1};
  tooltipColorShade[] = {0,0,0,0.65};
  font = "PuristaMedium";
  sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 0.8)";
  rows = 1;
  columns = 1;
  strings[] = {"UNCHECKED"};
  checked_strings[] = {"CHECKED"};
};

class GTA_RscProgress
{
  access = 0;
  type = 8;
  style = 0;
  x = 0.344;
  y = 0.619;
  w = 0.3137255;
  h = 0.0261438;
  shadow = 2;
  texture = "#(argb,8,8,3)color(1,1,1,1)";
  colorFrame[] = {0,0,0,0};
  colorBar[] = { "( profilenamespace getVariable [ 'GUI_BCG_RGB_R', 0.77 ] )","( profilenamespace getVariable [ 'GUI_BCG_RGB_G', 0.51 ] )","( profilenamespace getVariable [ 'GUI_BCG_RGB_B', 0.08 ] )","( profilenamespace getVariable [ 'GUI_BCG_RGB_A', 0.8 ] )" };
};

class GTA_RscCombo
{
  deletable = 0;
  fade = 0;
  access = 0;
  type = 4;
  colorSelect[] = {0, 0, 0, 1};
  colorText[] = {1, 1, 1, 1};
  colorBackground[] = {0, 0, 0, 1};
  colorScrollbar[] = {1, 0, 0, 1};
  colorDisabled[] = {1, 1, 1, 0.25};
  colorPicture[] = {1, 1, 1, 1};
  colorPictureSelected[] = {1, 1, 1, 1};
  colorPictureDisabled[] = {1, 1, 1, 0.25};
  colorPictureRight[] = {1, 1, 1, 1};
  colorPictureRightSelected[] = {1, 1, 1, 1};
  colorPictureRightDisabled[] = {1, 1, 1, 0.25};
  colorTextRight[] = {1, 1, 1, 1};
  colorSelectRight[] = {0, 0, 0, 1};
  colorSelect2Right[] = {0, 0, 0, 1};
  tooltipColorText[] = {1, 1, 1, 1};
  tooltipColorBox[] = {1, 1, 1, 1};
  tooltipColorShade[] = {0, 0, 0, 0.65};
  soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect", 0.1, 1};
  soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand", 0.1, 1};
  soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse", 0.1, 1};
  maxHistoryDelay = 1;
  style = "0x10 + 0x200";
  font = "PuristaMedium";
  sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
  shadow = 0;
  x = 0;
  y = 0;
  w = 0.12;
  h = 0.035;
  colorSelectBackground[] = {1, 1, 1, 0.7};
  arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
  arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
  wholeHeight = 0.45;
  colorActive[] = {1, 0, 0, 1};

  class ComboScrollBar: GTA_ScrollBar
  {
    color[] = {1, 1, 1, 1};
  };
};

class GTA_RscTree
{
  type = 12;
  access = 0;
  style = 0;
  font = "PuristaMedium";
  sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  expandedTexture = "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa";
  hiddenTexture = "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
  multiselectEnabled = 0;
  maxHistoryDelay = 1;
  rowHeight = 0.0439091;
  colorArrow[] = {1,1,1,1};
  colorMarked[] = {0.2,0.3,0.7,1};
  colorMarkedSelected[] = {0,0.5,0.5,1};
  colorMarkedText[] = {0,0,0,1};
  colorText[] = {1,1,1,1.0};
  colorSelect[] = {1,1,1,0.7};
  colorSelectText[] = {0,0,0,1};
  colorBackground[] = {0,0,0,0};
  colorSelectBackground[] = {0,0,0,0.5};
  colorBorder[] = {0,0,0,0};
  colorDisabled[] = {1,1,1,0.25};
  borderSize = 0;
  expandOnDoubleclick = 1;
  class ScrollBar: GTA_ScrollBar{};
};

class GTA_RscListBox
{
  access = 0;
  type = 5;
  style = 16;
  font = "PuristaMedium";
  sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
  shadow = 0;
  colorShadow[] = {0,0,0,0.5};
  colorText[] = {1,1,1,1.0};
  colorDisabled[] = {1,1,1,0.25};
  colorScrollbar[] = {1,0,0,0};
  colorSelect[] = {0,0,0,1};
  colorSelect2[] = {0,0,0,1};
  colorSelectBackground[] = {0.95,0.95,0.95,1};
  colorSelectBackground2[] = {1,1,1,0.5};
  period = 1.2;
  colorBackground[] = {0,0,0,0.3};
  maxHistoryDelay = 1.0;
  colorPicture[] = {1,1,1,1};
  colorPictureSelected[] = {1,1,1,1};
  colorPictureDisabled[] = {1,1,1,1};
  tooltipColorText[] = {1,1,1,1};
  tooltipColorBox[] = {1,1,1,1};
  tooltipColorShade[] = {0,0,0,0.65};
  rowHeight = 0;
  soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
  class ListScrollBar: GTA_ScrollBar
  {
    color[] = {1,1,1,1};
    autoScrollEnabled = 1;
  };
};

class GTA_RscListNBox
{
  type = 102;
  access = 0;
  style = 16;
  shadow = 0;
  font = "PuristaMedium";
  sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  color[] = {0.95,0.95,0.95,1};
  colorBackground[] = {0,0,0,1};
  colorText[] = {1,1,1,1.0};
  colorDisabled[] = {1,1,1,0.25};
  colorScrollbar[] = {0.95,0.95,0.95,1};
  colorSelect[] = {0,0,0,1};
  colorSelect2[] = {0,0,0,1};
  colorSelectBackground[] = {0.95,0.95,0.95,1};
  colorSelectBackground2[] = {1,1,1,0.5};
  columns[] = {0.3,0.6,0.7};
  autoScrollDelay = 5;
  autoScrollRewind = 0;
  autoScrollSpeed = -1;
  drawSideArrows = 0;
  arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
  arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
  idcLeft = -1;
  idcRight = -1;
  period = 1.2;
  rowHeight = 0;
  maxHistoryDelay = 1;
  soundSelect[] = {"",0.1,1};
  class ListScrollBar: GTA_ScrollBar{};
  class ScrollBar: GTA_ScrollBar{};
};

class GTA_RscXSliderH
{
  type = 43;
  style = "0x400	+ 0x10";
  shadow = 0;
  x = 0;
  y = 0;
  h = 0.029412;
  w = 0.4;
  color[] = {1,1,1,0.6};
  colorActive[] = {1,1,1,1};
  colorDisabled[] = {1,1,1,0.2};
  arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
  arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
  border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
  thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
  tooltipColorText[] = {1,1,1,1};
  tooltipColorBox[] = {1,1,1,1};
  tooltipColorShade[] = {0,0,0,0.65};
};

class GTA_RscXListBox
{
  type = 42;
  style = "0x400 + 0x02 +	0x10";
  shadow = 2;
  color[] = {1,1,1,0.6};
  colorActive[] = {1,1,1,1};
  colorDisabled[] = {1,1,1,0.25};
  colorSelect[] = {0.95,0.95,0.95,1};
  colorText[] = {1,1,1,1};
  arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
  arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
  border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
  w = 0.14706;
  h = 0.039216;
  font = "PuristaMedium";
  sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
  tooltipColorText[] = {1,1,1,1};
  tooltipColorBox[] = {1,1,1,1};
  tooltipColorShade[] = {0,0,0,0.65};
};

class GTA_RscButton
{
  type = 1;
  text = "";
  style = 2;
  x = 0;
  y = 0;
  w = 0.095589;
  h = 0.039216;
  shadow = 2;
  font = "PuristaMedium";
  sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  colorText[] = {1,1,1,1.0};
  colorDisabled[] = {1,1,1,0.25};
  colorBackground[] = {0,0,0,0.5};
  colorBackgroundActive[] = {0,0,0,1};
  colorBackgroundDisabled[] = {0,0,0,0.5};
  offsetX = 0;
  offsetY = 0;
  offsetPressedX = 0;
  offsetPressedY = 0;
  colorFocused[] = {0,0,0,1};
  colorShadow[] = {0,0,0,0};
  colorBorder[] = {0,0,0,1};
  borderSize = 0.0;
  soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
  soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
  soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
  soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
  period = 1.2;
  periodFocus = 1.2;
  periodOver = 1.2;
};

class GTA_RscShortcutButton
{
  type = 16;
  textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
  idc = -1;
  style = 0;
  default = 0;
  shadow = 1;
  w = 0.183825;
  h = "(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
  color[] = {1,1,1,1.0};
  colorFocused[] = {1,1,1,1.0};
  color2[] = {0.95,0.95,0.95,1};
  colorDisabled[] = {1,1,1,0.25};
  colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
  colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
  colorBackground2[] = {1,1,1,1};
  animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
  animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
  animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
  animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
  animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
  animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
  periodFocus = 1.2;
  periodOver = 0.8;
  class HitZone
  {
    left = 0.0;
    top = 0.0;
    right = 0.0;
    bottom = 0.0;
  };
  class ShortcutPos
  {
    left = 0;
    top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)) / 2";
    w = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)* (3/4)";
    h = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  };
  class TextPos
  {
    left = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)* (3/4)";
    top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)) / 2";
    right = 0.005;
    bottom = 0.0;
  };
  period = 0.4;
  font = "PuristaMedium";
  size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  text = "";
  soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
  soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
  soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
  soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
  action = "";
  class Attributes
  {
    font = "PuristaMedium";
    color = "#E5E5E5";
    align = "left";
    shadow = "1";
  };
  class AttributesImage
  {
    font = "PuristaMedium";
    color = "#E5E5E5";
    align = "left";
  };
};

class GTA_RscButtonMenu : GTA_RscShortcutButton
{
  type = 16;
  style = "0x02 + 0xC0";
  default = 0;
  shadow = 0;
  x = 0;
  y = 0;
  w = 0.095589;
  h = 0.039216;
  animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
  animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
  animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
  animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
  animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
  animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
  colorBackground[] = {0,0,0,0.8};
  colorBackgroundFocused[] = {1,1,1,1};
  colorBackground2[] = {0.75,0.75,0.75,1};
  color[] = {1,1,1,1};
  colorFocused[] = {0,0,0,1};
  color2[] = {0,0,0,1};
  colorText[] = {1,1,1,1};
  colorDisabled[] = {1,1,1,0.25};
  period = 1.2;
  periodFocus = 1.2;
  periodOver = 1.2;
  size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)";
  tooltipColorText[] = {1,1,1,1};
  tooltipColorBox[] = {1,1,1,1};
  tooltipColorShade[] = {0,0,0,0.65};
  class TextPos
  {
    left = "0.25* 			(			((safezoneW / safezoneH) min 1.2) / 40)";
    top = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 1)) / 2";
    right = 0.005;
    bottom = 0.0;
  };
  class Attributes
  {
    font = "PuristaLight";
    color = "#E5E5E5";
    align = "left";
    shadow = "0";
  };
  class ShortcutPos
  {
    left = "(6.25* 			(			((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
    top = 0.005;
    w = 0.0225;
    h = 0.03;
  };
  soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
  soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
  soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
  soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
};

class GTA_RscButtonMenuOK : GTA_RscButtonMenu
{
  idc = 1;
  shortcuts[] = {"0x00050000 + 0",28,57,156};
  default = 1;
  text = "$STR_DISP_OK";
  soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",0.09,1};
};

class GTA_RscButtonMenuCancel : GTA_RscButtonMenu
{
  idc = 2;
  shortcuts[] = {"0x00050000 + 1"};
  text = "$STR_DISP_CANCEL";
};

class GTA_RscFrame
{
  type = 0;
  idc = -1;
  style = 64;
  shadow = 2;
  colorBackground[] = {0,0,0,0};
  colorText[] = {1,1,1,1};
  font = "PuristaMedium";
  sizeEx = 0.02;
  text = "";
};

class GTA_RscVignette: GTA_RscPicture
{
  x = "safezoneXAbs";
  y = "safezoneY";
  w = "safezoneWAbs";
  h = "safezoneH";
  text = "\A3\ui_f\data\gui\rsccommon\rscvignette\vignette_gs.paa";
  colortext[] = {0,0,0,0.3};
};

class GTA_RscMapControl
{
  type = 101;
  style = 48;
  moveOnEdges = 1;
  x = "SafeZoneXAbs";
  y = "SafeZoneY + 1.5* 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
  w = "SafeZoneWAbs";
  h = "SafeZoneH - 1.5* 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
  shadow = 0;
  ptsPerSquareSea = 5;
  ptsPerSquareTxt = 20;
  ptsPerSquareCLn = 10;
  ptsPerSquareExp = 10;
  ptsPerSquareCost = 10;
  ptsPerSquareFor = 9;
  ptsPerSquareForEdge = 9;
  ptsPerSquareRoad = 6;
  ptsPerSquareObj = 9;
  showCountourInterval = 0;
  scaleMin = 0.001;
  scaleMax = 1.0;
  scaleDefault = 0.16;
  maxSatelliteAlpha = 0.85;
  alphaFadeStartScale = 2;
  alphaFadeEndScale = 2;
  colorText[] = {0,0,0,1};
  colorBackground[] = {0.969,0.957,0.949,1.0};
  colorSea[] = {0.467,0.631,0.851,0.5};
  colorForest[] = {0.624,0.78,0.388,0.5};
  colorForestBorder[] = {0.0,0.0,0.0,0.0};
  colorRocks[] = {0.0,0.0,0.0,0.3};
  colorRocksBorder[] = {0.0,0.0,0.0,0.0};
  colorLevels[] = {0.286,0.177,0.094,0.5};
  colorMainCountlines[] = {0.572,0.354,0.188,0.5};
  colorCountlines[] = {0.572,0.354,0.188,0.25};
  colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
  colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
  colorPowerLines[] = {0.1,0.1,0.1,1.0};
  colorRailWay[] = {0.8,0.2,0.0,1.0};
  colorNames[] = {0.1,0.1,0.1,0.9};
  colorInactive[] = {1.0,1.0,1.0,0.5};
  colorOutside[] = {0.0,0.0,0.0,1.0};
  colorTracks[] = {0.84,0.76,0.65,0.15};
  colorTracksFill[] = {0.84,0.76,0.65,1.0};
  colorRoads[] = {0.7,0.7,0.7,1.0};
  colorRoadsFill[] = {1.0,1.0,1.0,1.0};
  colorMainRoads[] = {0.9,0.5,0.3,1.0};
  colorMainRoadsFill[] = {1.0,0.6,0.4,1.0};
  colorGrid[] = {0.1,0.1,0.1,0.6};
  colorGridMap[] = {0.1,0.1,0.1,0.6};
  font = "TahomaB";
  sizeEx = 0.04;
  fontLabel = "PuristaMedium";
  sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 0.8)";
  fontGrid = "TahomaB";
  sizeExGrid = 0.02;
  fontUnits = "TahomaB";
  sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 0.8)";
  fontNames = "EtelkaNarrowMediumPro";
  sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 0.8)* 2";
  fontInfo = "PuristaMedium";
  sizeExInfo = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 0.8)";
  fontLevel = "TahomaB";
  sizeExLevel = 0.02;
  text = "#(argb,8,8,3)color(1,1,1,1)";
  class ActiveMarker
  {
    color[] = {0.3,0.1,0.9,1};
    size = 50;
  };
  class Legend
  {
    x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
    y = "SafeZoneY + safezoneH - 4.5* 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    w = "10* 					(			((safezoneW / safezoneH) min 1.2) / 40)";
    h = "3.5* 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    font = "PuristaMedium";
    sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)* 0.8)";
    colorBackground[] = {1,1,1,0.5};
    color[] = {0,0,0,1};
  };
  class Task
  {
    icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
    iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
    iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
    iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
    iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
    color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
    colorCreated[] = {1,1,1,1};
    colorCanceled[] = {0.7,0.7,0.7,1};
    colorDone[] = {0.7,1,0.3,1};
    colorFailed[] = {1,0.3,0.2,1};
    size = 27;
    importance = 1;
    coefMin = 1;
    coefMax = 1;
  };
  class Waypoint
  {
    coefMin = 1;
    coefMax = 1;
    icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
    color[] = {0,0,0,1};
    importance = 1;
    size = 24;
  };
  class WaypointCompleted
  {
    coefMin = 1;
    coefMax = 1;
    icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
    color[] = {0,0,0,1};
    importance = 1;
    size = 24;
  };
  class CustomMark
  {
    icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
    size = 24;
    importance = 1;
    coefMin = 1;
    coefMax = 1;
    color[] = {0,0,0,1};
  };
  class Command
  {
    icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
    size = 18;
    importance = 1;
    coefMin = 1;
    coefMax = 1;
    color[] = {1,1,1,1};
  };
  class Bush
  {
    icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
    color[] = {0.45,0.64,0.33,0.4};
    size = "14/2";
    importance = "0.2* 14* 0.05* 0.05";
    coefMin = 0.25;
    coefMax = 4;
  };
  class Rock
  {
    icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
    color[] = {0.1,0.1,0.1,0.8};
    size = 12;
    importance = "0.5* 12* 0.05";
    coefMin = 0.25;
    coefMax = 4;
  };
  class SmallTree
  {
    icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
    color[] = {0.45,0.64,0.33,0.4};
    size = 12;
    importance = "0.6* 12* 0.05";
    coefMin = 0.25;
    coefMax = 4;
  };
  class Tree
  {
    icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
    color[] = {0.45,0.64,0.33,0.4};
    size = 12;
    importance = "0.9* 16* 0.05";
    coefMin = 0.25;
    coefMax = 4;
  };
  class busstop
  {
    icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class fuelstation
  {
    icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class hospital
  {
    icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class church
  {
    icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class lighthouse
  {
    icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class power
  {
    icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class powersolar
  {
    icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class powerwave
  {
    icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class powerwind
  {
    icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class quay
  {
    icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class shipwreck
  {
    icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class transmitter
  {
    icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class watertower
  {
    icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {1,1,1,1};
  };
  class Cross
  {
    icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {0,0,0,1};
  };
  class Chapel
  {
    icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
    size = 24;
    importance = 1;
    coefMin = 0.85;
    coefMax = 1.0;
    color[] = {0,0,0,1};
  };
  class Bunker
  {
    icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
    size = 14;
    importance = "1.5* 14* 0.05";
    coefMin = 0.25;
    coefMax = 4;
    color[] = {0,0,0,1};
  };
  class Fortress
  {
    icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
    size = 16;
    importance = "2* 16* 0.05";
    coefMin = 0.25;
    coefMax = 4;
    color[] = {0,0,0,1};
  };
  class Fountain
  {
    icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
    size = 11;
    importance = "1* 12* 0.05";
    coefMin = 0.25;
    coefMax = 4;
    color[] = {0,0,0,1};
  };
  class Ruin
  {
    icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
    size = 16;
    importance = "1.2* 16* 0.05";
    coefMin = 1;
    coefMax = 4;
    color[] = {0,0,0,1};
  };
  class Stack
  {
    icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
    size = 20;
    importance = "2* 16* 0.05";
    coefMin = 0.9;
    coefMax = 4;
    color[] = {0,0,0,1};
  };
  class Tourism
  {
    icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
    size = 16;
    importance = "1* 16* 0.05";
    coefMin = 0.7;
    coefMax = 4;
    color[] = {0,0,0,1};
  };
  class ViewTower
  {
    icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
    size = 16;
    importance = "2.5* 16* 0.05";
    coefMin = 0.5;
    coefMax = 4;
    color[] = {0,0,0,1};
  };
};

class GTA_RscTiles: GTA_RscControlsGroupNoScrollbars
{
  idc = 115099;
  x = "safezoneX";
  y = "safezoneY";
  w = "safezoneW";
  h = "safezoneH";
  disableCustomColors = 1;

  class Controls
  {

    class TileFrame: GTA_RscFrame
    {
      idc = 114999;
      x = 0;
      y = 0;
      w = "safezoneW";
      h = "safezoneH";
      colortext[] = { 0,0,0,1 };
    };

    class Tile_0_0: GTA_RscText
    {
      idc = 115000;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_1: GTA_RscText
    {
      idc = 115001;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_2: GTA_RscText
    {
      idc = 115002;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_3: GTA_RscText
    {
      idc = 115003;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_4: GTA_RscText
    {
      idc = 115004;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_5: GTA_RscText
    {
      idc = 115005;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_0: GTA_RscText
    {
      idc = 115010;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_1: GTA_RscText
    {
      idc = 115011;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_2: GTA_RscText
    {
      idc = 115012;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_3: GTA_RscText
    {
      idc = 115013;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_4: GTA_RscText
    {
      idc = 115014;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_5: GTA_RscText
    {
      idc = 115015;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_0: GTA_RscText
    {
      idc = 115020;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_1: GTA_RscText
    {
      idc = 115021;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_2: GTA_RscText
    {
      idc = 115022;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_3: GTA_RscText
    {
      idc = 115023;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_4: GTA_RscText
    {
      idc = 115024;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_5: GTA_RscText
    {
      idc = 115025;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_0: GTA_RscText
    {
      idc = 115030;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_1: GTA_RscText
    {
      idc = 115031;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_2: GTA_RscText
    {
      idc = 115032;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_3: GTA_RscText
    {
      idc = 115033;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_4: GTA_RscText
    {
      idc = 115034;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_5: GTA_RscText
    {
      idc = 115035;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_0: GTA_RscText
    {
      idc = 115040;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_1: GTA_RscText
    {
      idc = 115041;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_2: GTA_RscText
    {
      idc = 115042;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_3: GTA_RscText
    {
      idc = 115043;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_4: GTA_RscText
    {
      idc = 115044;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_5: GTA_RscText
    {
      idc = 115045;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_0: GTA_RscText
    {
      idc = 115050;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_1: GTA_RscText
    {
      idc = 115051;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_2: GTA_RscText
    {
      idc = 115052;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_3: GTA_RscText
    {
      idc = 115053;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_4: GTA_RscText
    {
      idc = 115054;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_5: GTA_RscText
    {
      idc = 115055;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

  };

};
