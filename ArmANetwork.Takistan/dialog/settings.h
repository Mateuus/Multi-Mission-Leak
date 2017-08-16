////////////////////////////////////////////////////////
// ArmA.Network
// R4thbone
////////////////////////////////////////////////////////
class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnabled = 1;
	enableSimulation = 1;

  class controlsBackground {

    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.29375 * safezoneW + safezoneX;
    	y = 0.269 * safezoneH + safezoneY;
    	w = 0.4125 * safezoneW;
    	h = 0.44 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    	colorActive[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Your ArmA.Network Server Settings & Further Information";
    	x = 0.29375 * safezoneW + safezoneX;
    	y = 0.247 * safezoneH + safezoneY;
    	w = 0.4125 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
	};

  class controls {
    class RscStructuredText_1100: Life_RscStructuredText
    {
    	idc = 1100;
    	text = "";
    	x = 0.304062 * safezoneW + safezoneX;
    	y = 0.291 * safezoneH + safezoneY;
    	w = 0.391875 * safezoneW;
    	h = 0.077 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscText_1002: RscText
    {
    	idc = -1;
    	text = "In Game Settings";
    	x = 0.489688 * safezoneW + safezoneX;
    	y = 0.401 * safezoneH + safezoneY;
    	w = 0.20625 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscText_1003: RscText
    {
    	idc = -1;
    	text = "On Foot";
    	x = 0.489687 * safezoneW + safezoneX;
    	y = 0.445 * safezoneH + safezoneY;
    	w = 0.04125 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscSlider_1900: life_RscXSliderH
    {
    	idc = 2901;
      text = "";
      onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
    	x = 0.54125 * safezoneW + safezoneX;
    	y = 0.445 * safezoneH + safezoneY;
    	w = 0.108281 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscEdit_1400: Life_RscEdit
    {
    	idc = 2902;
      text = "";
			onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_s_onChar;";
    	x = 0.654688 * safezoneW + safezoneX;
    	y = 0.445 * safezoneH + safezoneY;
    	w = 0.04125 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscText_1004: Life_RscText
    {
    	idc = -1;
    	text = "In Car";
    	x = 0.489687 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.04125 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscSlider_1901: life_RscXSliderH
    {
    	idc = 2911;
      text = "";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
    	x = 0.54125 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.108281 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscEdit_1401: Life_RscEdit
    {
      idc = 2912;
      text = "";
      onChar = "[_this select 0, _this select 1,'vehicle',false] call life_fnc_s_onChar;";
      onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call life_fnc_s_onChar;";
    	x = 0.654688 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.04125 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscText_1005: Life_RscText
    {
    	idc = -1;
    	text = "In Air";
    	x = 0.489687 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.04125 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscSlider_1902: life_RscXSliderH
    {
      idc = 2921;
      text = "";
      onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
    	x = 0.54125 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.108281 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscEdit_1402: Life_RscEdit
    {
      idc = 2922;
      text = "";
      onChar = "[_this select 0, _this select 1,'air',false] call life_fnc_s_onChar;";
      onKeyUp = "[_this select 0, _this select 1,'air',true] call life_fnc_s_onChar;";
    	x = 0.654688 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.04125 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscText_1006: Life_RscText
    {
    	idc = -1;
    	text = "Player Tags";
    	x = 0.489687 * safezoneW + safezoneX;
    	y = 0.555 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscText_1007: Life_RscText
    {
    	idc = -1;
    	text = "Sidechat Settings";
    	x = 0.489687 * safezoneW + safezoneX;
    	y = 0.588 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscText_1008: Life_RscText
    {
    	idc = -1;
    	text = "Reveal Nearby Objects";
    	x = 0.489687 * safezoneW + safezoneX;
    	y = 0.621 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscCheckbox_2800: Life_Checkbox
    {
      idc = 2970;
      sizeEx = 0.04;
      onCheckedChanged = "['tags',_this select 1] call life_fnc_s_onCheckedChange;";
    	x = 0.649531 * safezoneW + safezoneX;
    	y = 0.555 * safezoneH + safezoneY;
    	w = 0.0103125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscCheckbox_2801: Life_Checkbox
    {
      idc = 2971;
      tooltip = "";
      onCheckedChanged = "['sidechat',_this select 1] call life_fnc_s_onCheckedChange;";
    	x = 0.649531 * safezoneW + safezoneX;
    	y = 0.588 * safezoneH + safezoneY;
    	w = 0.0103125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscCheckbox_2802: Life_Checkbox
    {
    	idc = 2802;
      onCheckedChanged = "['objects',_this select 1] call life_fnc_s_onCheckedChange;";
    	x = 0.649531 * safezoneW + safezoneX;
    	y = 0.621 * safezoneH + safezoneY;
    	w = 0.0103125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = -1;
    	text = "Close Settings";
      onButtonClick = "closeDialog 0;";
    	x = 0.29375 * safezoneW + safezoneX;
    	y = 0.709 * safezoneH + safezoneY;
    	w = 0.4125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class PlayerHUD: Life_RscText
    {
    	idc = -1;
    	text = "Player HUD (Coming Soon)"; //--- ToDo: Localize;
    	x = 0.489687 * safezoneW + safezoneX;
    	y = 0.654 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class PlayerHUDCheckbox: Life_Checkbox
    {
    	idc = -1;
			onCheckedChanged = "['hud',_this select 1] call life_fnc_s_onCheckedChange;";
    	x = 0.649531 * safezoneW + safezoneX;
    	y = 0.654 * safezoneH + safezoneY;
    	w = 0.0103125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = -1;
    	text = "Change In Game Colors";
      onButtonClick = "[] call life_fnc_ancolors;";
    	x = 0.304062 * safezoneW + safezoneX;
    	y = 0.654 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscText_1010: Life_RscText
    {
    	idc = -1;
    	text = "Server Message";
    	x = 0.304062 * safezoneW + safezoneX;
    	y = 0.401 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorText[] = {0,0.95,0.07,1};
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
    class RscStructuredText_1101: Life_RscStructuredText
    {
    	idc = 2950;
    	text = "";
    	x = 0.304062 * safezoneW + safezoneX;
    	y = 0.423 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.22 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    	colorActive[] = {0,0,0,1};
    };
  };
};
