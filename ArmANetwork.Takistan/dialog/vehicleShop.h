////////////////////////////////////////////////////////
// ArmA.Network
// R4thbone
////////////////////////////////////////////////////////
class Life_Vehicle_Shop_v2 {
idd = 2300;
name="life_vehicle_shop";
movingEnabled = 0;
enableSimulation = 1;
onLoad = "ctrlShow [2330,false];";

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.83 * safezoneW + safezoneX;
    	y = 0.192 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.561 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    	colorActive[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Car Dealership"; //--- ToDo: Localize;
    	x = 0.835156 * safezoneW + safezoneX;
    	y = 0.203 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
    };
  };
  class controls {
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 2302;
      text = "";
      onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
			sizeEx = 0.035;
    	x = 0.835156 * safezoneW + safezoneX;
    	y = 0.225 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.198 * safezoneH;
    };
    class RscCombo_2100: Life_RscCombo
    {
    	idc = 2304;
    	x = 0.835156 * safezoneW + safezoneX;
    	y = 0.423 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscText_1002: Life_RscText
    {
    	idc = 2330;
    	text = "Vehicle Information";
    	x = 0.835156 * safezoneW + safezoneX;
    	y = 0.456 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscStructuredText_1100: Life_RscStructuredText
    {
      idc = 2303;
      text = "";
      sizeEx = 0.035;
    	x = 0.835156 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.264 * safezoneH;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = -1;
      onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
    	text = "Rent";
    	x = 0.83 * safezoneW + safezoneX;
    	y = 0.753 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2309;
    	text = "Buy Vehicle";
      onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";
    	x = 0.881562 * safezoneW + safezoneX;
    	y = 0.753 * safezoneH + safezoneY;
    	w = 0.0928125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2402: Life_RscButtonMenu
    {
    	idc = -1;
    	text = " X";
      onButtonClick = "closeDialog 0;";
    	x = 0.974375 * safezoneW + safezoneX;
    	y = 0.753 * safezoneH + safezoneY;
    	w = 0.020625 * safezoneW;
    	h = 0.022 * safezoneH;
    };
  };
};
