/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_ctrlDefault
{
  access = 0;
  idc = -1;
  style = 0;
  default = 0;
  show = 1;
  fade = 0;
  blinkingPeriod = 0;
  deletable = 0;
  x = 0;
  y = 0;
  w = 0;
  h = 0;
  tooltip = "";
  tooltipMaxWidth = 0.3;
  tooltipColorShade[] = {0, 0, 0, 1};
  tooltipColorText[] = {1, 1, 1, 1};
  tooltipColorBox[] = {0, 0, 0, 0};

  class ScrollBar
  {
    width = 0;
    height = 0;
    scrollSpeed = 0.06;
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    color[] = {1, 1, 1, 1};
  };
};

class GTA_ctrlDefaultText: GTA_ctrlDefault
{
  sizeEx = "4.32 * (1 / (getResolution select 3)) * 1.25 * 4";
  font = "PuristaMedium";
  shadow = 1;
};

class GTA_ctrlDefaultButton: GTA_ctrlDefaultText
{
  soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
  soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
  soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
  soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
};

class GTA_ctrlControlsGroup: GTA_ctrlDefault
{
  type = 15;
  style = 16;
  x = 0;
  y = 0;
  w = 1;
  h = 1;
  onCanDestroy = "";
  onDestroy = "";
  onMouseButtonDown = "";
  onMouseButtonUp = "";
  onMouseButtonClick = "";
  onMouseButtonDblClick = "";
  onMouseZChanged = "";
  onMouseMoving = "";
  onMouseHolding = "";

  class VScrollBar: ScrollBar
  {
    width = "2 * ((1 / (getResolution select 2)) * 	1.25 * 4)";
    height = 0;
    autoScrollEnabled = 0;
    autoScrollDelay = 1;
    autoScrollRewind = 1;
    autoScrollSpeed = 1;
  };
  class HScrollBar: ScrollBar
  {
    width = 0;
    height = "2 * ((1 / (getResolution select 3)) * 	1.25 * 4)";
  };
};

class GTA_ctrlControlsGroupNoScrollbars: GTA_ctrlControlsGroup
{
  class VScrollbar: VScrollBar
  {
    width = 0;
  };
  class HScrollbar: HScrollBar
  {
    height = 0;
  };
};

class GTA_ctrlControlsGroupNoHScrollbars: GTA_ctrlControlsGroup
{
  class HScrollbar: HScrollBar
  {
    height = 0;
  };
};

class GTA_ctrlControlsGroupNoVScrollbars: GTA_ctrlControlsGroup
{
  class VScrollbar: VScrollBar
  {
    width = 0;
  };
};

class GTA_ctrlStatic: GTA_ctrlDefaultText
{
  type = 0;
  colorBackground[] = {0, 0, 0, 0};
  text = "";
  lineSpacing = 1;
  fixedWidth = 0;
  colorText[] = {1, 1, 1, 1};
  colorShadow[] = {0, 0, 0, 1};
  moving = 0;
  autoplay = 0;
  loops = 0;
  tileW = 1;
  tileH = 1;
  onCanDestroy = "";
  onDestroy = "";
  onMouseEnter = "";
  onMouseExit = "";
  onSetFocus = "";
  onKillFocus = "";
  onKeyDown = "";
  onKeyUp = "";
  onMouseButtonDown = "";
  onMouseButtonUp = "";
  onMouseButtonClick = "";
  onMouseButtonDblClick = "";
  onMouseZChanged = "";
  onMouseMoving = "";
  onMouseHolding = "";
  onVideoStopped = "";
};

class GTA_ctrlStaticPicture: GTA_ctrlStatic
{
  style = 48;
};

class GTA_ctrlStaticPictureKeepAspect: GTA_ctrlStaticPicture
{
  style = "0x30 + 0x800";
};

class GTA_ctrlStaticPictureTile: GTA_ctrlStatic
{
  style = 144;
};

class GTA_ctrlStaticFrame: GTA_ctrlStatic
{
  style = 64;
};

class GTA_ctrlStaticLine: GTA_ctrlStatic
{
  style = 176;
};

class GTA_ctrlStaticMulti: GTA_ctrlStatic
{
  style = "0x10 + 0x200";
};

class GTA_ctrlStaticBackground: GTA_ctrlStatic
{
  colorBackground[] = {0.2, 0.2, 0.2, 1};
};

class GTA_ctrlStaticOverlay: GTA_ctrlStatic
{
  colorBackground[] = {0, 0, 0, 0.5};
};

class GTA_ctrlStaticTitle: GTA_ctrlStatic
{
  moving = 1;
  colorBackground[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  colorText[] = {1, 1, 1, 1};
};

class GTA_ctrlStaticFooter: GTA_ctrlStatic
{
  colorBackground[] = {0, 0, 0, 0.3};
};

class GTA_ctrlStaticBackgroundDisable: GTA_ctrlStatic
{
  x = -4;
  y = -2;
  w = 8;
  h = 4;
  colorBackground[] = {1, 1, 1, 0.5};
};

class GTA_ctrlButton: GTA_ctrlDefaultButton
{
  type = 1;
  style = 2;
  colorBackground[] = {0, 0, 0, 1};
  colorBackgroundDisabled[] = {0, 0, 0, 0.5};
  colorBackgroundActive[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  colorFocused[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  font = "PuristaLight";
  text = "";
  colorText[] = {1, 1, 1, 1};
  colorDisabled[] = {1, 1, 1, 0.25};
  borderSize = 0;
  colorBorder[] = {0, 0, 0, 0};
  colorShadow[] = {0, 0, 0, 0};
  offsetX = 0;
  offsetY = 0;
  offsetPressedX = "(1 / (getResolution select 2))";
  offsetPressedY = "(1 / (getResolution select 3))";
  period = 0;
  periodFocus = 2;
  periodOver = 0.5;
  onCanDestroy = "";
  onDestroy = "";
  onMouseEnter = "";
  onMouseExit = "";
  onSetFocus = "";
  onKillFocus = "";
  onKeyDown = "";
  onKeyUp = "";
  onMouseButtonDown = "";
  onMouseButtonUp = "";
  onMouseButtonClick = "";
  onMouseButtonDblClick = "";
  onMouseZChanged = "";
  onMouseMoving = "";
  onMouseHolding = "";
  onLoad = "(_this select 0) ctrlSetText toUpper ctrlText (_this select 0);";
  onButtonClick = "";
  onButtonDown = "";
  onButtonUp = "";

  class KeyHints
  {
    class A
    {
      key = "0x00050000 + 0";
      hint = "KEY_XBOX_A";
    };
  };
};

class GTA_ctrlButtonOK: GTA_ctrlButton
{
	default = 1;
	idc = 1;
	text = "OK";
};

class GTA_ctrlButtonCancel: GTA_ctrlButton
{
	idc = 2;
	text = "CANCEL";
};

class GTA_ctrlButtonClose: GTA_ctrlButtonCancel
{
	text = "CLOSE";
};

class GTA_ctrlButtonSearch: GTA_ctrlButton
{
  style = "0x02 + 0x30 + 0x800";
  text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
  textSearch = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
  tooltip = "Search";
};

class GTA_ctrlButtonFilter: GTA_ctrlButton
{
  colorBackground[] = {0, 0, 0, 0};
  colorBackgroundDisabled[] = {0, 0, 0, 0};
  colorBackgroundActive[] = {1, 1, 1, 0.3};
  colorFocused[] = {0, 0, 0, 0};
};

class GTA_ctrlStructuredText: GTA_ctrlDefaultText
{
  type = 13;
  colorBackground[] = {0,0,0,0};
  size = "4.68 * (1 / (getResolution select 3)) * 1.25 * 4";
  text = "";
  class Attributes
  {
    align = "left";
    color = "#ffffff";
    colorLink = "";
    size = 1;
    font = "PuristaMedium";
  };
  onCanDestroy = "";
  onDestroy = "";
};

class GTA_ctrlEdit: GTA_ctrlDefaultText
{
  type = 2;
  colorBackground[] = {0, 0, 0, 0.5};
  text = "";
  colorText[] = {1, 1, 1, 1};
  colorDisabled[] = {1, 1, 1, 0.25};
  colorSelection[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  canModify = 1;
  autocomplete = "";
  onCanDestroy = "";
  onDestroy = "";
  onSetFocus = "";
  onKillFocus = "";
  onKeyDown = "";
  onKeyUp = "";
  onMouseButtonDown = "";
  onMouseButtonUp = "";
  onMouseButtonClick = "";
  onMouseButtonDblClick = "";
  onMouseZChanged = "";
  onMouseMoving = "";
  onMouseHolding = "";
};

class GTA_ctrlEditMulti: GTA_ctrlEdit
{
  style = 16;
};

class GTA_ctrlProgress: GTA_ctrlDefault
{
  type = 8;
  texture = "#(argb,8,8,3)color(1,1,1,1)";
  colorBar[] = {1, 1, 1, 1};
  colorFrame[] = {0, 0, 0, 1};
  onCanDestroy = "";
  onDestroy = "";
};

class GTA_ctrlTree: GTA_ctrlDefaultText
{
  type = 12;
  colorBorder[] = {0, 0, 0, 1};
  colorLines[] = {0, 0, 0, 0};
  colorBackground[] = {0, 0, 0, 0};
  colorSelect[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  colorMarked[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 0.5};
  colorMarkedSelected[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  colorText[] = {1, 1, 1, 1};
  colorSelectText[] = {1, 1, 1, 1};
  colorMarkedText[] = {1, 1, 1, 1};
  colorPicture[] = {1, 1, 1, 1};
  colorPictureRight[] = {1, 0, 1, 1};
  multiselectEnabled = 0;
  expandOnDoubleclick = 1;
  hiddenTexture = "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
  expandedTexture = "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa";
  maxHistoryDelay = 1;
  disableKeyboardSearch = 0;
  colorDisabled[] = {0, 0, 0, 0};
  colorArrow[] = {0, 0, 0, 0};
  onCanDestroy = "";
  onDestroy = "";
  onMouseEnter = "";
  onMouseExit = "";
  onSetFocus = "";
  onKillFocus = "";
  onKeyDown = "";
  onKeyUp = "";
  onMouseButtonDown = "";
  onMouseButtonUp = "";
  onMouseButtonClick = "";
  onMouseButtonDblClick = "";
  onMouseZChanged = "";
  onMouseMoving = "";
  onMouseHolding = "";
  onTreeSelChanged = "";
  onTreeLButtonDown = "";
  onTreeDblClick = "";
  onTreeExpanded = "";
  onTreeCollapsed = "";
  onTreeMouseExit = "";

  class ScrollBar: ScrollBar
  {
    scrollSpeed = 0.05;
  };
};

class GTA_ctrlToolbox: GTA_ctrlDefaultText
{
  type = 6;
  style = 2;
  colorBackground[] = {0, 0, 0, 0.5};
  colorText[] = {1, 1, 1, 1};
  colorTextSelect[] = {1, 1, 1, 1};
  rows = 1;
  columns = 1;
  strings[] = {};
  values[] = {};
  color[] = {1, 0, 1, 1};
  colorSelect[] = {0, 0, 0, 0};
  colorTextDisable[] = {0, 0, 0, 0};
  colorDisable[] = {0, 0, 0, 0};
  colorSelectedBg[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R',0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  onCanDestroy = "";
  onDestroy = "";
  onMouseEnter = "";
  onMouseExit = "";
  onSetFocus = "";
  onKillFocus = "";
  onKeyDown = "";
  onKeyUp = "";
  onMouseButtonDown = "";
  onMouseButtonUp = "";
  onMouseButtonClick = "";
  onMouseButtonDblClick = "";
  onMouseZChanged = "";
  onMouseMoving = "";
  onMouseHolding = "";
  onToolBoxSelChanged = "";
};

class GTA_ctrlXListbox: GTA_ctrlDefaultText
{
  type = 42;
  style = "0x400 + 0x02 + 0x10";
  color[] = {1, 1, 1, 1};
  colorActive[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  colorText[] = {1, 1, 1, 1};
  colorSelect[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  colorDisabled[] = {1, 1, 1, 0.25};
  colorPicture[] = {1, 1, 1, 1};
  cycle = 1;
  arrowEmpty = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
  arrowFull = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
  border = "\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
  soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect", 0.09, 1};
  onCanDestroy = "";
  onDestroy = "";
  onSetFocus = "";
  onKillFocus = "";
  onKeyDown = "";
  onKeyUp = "";
  onMouseButtonDown = "";
  onMouseButtonUp = "";
  onMouseButtonClick = "";
  onMouseButtonDblClick = "";
  onMouseZChanged = "";
  onMouseMoving = "";
  onMouseHolding = "";
  onLBSelChanged = "";
  onLBDblClick = "";
};

class GTA_ctrlListNBox: GTA_ctrlDefaultText
{
  type = 102;
  style = "0x00 + 0x10";
  colorSelectBackground[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  colorSelectBackground2[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  colorText[] = {1,1,1,1};
  colorDisabled[] = {1,1,1,0.25};
  colorSelect[] = {1,1,1,1};
  colorSelect2[] = {1,1,1,1};
  colorShadow[] = {0,0,0,0.5};
  colorPicture[] = {1,1,1,1};
  colorPictureSelected[] = {1,1,1,1};
  colorPictureDisabled[] = {1,1,1,0.25};
  columns[] = {0};
  drawSideArrows = 0;
  idcLeft = -1;
  idcRight = -1;
  period = 1;
  disableOverflow = 0;
  rowHeight = "4.32 * (1 / (getResolution select 3)) * 1.25 * 4";
  maxHistoryDelay = 1;
  soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
  class ListScrollBar: ScrollBar{};
  onCanDestroy = "";
  onDestroy = "";
  onSetFocus = "";
  onKillFocus = "";
  onKeyDown = "";
  onKeyUp = "";
  onMouseButtonDown = "";
  onMouseButtonUp = "";
  onMouseButtonClick = "";
  onMouseButtonDblClick = "";
  onMouseZChanged = "";
  onMouseMoving = "";
  onMouseHolding = "";
  onLBSelChanged = "";
  onLBDblClick = "";
};

class GTA_ctrlCombo: GTA_ctrlDefaultText
{
	type = 4;
	style = "0x00 + 0x10 + 0x200";
	colorBackground[] = {0.05,0.05,0.05,1};
	colorSelectBackground[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorSelect[] = {0,0,0,1};
	colorTextRight[] = {1,1,1,1};
	colorSelectRight[] = {1,1,1,0.25};
	colorSelect2Right[] = {1,1,1,1};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	arrowEmpty = "\a3\3DEN\Data\Controls\ctrlCombo\arrowEmpty_ca.paa";
	arrowFull = "\a3\3DEN\Data\Controls\ctrlCombo\arrowFull_ca.paa";
	wholeHeight = "10 * 	5 * (pixelH * 	1.25 * 4)";
	maxHistoryDelay = 1;
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
	class ComboScrollBar
	{
		width = 0;
		height = 0;
		scrollSpeed = 0.01;
		arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[] = {1,1,1,1};
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onLBSelChanged = "";
};

class GTA_ctrlXSliderV: GTA_ctrlDefault
{
  type = 43;
  style = 0;
  color[] = {1, 1, 1, 0.6};
  colorActive[] = {1, 1, 1, 1};
  colorDisabled[] = {1, 1, 1, 0.25};
  sliderRange[] = {0, 1};
  sliderPosition = 1;
  arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
  arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
  border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
  thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
  onCanDestroy = "";
  onDestroy = "";
  onSetFocus = "";
  onKillFocus = "";
  onKeyDown = "";
  onKeyUp = "";
  onMouseButtonDown = "";
  onMouseButtonUp = "";
  onMouseButtonClick = "";
  onMouseButtonDblClick = "";
  onMouseZChanged = "";
  onMouseMoving = "";
  onMouseHolding = "";
  onSliderPosChanged = "";

  class Title
  {
    idc = -1;
    colorBase[] = {1, 1, 1, 1};
    colorActive[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  };
  class Value
  {
    idc = -1;
    format = "%.f";
    type = "SPTPlain";
    colorBase[] = {1, 1, 1, 1};
    colorActive[] = {"profileNamespace getVariable ['GUI_BCG_RGB_R', 0.77]", "profileNamespace getVariable ['GUI_BCG_RGB_G', 0.51]", "profileNamespace getVariable ['GUI_BCG_RGB_B', 0.08]", 1};
  };
};

class GTA_ctrlXSliderH: GTA_ctrlXSliderV
{
  style = 1024;
};

class GTA_ctrlCheckbox: GTA_ctrlDefault
{
  type = 77;
  color[] = {1, 1, 1, 0.7};
  colorFocused[] = {1, 1, 1, 1};
  colorHover[] = {1, 1, 1, 1};
  colorPressed[] = {1, 1, 1, 1};
  colorDisabled[] = {1, 1, 1, 0.25};
  colorBackground[] = {0, 0, 0, 0};
  colorBackgroundFocused[] = {0, 0, 0, 0};
  colorBackgroundHover[] = {0, 0, 0, 0};
  colorBackgroundPressed[] = {0, 0, 0, 0};
  colorBackgroundDisabled[] = {0, 0, 0, 0};
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
  soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
  soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
  soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
  soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
  onCanDestroy = "";
  onDestroy = "";
  onMouseEnter = "";
  onMouseExit = "";
  onSetFocus = "";
  onKillFocus = "";
  onKeyDown = "";
  onKeyUp = "";
  onMouseButtonDown = "";
  onMouseButtonUp = "";
  onMouseButtonClick = "";
  onMouseButtonDblClick = "";
  onMouseZChanged = "";
  onMouseMoving = "";
  onMouseHolding = "";
  onCheckedChanged = "";
};
