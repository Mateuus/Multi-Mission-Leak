////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Rath Bone, v1.063, #Palyli)
////////////////////////////////////////////////////////
class nationalbank {
  idd = 3500;
  name = "nationalbank";
  movingEnable = 0;
	enableSimulation = 1;
  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = 1000;
    	x = 0.4175 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.385 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = 1001;
    	text = "National Bank Vault"; //--- ToDo: Localize;
    	x = 0.4175 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,0.8};
    };
  };
  class controls {
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 1500;
      text = "";
    	x = 0.422656 * safezoneW + safezoneX;
    	y = 0.335 * safezoneH + safezoneY;
    	w = 0.144375 * safezoneW;
    	h = 0.275 * safezoneH;
      sizeEx = 0.035;
      colorBackground[] = {0,0,0,0.6};
    };
    class RscEdit_1400: Life_RscEdit
    {
    	idc = 1400;
      text = "0";
    	x = 0.422656 * safezoneW + safezoneX;
    	y = 0.621 * safezoneH + safezoneY;
    	w = 0.144375 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0,0,0,0.6};
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Take"; //--- ToDo: Localize;
    	x = 0.438125 * safezoneW + safezoneX;
    	y = 0.665 * safezoneH + safezoneY;
    	w = 0.118594 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_radrezepexaph;";
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.4175 * safezoneW + safezoneX;
    	y = 0.698 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
  };
};
