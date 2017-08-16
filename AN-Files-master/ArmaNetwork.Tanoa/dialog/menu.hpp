////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////
class infomenu {
  idd = 432123;
  name = "infomenu";
	movingEnabled = 0;
	enableSimulation = 1;
  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.247 * safezoneH + safezoneY;
    	w = 0.360937 * safezoneW;
    	h = 0.451 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Information & Guide"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.247 * safezoneH + safezoneY;
    	w = 0.360937 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,0.8};
    };
  };
  class controls {
    class infolist: Life_RscListbox
    {
    	idc = 1500;
      text = "";
      sizeEx = 0.035;
      onLBSelChanged = "[1] call life_fnc_hunubrecr;";
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.269 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.418 * safezoneH;
      colorBackground[] = {0,0,0,0};
    };
    class controlgroup: Life_RscControlsGroup
		{
      x = 0.453593 * safezoneW + safezoneX;
    	y = 0.269 * safezoneH + safezoneY;
    	w = 0.226875 * safezoneW;
    	h = 0.418 * safezoneH;
			class HScrollbar : HScrollbar {
				height = 0;
				color[] = {0,0,0,1};
			};
			class controls {
				class controlgroupone: Life_RscStructuredText
				{
					idc = 1100;
					text = "";
					x = 0;
					y = 0;
					w = 0.216563 * safezoneW;
					h = 1;
				};
			};
		};
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = -1;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.319532 * safezoneW + safezoneX;
    	y = 0.698 * safezoneH + safezoneY;
    	w = 0.360937 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
  };
};
