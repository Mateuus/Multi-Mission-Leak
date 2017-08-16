////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////
class an_atm_menu {
  idd = 2700;
  name= "an_atm_menu";
	movingEnable = 0;
	enableSimulation = 1;
  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = 1000;
    	x = 0.407187 * safezoneW + safezoneX;
    	y = 0.291 * safezoneH + safezoneY;
    	w = 0.185625 * safezoneW;
    	h = 0.319 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = 1001;
    	text = "Personal Account"; //--- ToDo: Localize;
    	x = 0.407187 * safezoneW + safezoneX;
    	y = 0.291 * safezoneH + safezoneY;
    	w = 0.185625 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,0.8};
    };
  };
  class controls {
    class RscStructuredText_1100: Life_RscStructuredText
    {
    	idc = 1100;
    	text = "Cash on Hand: $0<br/>Bank Balance: $0"; //--- ToDo: Localize;
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.044 * safezoneH;
    };
    class RscText_1002: Life_RscText
    {
    	idc = 1002;
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.108281 * safezoneW;
    	h = 0.286 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class player_search: Life_RscEdit
    {
    	idc = 1400;
      text = "";
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.335 * safezoneH + safezoneY;
    	w = 0.108281 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0,0,0,0.5};
      onKeyDown = "call life_fnc_wufremuvuzatr";
    };
    class playerlist: Life_RscListbox
    {
    	idc = 1500;
      text = "";
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.368 * safezoneH + safezoneY;
    	w = 0.108281 * safezoneW;
    	h = 0.231 * safezoneH;
      sizeEx = 0.03;
      colorBackground[] = {0,0,0,0.5};
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Personal"; //--- ToDo: Localize;
    	x = 0.592812 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[0] call life_fnc_drerebuwu";
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Gang"; //--- ToDo: Localize;
    	x = 0.592812 * safezoneW + safezoneX;
    	y = 0.335 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[1] call life_fnc_drerebuwu";
    };
    class RscButtonMenu_2402: Life_RscButtonMenu
    {
    	idc = 2402;
    	text = "Government"; //--- ToDo: Localize;
    	x = 0.592812 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[2] spawn life_fnc_drerebuwu";
    };
    class amount: Life_RscEdit
    {
    	idc = 1401;
      text = "0";
    	x = 0.412343 * safezoneW + safezoneX;
    	y = 0.423 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0,0,0,0.5};
    };
    class RscText_1003: Life_RscText
    {
    	idc = 1003;
    	text = "Enter Amount:"; //--- ToDo: Localize;
    	x = 0.412343 * safezoneW + safezoneX;
    	y = 0.401 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,0.8};
    };
    class personal_2403: Life_RscButtonMenu
    {
    	idc = 2403;
    	text = "Deposit"; //--- ToDo: Localize;
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.522 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_cejabrucr";
    };
    class gang_2408: Life_RscButtonMenu
    {
    	idc = 2408;
    	text = "Deposit"; //--- ToDo: Localize;
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.522 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_padabruku";
    };
    class personal_2404: Life_RscButtonMenu
    {
    	idc = 2404;
    	text = "Withdraw"; //--- ToDo: Localize;
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_hefraprez";
    };
    class gang_2409: Life_RscButtonMenu
    {
    	idc = 2409;
    	text = "Withdraw"; //--- ToDo: Localize;
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_jabruspat";
    };
    class government_2410: Life_RscButtonMenu
    {
    	idc = 2410;
    	text = "Withdraw"; //--- ToDo: Localize;
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_tethapure";
    };
    class RscText_1004: Life_RscText
    {
    	idc = 1004;
    	text = "Citizens"; //--- ToDo: Localize;
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.108281 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,0.8};
    };
    class RscButtonMenu_2406: Life_RscButtonMenu
    {
    	idc = 2406;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.407187 * safezoneW + safezoneX;
    	y = 0.61 * safezoneH + safezoneY;
    	w = 0.185625 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "(findDisplay 2700) displayRemoveAllEventHandlers ""KeyDown""; closeDialog 0; ATMSearch = nil;";
    };
    class RscButtonMenu_2407: Life_RscButtonMenu
    {
    	idc = 2407;
    	text = "Transfer"; //--- ToDo: Localize;
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.566 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_zaprasuqu";
    };
  };
};
