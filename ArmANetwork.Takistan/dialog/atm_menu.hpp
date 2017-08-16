////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////

class taki_atm_menu {
  idd = 2700;
  name= "taki_atm_menu";
	movingEnable = false;
	enableSimulation = true;

  class controlsBackground {
    class ATM_Background: Life_RscPicture
    {
    	idc = -1;
    	text = "icons\atmbackground.paa";
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.402187 * safezoneW;
    	h = 0.671 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
  };
  class controls {
    class RscButtonMenu_2400: Life_RscStructuredText
    {
    	idc = 2400;
    	text = "";
      x = 0.402031 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.201094 * safezoneW;
    	h = 0.022 * safezoneH;
      colorText[] = {0,0,0,1};
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2402: Life_RscButtonInvisible
    {
    	idc = 2402;
      onButtonClick = "closeDialog 0; [] call life_fnc_wireTransfer";
    	x = 0.628906 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Wire Transfer";
    };
    class RscButtonMenu_2403: Life_RscButtonInvisible
    {
    	idc = 2403;
      onButtonClick = "closeDialog 0; [] call life_fnc_quickWithdraw";
    	x = 0.62375 * safezoneW + safezoneX;
    	y = 0.412 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.055 * safezoneH;
    	tooltip = "Quick Withdraw";
    };
    class RscButtonMenu_2404: Life_RscButtonInvisible
    {
    	idc = 2404;
      onButtonClick = "closeDialog 0; [] call life_fnc_withdraw";
    	x = 0.62375 * safezoneW + safezoneX;
    	y = 0.5 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.055 * safezoneH;
    	tooltip = "Withdraw";
    };
    class RscButtonMenu_2405: Life_RscButtonInvisible
    {
    	idc = 2405;
      onButtonClick = "closeDialog 0; [] call life_fnc_quickDeposit";
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Quick Deposit";
    };
    class RscButtonMenu_2406: Life_RscButtonInvisible
    {
    	idc = 2406;
      onButtonClick = "closeDialog 0; [] call life_fnc_deposit";
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.412 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.055 * safezoneH;
    	tooltip = "Deposit";
    };
    class RscButtonMenu_2407: Life_RscButtonInvisible
    {
    	idc = 2407;
      onButtonClick = "closeDialog 0; [] call life_fnc_gangTransactions";
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.5 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.055 * safezoneH;
    	tooltip = "Gang Transactions";
    };
    class RscButtonMenu_2408: Life_RscButtonInvisible
    {
    	idc = 2408;
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Transaction Logs (Coming Soon)";
    };
    class RscButtonMenu_2409: Life_RscButtonInvisible
    {
    	idc = 2409;
    	x = 0.62375 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Insurance Plans (Coming Soon)";
    };
    class RscButtonMenu_2410: Life_RscButtonInvisible
    {
    	idc = -1;
      onButtonClick = "closeDialog 0;";
    	x = 0.453594 * safezoneW + safezoneX;
    	y = 0.709 * safezoneH + safezoneY;
    	w = 0.0928125 * safezoneW;
    	h = 0.033 * safezoneH;
    	tooltip = "Close";
    };
    class RscButtonMenu_2411: Life_RscStructuredText
    {
    	idc = 2411;
    	text = "";
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.346 * safezoneH + safezoneY;
    	w = 0.0979687 * safezoneW;
    	h = 0.033 * safezoneH;
      colorText[] = {0,0,0,1};
    	colorBackground[] = {0,0,0,0};
    };
    class RscButtonMenu_2412: Life_RscStructuredText
    {
    	idc = 2412;
    	text = "";
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.434 * safezoneH + safezoneY;
    	w = 0.0979687 * safezoneW;
    	h = 0.044 * safezoneH;
      colorText[] = {0,0,0,1};
    	colorBackground[] = {0,0,0,0};
    };
    class RscButtonMenu_2413: Life_RscStructuredText
    {
    	idc = 2413;
    	text = "";
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.118594 * safezoneW;
    	h = 0.044 * safezoneH;
      colorText[] = {0,0,0,1};
    	colorBackground[] = {0,0,0,0};
    };
    class RscButtonMenu_2414: Life_RscStructuredText
    {
    	idc = 2414;
    	text = "";
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.118594 * safezoneW;
    	h = 0.044 * safezoneH;
      colorText[] = {0,0,0,1};
    	colorBackground[] = {0,0,0,0};
    };
    class RscButtonMenu_2415: Life_RscStructuredText
    {
    	idc = 2415;
    	text = "";
    	x = 0.505156 * safezoneW + safezoneX;
    	y = 0.346 * safezoneH + safezoneY;
    	w = 0.108281 * safezoneW;
    	h = 0.033 * safezoneH;
      colorText[] = {0,0,0,1};
    	colorBackground[] = {0,0,0,0};
    };
    class RscButtonMenu_2401: Life_RscStructuredText
    {
    	idc = 2401;
    	text = "";
    	x = 0.505156 * safezoneW + safezoneX;
    	y = 0.434 * safezoneH + safezoneY;
    	w = 0.108281 * safezoneW;
    	h = 0.044 * safezoneH;
      colorText[] = {0,0,0,1};
    	colorBackground[] = {0,0,0,0};
    };
    class RscButtonMenu_2416: Life_RscStructuredText
    {
    	idc = 2416;
    	text = "";
    	x = 0.510312 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.103125 * safezoneW;
    	h = 0.044 * safezoneH;
      colorText[] = {0,0,0,1};
    	colorBackground[] = {0,0,0,0};
    };
    class RscButtonMenu_2417: Life_RscStructuredText
    {
    	idc = 2417;
    	text = "";
    	x = 0.510312 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.103125 * safezoneW;
    	h = 0.044 * safezoneH;
      colorText[] = {0,0,0,1};
    	colorBackground[] = {0,0,0,0};
    };
  };
};

class taki_atm_wire {
  idd = 27001;
  name= "taki_atm_wire";
	movingEnable = false;
	enableSimulation = true;

  class controlsBackground {
    class RscPicture_1200: Life_RscPicture
    {
    	idc = 1200;
    	text = "icons\atmbackground.paa";
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.402187 * safezoneW;
    	h = 0.671 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscPicture_1202: Life_RscPicture
    {
    	idc = 1202;
    	text = "icons\atmcash.paa";
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.412 * safezoneH + safezoneY;
    	w = 0.0257812 * safezoneW;
    	h = 0.044 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscPicture_1201: Life_RscPicture
    {
    	idc = 1201;
    	text = "icons\atmbank.paa";
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.0257812 * safezoneW;
    	h = 0.044 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
  };
  class controls {
    class RscButtonMenu_2400: Life_RscStructuredText
    {
    	idc = 2400;
      text = "";
      x = 0.396875 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.20625 * safezoneW;
    	h = 0.033 * safezoneH;
      colorText[] = {0,0,0,1};
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2401: Life_RscStructuredText
    {
    	idc = 2401;
      text = "";
      x = 0.448438 * safezoneW + safezoneX;
    	y = 0.368 * safezoneH + safezoneY;
    	w = 0.134062 * safezoneW;
    	h = 0.033 * safezoneH;
      colorText[] = {0,0,0,1};
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2402: Life_RscStructuredText
    {
    	idc = 2402;
    	text = "";
    	x = 0.448438 * safezoneW + safezoneX;
    	y = 0.423 * safezoneH + safezoneY;
    	w = 0.134062 * safezoneW;
    	h = 0.033 * safezoneH;
      colorText[] = {0,0,0,1};
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2409: Life_RscButtonInvisible
    {
    	idc = 2409;
      onButtonClick = "[] call life_fnc_bankTransfer;";
    	x = 0.62375 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Confirm & Wire";
    };
    class RscButtonMenu_2410: Life_RscButtonInvisible
    {
    	idc = -1;
      onButtonClick = "closeDialog 0;";
    	x = 0.453594 * safezoneW + safezoneX;
    	y = 0.709 * safezoneH + safezoneY;
    	w = 0.0928125 * safezoneW;
    	h = 0.033 * safezoneH;
    	tooltip = "Close";
    };
    class amountWired: Life_RscEdit
    {
    	idc = 1412;
      text = "1";
      x = 0.45875 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2411: Life_RscStructuredText
    {
    	idc = 2411;
    	text = "";
      x = 0.407187 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2412: Life_RscStructuredText
    {
    	idc = 2412;
    	text = "";
      x = 0.407187 * safezoneW + safezoneX;
    	y = 0.522 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscCombo_2100: Life_RscCombo
    {
    	idc = 2100;
      x = 0.45875 * safezoneW + safezoneX;
    	y = 0.522 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2403: Life_RscStructuredText
    {
    	idc = 2403;
    	text = "Confirm"; //--- ToDo: Localize;
    	x = 0.515469 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.0979687 * safezoneW;
    	h = 0.044 * safezoneH;
    };
  };
};


class taki_atm_quickwithdraw {
  idd = 27002;
  name= "taki_atm_quickwithdraw";
	movingEnable = false;
	enableSimulation = true;

  class controlsBackground {
    class RscPicture_1200: Life_RscPicture
    {
    	idc = 1200;
    	text = "icons\atmbackground.paa";
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.402187 * safezoneW;
    	h = 0.671 * safezoneH;
    };
  };
  class controls {
    class RscButtonMenu_2400: Life_RscStructuredText
    {
    	idc = 2400;
    	text = "Quick Withdraw"; //--- ToDo: Localize;
    	x = 0.438125 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2409: Life_RscButtonInvisible
    {
    	idc = 2409;
      onButtonClick = "closeDialog 0; [10000] call life_fnc_withdrawQuick";
    	x = 0.62375 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Withdraw $10,000"; //--- ToDo: Localize;
    };
    class RscButtonMenu_2410: Life_RscButtonInvisible
    {
    	idc = 2410;
      onButtonClick = "closeDialog 0;";
    	x = 0.453594 * safezoneW + safezoneX;
    	y = 0.709 * safezoneH + safezoneY;
    	w = 0.0928125 * safezoneW;
    	h = 0.033 * safezoneH;
    	tooltip = "Close"; //--- ToDo: Localize;
    };
    class RscButtonMenu_2401: Life_RscStructuredText
    {
    	idc = 2401;
    	text = "";
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.346 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.044 * safezoneH;
    };
    class RscButtonMenu_2402: Life_RscStructuredText
    {
    	idc = 2402;
    	text = "";
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.561875 * safezoneW + safezoneX;
    	y = 0.346 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.044 * safezoneH;
    };
    class RscButtonMenu_2403: Life_RscStructuredText
    {
    	idc = 2403;
    	text = "";
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.434 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.044 * safezoneH;
    };
    class RscButtonMenu_2404: Life_RscStructuredText
    {
    	idc = 2404;
    	text = "";
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.561875 * safezoneW + safezoneX;
    	y = 0.434 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.044 * safezoneH;
    };
    class RscButtonMenu_2405: Life_RscStructuredText
    {
    	idc = 2405;
    	text = "";
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.044 * safezoneH;
    };
    class RscButtonMenu_2406: Life_RscStructuredText
    {
    	idc = 2406;
    	text = "";
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.561875 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.044 * safezoneH;
    };
    class RscButtonMenu_2407: Life_RscStructuredText
    {
    	idc = 2407;
    	text = "";
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.044 * safezoneH;
    };
    class RscButtonMenu_2408: Life_RscStructuredText
    {
    	idc = 2408;
    	text = "";
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.561875 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.044 * safezoneH;
    };
    class RscButtonMenu_2411: Life_RscButtonInvisible
    {
    	idc = 2411;
      onButtonClick = "closeDialog 0; [10] call life_fnc_withdrawQuick";
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Withdraw $10"; //--- ToDo: Localize;
    };
    class RscButtonMenu_2412: Life_RscButtonInvisible
    {
    	idc = 2412;
      onButtonClick = "closeDialog 0; [50] call life_fnc_withdrawQuick";
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.412 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Withdraw $50"; //--- ToDo: Localize;
    };
    class RscButtonMenu_2413: Life_RscButtonInvisible
    {
    	idc = 2413;
      onButtonClick = "closeDialog 0; [100] call life_fnc_withdrawQuick";
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.5 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Withdraw $100"; //--- ToDo: Localize;
    };
    class RscButtonMenu_2414: Life_RscButtonInvisible
    {
    	idc = 2414;
      onButtonClick = "closeDialog 0; [200] call life_fnc_withdrawQuick";
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Withdraw $200"; //--- ToDo: Localize;
    };
    class RscButtonMenu_2415: Life_RscButtonInvisible
    {
    	idc = 2415;
      onButtonClick = "closeDialog 0; [500] call life_fnc_withdrawQuick";
    	x = 0.62375 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Withdraw $500"; //--- ToDo: Localize;
    };
    class RscButtonMenu_2416: Life_RscButtonInvisible
    {
    	idc = 2416;
      onButtonClick = "closeDialog 0; [1000] call life_fnc_withdrawQuick";
    	x = 0.62375 * safezoneW + safezoneX;
    	y = 0.412 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Withdraw $1,000"; //--- ToDo: Localize;
    };
    class RscButtonMenu_2417: Life_RscButtonInvisible
    {
    	idc = 2417;
      onButtonClick = "closeDialog 0; [5000] call life_fnc_withdrawQuick";
    	x = 0.62375 * safezoneW + safezoneX;
    	y = 0.5 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Withdraw $5,000"; //--- ToDo: Localize;
    };
  };
};

class taki_atm_quickdeposit {
  idd = 27003;
  name= "taki_atm_quickdeposit";
	movingEnable = false;
	enableSimulation = true;

  class controlsBackground {
    class RscPicture_1200: Life_RscPicture
    {
    	idc = 1200;
    	text = "icons\atmbackground.paa";
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.402187 * safezoneW;
    	h = 0.671 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
  };
  class controls {
      class RscButtonMenu_2400: Life_RscStructuredText
      {
      	idc = 2400;
      	text = ""; //--- ToDo: Localize;
      	x = 0.438125 * safezoneW + safezoneX;
      	y = 0.302 * safezoneH + safezoneY;
      	w = 0.12375 * safezoneW;
      	h = 0.033 * safezoneH;
      };
      class RscButtonMenu_2409: Life_RscButtonInvisible
      {
      	idc = 2409;
        onButtonClick = "closeDialog 0; [10000] call life_fnc_depositQuick";
      	x = 0.62375 * safezoneW + safezoneX;
      	y = 0.577 * safezoneH + safezoneY;
      	w = 0.0464063 * safezoneW;
      	h = 0.066 * safezoneH;
      	tooltip = "Deposit $10,000"; //--- ToDo: Localize;
      };
      class RscButtonMenu_2410: Life_RscButtonInvisible
      {
      	idc = 2410;
        onButtonClick = "closeDialog 0;";
      	x = 0.453594 * safezoneW + safezoneX;
      	y = 0.709 * safezoneH + safezoneY;
      	w = 0.0928125 * safezoneW;
      	h = 0.033 * safezoneH;
      	tooltip = "Close"; //--- ToDo: Localize;
      };
      class RscButtonMenu_2401: Life_RscStructuredText
      {
      	idc = 2401;
        colorBackground[] = {0, 0, 0, 0};
      	text = ""; //--- ToDo: Localize;
      	x = 0.386562 * safezoneW + safezoneX;
      	y = 0.346 * safezoneH + safezoneY;
      	w = 0.0515625 * safezoneW;
      	h = 0.044 * safezoneH;
      };
      class RscButtonMenu_2402: Life_RscStructuredText
      {
      	idc = 2402;
        colorBackground[] = {0, 0, 0, 0};
      	text = ""; //--- ToDo: Localize;
      	x = 0.561875 * safezoneW + safezoneX;
      	y = 0.346 * safezoneH + safezoneY;
      	w = 0.0515625 * safezoneW;
      	h = 0.044 * safezoneH;
      };
      class RscButtonMenu_2403: Life_RscStructuredText
      {
      	idc = 2403;
        colorBackground[] = {0, 0, 0, 0};
      	text = ""; //--- ToDo: Localize;
      	x = 0.386562 * safezoneW + safezoneX;
      	y = 0.434 * safezoneH + safezoneY;
      	w = 0.0515625 * safezoneW;
      	h = 0.044 * safezoneH;
      };
      class RscButtonMenu_2404: Life_RscStructuredText
      {
      	idc = 2404;
        colorBackground[] = {0, 0, 0, 0};
      	text = ""; //--- ToDo: Localize;
      	x = 0.561875 * safezoneW + safezoneX;
      	y = 0.434 * safezoneH + safezoneY;
      	w = 0.0515625 * safezoneW;
      	h = 0.044 * safezoneH;
      };
      class RscButtonMenu_2405: Life_RscStructuredText
      {
      	idc = 2405;
        colorBackground[] = {0, 0, 0, 0};
      	text = ""; //--- ToDo: Localize;
      	x = 0.386562 * safezoneW + safezoneX;
      	y = 0.511 * safezoneH + safezoneY;
      	w = 0.0515625 * safezoneW;
      	h = 0.044 * safezoneH;
      };
      class RscButtonMenu_2406: Life_RscStructuredText
      {
      	idc = 2406;
        colorBackground[] = {0, 0, 0, 0};
      	text = ""; //--- ToDo: Localize;
      	x = 0.561875 * safezoneW + safezoneX;
      	y = 0.511 * safezoneH + safezoneY;
      	w = 0.0515625 * safezoneW;
      	h = 0.044 * safezoneH;
      };
      class RscButtonMenu_2407: Life_RscStructuredText
      {
      	idc = 2407;
        colorBackground[] = {0, 0, 0, 0};
      	text = ""; //--- ToDo: Localize;
      	x = 0.386562 * safezoneW + safezoneX;
      	y = 0.599 * safezoneH + safezoneY;
      	w = 0.0515625 * safezoneW;
      	h = 0.044 * safezoneH;
      };
      class RscButtonMenu_2408: Life_RscStructuredText
      {
      	idc = 2408;
        colorBackground[] = {0, 0, 0, 0};
      	text = ""; //--- ToDo: Localize;
      	x = 0.561875 * safezoneW + safezoneX;
      	y = 0.599 * safezoneH + safezoneY;
      	w = 0.0515625 * safezoneW;
      	h = 0.044 * safezoneH;
      };
      class RscButtonMenu_2411: Life_RscButtonInvisible
      {
      	idc = 2411;
        onButtonClick = "closeDialog 0; [10] call life_fnc_depositQuick";
      	x = 0.329844 * safezoneW + safezoneX;
      	y = 0.324 * safezoneH + safezoneY;
      	w = 0.0464063 * safezoneW;
      	h = 0.066 * safezoneH;
      	tooltip = "Deposit $10"; //--- ToDo: Localize;
      };
      class RscButtonMenu_2412: Life_RscButtonInvisible
      {
      	idc = 2412;
        onButtonClick = "closeDialog 0; [50] call life_fnc_depositQuick";
      	x = 0.329844 * safezoneW + safezoneX;
      	y = 0.412 * safezoneH + safezoneY;
      	w = 0.0464063 * safezoneW;
      	h = 0.066 * safezoneH;
      	tooltip = "Deposit $50"; //--- ToDo: Localize;
      };
      class RscButtonMenu_2413: Life_RscButtonInvisible
      {
      	idc = 2413;
        onButtonClick = "closeDialog 0; [100] call life_fnc_depositQuick";
      	x = 0.329844 * safezoneW + safezoneX;
      	y = 0.5 * safezoneH + safezoneY;
      	w = 0.0464063 * safezoneW;
      	h = 0.066 * safezoneH;
      	tooltip = "Deposit $100"; //--- ToDo: Localize;
      };
      class RscButtonMenu_2414: Life_RscButtonInvisible
      {
      	idc = 2414;
        onButtonClick = "closeDialog 0; [200] call life_fnc_depositQuick";
      	x = 0.329844 * safezoneW + safezoneX;
      	y = 0.577 * safezoneH + safezoneY;
      	w = 0.0464063 * safezoneW;
      	h = 0.066 * safezoneH;
      	tooltip = "Deposit $200"; //--- ToDo: Localize;
      };
      class RscButtonMenu_2415: Life_RscButtonInvisible
      {
      	idc = 2415;
        onButtonClick = "closeDialog 0; [500] call life_fnc_depositQuick";
      	x = 0.62375 * safezoneW + safezoneX;
      	y = 0.324 * safezoneH + safezoneY;
      	w = 0.0464063 * safezoneW;
      	h = 0.066 * safezoneH;
      	tooltip = "Deposit $500"; //--- ToDo: Localize;
      };
      class RscButtonMenu_2416: Life_RscButtonInvisible
      {
      	idc = 2416;
        onButtonClick = "closeDialog 0; [1000] call life_fnc_depositQuick";
      	x = 0.62375 * safezoneW + safezoneX;
      	y = 0.412 * safezoneH + safezoneY;
      	w = 0.0464063 * safezoneW;
      	h = 0.066 * safezoneH;
      	tooltip = "Deposit $1,000"; //--- ToDo: Localize;
      };
      class RscButtonMenu_2417: Life_RscButtonInvisible
      {
      	idc = 2417;
        onButtonClick = "closeDialog 0; [5000] call life_fnc_depositQuick";
      	x = 0.62375 * safezoneW + safezoneX;
      	y = 0.5 * safezoneH + safezoneY;
      	w = 0.0464063 * safezoneW;
      	h = 0.066 * safezoneH;
      	tooltip = "Deposit $5,000"; //--- ToDo: Localize;
      };
    };
};

class taki_atm_withdraw {
  idd = 27004;
  name= "taki_atm_withdraw";
	movingEnable = false;
	enableSimulation = true;

  class controlsBackground {
    class RscPicture_1200: Life_RscPicture
    {
    	idc = 1200;
    	text = "icons\atmbackground.paa";
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.402187 * safezoneW;
    	h = 0.671 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscPicture_1201: Life_RscPicture
    {
    	idc = 1201;
    	text = "icons\atmbank.paa";
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.0257812 * safezoneW;
    	h = 0.044 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscPicture_1202: Life_RscPicture
    {
    	idc = 1202;
    	text = "icons\atmcash.paa";
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.412 * safezoneH + safezoneY;
    	w = 0.0257812 * safezoneW;
    	h = 0.044 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
  };
  class controls {
    class RscButtonMenu_2400: Life_RscStructuredText
    {
    	idc = 2400;
    	text = ""; //--- ToDo: Localize;
      x = 0.438125 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2409: Life_RscButtonInvisible
    {
    	idc = 2409;
      onButtonClick = "[] call life_fnc_bankWithdraw;";
    	x = 0.62375 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Confirm and Withdraw";
    };
    class RscButtonMenu_2410: Life_RscButtonInvisible
    {
    	idc = -1;
      onButtonClick = "closeDialog 0;";
    	x = 0.453594 * safezoneW + safezoneX;
    	y = 0.709 * safezoneH + safezoneY;
    	w = 0.0928125 * safezoneW;
    	h = 0.033 * safezoneH;
    	tooltip = "Close";
    };
    class RscButtonMenu_2401: Life_RscStructuredText
    {
    	idc = 2401;
    	text = "";
      x = 0.448438 * safezoneW + safezoneX;
    	y = 0.368 * safezoneH + safezoneY;
    	w = 0.134062 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscEdit_1400: Life_RscEdit
    {
    	idc = 1416;
      text = "1";
      x = 0.453594 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2402: Life_RscStructuredText
    {
    	idc = 2402;
    	text = "";
      x = 0.396875 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2403: Life_RscStructuredText
    {
    	idc = 2403;
    	text = "";
    	x = 0.448438 * safezoneW + safezoneX;
    	y = 0.423 * safezoneH + safezoneY;
    	w = 0.134062 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2404: Life_RscStructuredText
    {
    	idc = 2404;
    	text = "";
    	x = 0.510312 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.0979687 * safezoneW;
    	h = 0.044 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
  };
};

class taki_atm_deposit {
  idd = 27005;
  name= "taki_atm_deposit";
	movingEnable = false;
	enableSimulation = true;

  class controlsBackground {
    class RscPicture_1200: Life_RscPicture
    {
    	idc = 1200;
    	text = "icons\atmbackground.paa";
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.402187 * safezoneW;
    	h = 0.671 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscPicture_1201: Life_RscPicture
    {
    	idc = 1201;
    	text = "icons\atmbank.paa";
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.0257812 * safezoneW;
    	h = 0.044 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscPicture_1202: Life_RscPicture
    {
    	idc = 1202;
    	text = "icons\atmcash.paa";
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.412 * safezoneH + safezoneY;
    	w = 0.0257812 * safezoneW;
    	h = 0.044 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
  };
  class controls {
    class RscButtonMenu_2400: Life_RscStructuredText
    {
    	idc = 2400;
    	text = ""; //--- ToDo: Localize;
    	x = 0.438125 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2409: Life_RscButtonInvisible
    {
    	idc = 2409;
      onButtonClick = "[] call life_fnc_bankDeposit;";
    	x = 0.62375 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Confirm and Deposit"; //--- ToDo: Localize;
    };
    class RscButtonMenu_2410: Life_RscButtonInvisible
    {
    	idc = -1;
      onButtonClick = "closeDialog 0;";
    	x = 0.453594 * safezoneW + safezoneX;
    	y = 0.709 * safezoneH + safezoneY;
    	w = 0.0928125 * safezoneW;
    	h = 0.033 * safezoneH;
    	tooltip = "Close"; //--- ToDo: Localize;
    };
    class RscButtonMenu_2401: Life_RscStructuredText
    {
    	idc = 2401;
    	text = ""; //--- ToDo: Localize;
      x = 0.448438 * safezoneW + safezoneX;
    	y = 0.368 * safezoneH + safezoneY;
    	w = 0.134062 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscEdit_1400: Life_RscEdit
    {
    	idc = 1420;
      text = "1";
      x = 0.453594 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2402: Life_RscStructuredText
    {
    	idc = 2402;
    	text = ""; //--- ToDo: Localize;
      x = 0.396875 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2403: Life_RscStructuredText
    {
    	idc = 2403;
    	text = "";
    	x = 0.448438 * safezoneW + safezoneX;
    	y = 0.423 * safezoneH + safezoneY;
    	w = 0.134062 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2404: Life_RscStructuredText
    {
    	idc = 2404;
    	text = "";
    	x = 0.510312 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.0979687 * safezoneW;
    	h = 0.044 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
  };
};


class RscButtonMenu_2404: RscButtonMenu
{
	idc = 2404;
	text = "Gang Bank"; //--- ToDo: Localize;
	x = 0.448438 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.033 * safezoneH;
};
class RscButtonMenu_2405: RscButtonMenu
{
	idc = 2405;
	text = "Withdraw"; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.044 * safezoneH;
};
class RscButtonMenu_2406: RscButtonMenu
{
	idc = 2406;
	text = "Deposit"; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.044 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


class taki_atm_gang {
  idd = 27006;
  name= "taki_atm_gang";
	movingEnable = false;
	enableSimulation = true;

  class controlsBackground {
    class RscPicture_1200: Life_RscPicture
    {
    	idc = 1200;
    	text = "icons\atmbackground.paa";
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.402187 * safezoneW;
    	h = 0.671 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscPicture_1201: RscPicture
    {
    	idc = 1201;
    	text = "C:\Users\Elias\Documents\TakistanLifeMission\mpmissions\ArmANetwork.Takistan\icons\gangname.paa";
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.0257812 * safezoneW;
    	h = 0.044 * safezoneH;
    };
    class RscPicture_1202: RscPicture
    {
    	idc = 1202;
    	text = "C:\Users\Elias\Documents\TakistanLifeMission\mpmissions\ArmANetwork.Takistan\icons\atmbank.paa";
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.412 * safezoneH + safezoneY;
    	w = 0.0257812 * safezoneW;
    	h = 0.044 * safezoneH;
    };
  };
  class controls {
    class RscButtonMenu_2400: Life_RscStructuredText
    {
    	idc = 2400;
    	text = "";
      colorBackground[] = {0, 0, 0, 0};
    	x = 0.438125 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2409: Life_RscButtonInvisible
    {
    	idc = 2409;
      onButtonClick = "[] call life_fnc_gangDeposit";
    	x = 0.62375 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Confirm and Deposit"; //--- ToDo: Localize;
    };
    class RscButtonMenu_2410: Life_RscButtonInvisible
    {
    	idc = 2410;
      onButtonClick = "closeDialog 0;";
    	x = 0.453594 * safezoneW + safezoneX;
    	y = 0.709 * safezoneH + safezoneY;
    	w = 0.0928125 * safezoneW;
    	h = 0.033 * safezoneH;
    	tooltip = "Close"; //--- ToDo: Localize;
    };
    class RscButtonMenu_2401: Life_RscStructuredText
    {
    	idc = 2401;
    	text = "";
      x = 0.448438 * safezoneW + safezoneX;
    	y = 0.368 * safezoneH + safezoneY;
    	w = 0.134062 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscEdit_1400: Life_RscEdit
    {
    	idc = 2702;
      text = "1";
      x = 0.453594 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2402: Life_RscStructuredText
    {
    	idc = 2402;
    	text = "";
      x = 0.396875 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2403: Life_RscButtonInvisible
    {
    	idc = 2403;
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0464063 * safezoneW;
    	h = 0.066 * safezoneH;
    	tooltip = "Confirm and Withdraw";
    };
    class RscButtonMenu_2404: Life_RscStructuredText
    {
    	idc = 2404;
    	text = "";
    	x = 0.448438 * safezoneW + safezoneX;
    	y = 0.423 * safezoneH + safezoneY;
    	w = 0.134062 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2405: Life_RscStructuredText
    {
    	idc = 2405;
    	text = "";
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.044 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class RscButtonMenu_2406: Life_RscStructuredText
    {
    	idc = 2406;
    	text = "";
    	x = 0.5 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.044 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
  };
};
