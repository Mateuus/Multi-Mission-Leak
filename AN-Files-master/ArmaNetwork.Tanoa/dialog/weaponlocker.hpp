class weaponlocker {
  idd = 84693;
  name = "weaponlocker";
  movingEnable = 0;
	enableSimulation = 1;
  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
      text = "";
    	x = 0.407187 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.185625 * safezoneW;
    	h = 0.286 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Vehicle Weapon Locker"; //--- ToDo: Localize;
    	x = 0.2875;
    	y = 0.17;
    	w = 0.45;
    	h = 0.04;
    };
  };
  class controls {
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 1500;
      text = "";
    	x = 0.4175 * safezoneW + safezoneX;
    	y = 0.346 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.187 * safezoneH;
      sizeEx = 0.035;
      colorBackground[] = {0,0,0,0};
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Equip"; //--- ToDo: Localize;
    	x = 0.448438 * safezoneW + safezoneX;
    	y = 0.555 * safezoneH + safezoneY;
    	w = 0.103125 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_pehes";
      class Attributes
      {
        align = "center";
      };
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Close Locker"; //--- ToDo: Localize;
    	x = 0.407187 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.185625 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
  };
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
