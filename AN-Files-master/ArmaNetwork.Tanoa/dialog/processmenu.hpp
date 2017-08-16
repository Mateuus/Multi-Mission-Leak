class processmenu
{
  idd = 72341;
  name = "processmenu";
  movingEnable = 0;
  enableSimulation = 1;
  
  class controlsBackground {
  	class RscText_1000: Life_RscText
  	{
  		idc = -1;
  		text = "";
  		x = 0.345312 * safezoneW + safezoneX;
  		y = 0.291 * safezoneH + safezoneY;
  		w = 0.309375 * safezoneW;
  		h = 0.506 * safezoneH;
  		colorBackground[] = {0,0,0,0.7};
  	};
  	class RscText_1001: Life_RscText
  	{
  		idc = -1;
  		text = "Processing Prompt"; //--- ToDo: Localize;
  		x = 0.345312 * safezoneW + safezoneX;
  		y = 0.291 * safezoneH + safezoneY;
  		w = 0.309375 * safezoneW;
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
  		x = 0.355625 * safezoneW + safezoneX;
  		y = 0.357 * safezoneH + safezoneY;
  		w = 0.28875 * safezoneW;
  		h = 0.044 * safezoneH;
  	};
  	class RscText_1002: Life_RscText
  	{
  		idc = -1;
  		text = "License Required:"; //--- ToDo: Localize;
  		x = 0.350469 * safezoneW + safezoneX;
  		y = 0.324 * safezoneH + safezoneY;
  		w = 0.165 * safezoneW;
  		h = 0.022 * safezoneH;
  	};
  	class RscText_1003: Life_RscText
  	{
  		idc = -1;
  		text = "Required Items:"; //--- ToDo: Localize;
  		x = 0.350469 * safezoneW + safezoneX;
  		y = 0.412 * safezoneH + safezoneY;
  		w = 0.165 * safezoneW;
  		h = 0.022 * safezoneH;
  	};
  	class RscText_1004: Life_RscText
  	{
  		idc = -1;
  		text = "Product:"; //--- ToDo: Localize;
  		x = 0.350469 * safezoneW + safezoneX;
  		y = 0.577 * safezoneH + safezoneY;
  		w = 0.165 * safezoneW;
  		h = 0.022 * safezoneH;
  	};
  	class RscStructuredText_1101: Life_RscStructuredText
  	{
  		idc = 1101;
  		text = "";
  		x = 0.355625 * safezoneW + safezoneX;
  		y = 0.445 * safezoneH + safezoneY;
  		w = 0.28875 * safezoneW;
  		h = 0.121 * safezoneH;
  	};
  	class RscStructuredText_1102: Life_RscStructuredText
  	{
  		idc = 1102;
  		text = "";
  		x = 0.355625 * safezoneW + safezoneX;
  		y = 0.61 * safezoneH + safezoneY;
  		w = 0.28875 * safezoneW;
  		h = 0.121 * safezoneH;
  	};
  	class RscButtonMenu_2400: Life_RscButtonMenu
  	{
  		idc = 2400;
  		text = "Process"; //--- ToDo: Localize;
  		x = 0.448438 * safezoneW + safezoneX;
  		y = 0.753 * safezoneH + safezoneY;
  		w = 0.108281 * safezoneW;
  		h = 0.022 * safezoneH;
      class Attributes
      {
        align = "center";
      };
  	};
  	class RscButtonMenu_2401: Life_RscButtonMenu
  	{
  		idc = -1;
  		text = "Close"; //--- ToDo: Localize;
  		x = 0.345312 * safezoneW + safezoneX;
  		y = 0.797 * safezoneH + safezoneY;
  		w = 0.309375 * safezoneW;
  		h = 0.022 * safezoneH;
  		onButtonClick = "closeDialog 0;";
  	};
  };
};
