class lawyer_request {
  idd = 85234;
  name= "lawyer_request";
  movingEnable = 0;
  enableSimulation = 1;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.29375 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.4125 * safezoneW;
    	h = 0.308 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = 1001;
    	text = "Request Lawyer"; //--- ToDo: Localize;
    	x = 0.29375 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.4125 * safezoneW;
    	h = 0.033 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
  };
  class controls {
    class RscStructuredText_1100: Life_RscStructuredText
    {
    	idc = 1100;
    	text = "Request a Lawyer here.  You must include the crimes you're being charged with as well as a fee to be paid to the Lawyer that potentially accepts your offer. The higher the fee, the higher of a chance to be represented."; //--- ToDo: Localize;
    	x = 0.304062 * safezoneW + safezoneX;
    	y = 0.401 * safezoneH + safezoneY;
    	w = 0.391875 * safezoneW;
    	h = 0.066 * safezoneH;
    };
    class RscText_1002: Life_RscText
    {
    	idc = 1002;
    	text = "Crimes:"; //--- ToDo: Localize;
    	x = 0.304062 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.0670312 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscText_1003: Life_RscText
    {
    	idc = 1003;
    	text = "Fee to be paid:"; //--- ToDo: Localize;
    	x = 0.304062 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.0670312 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscEdit_1400: Life_RscEdit
    {
    	idc = 1400;
      text = "";
    	x = 0.309219 * safezoneW + safezoneX;
    	y = 0.522 * safezoneH + safezoneY;
    	w = 0.376406 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscEdit_1401: Life_RscEdit
    {
    	idc = 1401;
      text = "5000";
    	x = 0.309219 * safezoneW + safezoneX;
    	y = 0.61 * safezoneH + safezoneY;
    	w = 0.103125 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Accept and Request Lawyer"; //--- ToDo: Localize;
    	x = 0.29375 * safezoneW + safezoneX;
    	y = 0.665 * safezoneH + safezoneY;
    	w = 0.324844 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_diebriadludluch;closeDialog 0;";
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.628906 * safezoneW + safezoneX;
    	y = 0.665 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
  };
};

class lawyer_jobs {
  idd = 85250;
  name= "lawyer_jobs";
  movingEnable = 0;
  enableSimulation = 1;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.324687 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.350625 * safezoneW;
    	h = 0.374 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Available Jobs"; //--- ToDo: Localize;
    	x = 0.324687 * safezoneW + safezoneX;
    	y = 0.291 * safezoneH + safezoneY;
    	w = 0.350625 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
  };
  class controls {
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.597969 * safezoneW + safezoneX;
    	y = 0.687 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closedialog 0;";
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Accept and Take Job"; //--- ToDo: Localize;
    	x = 0.324687 * safezoneW + safezoneX;
    	y = 0.687 * safezoneH + safezoneY;
    	w = 0.262969 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_moaswlaswoexiam;";
    };
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 1500;
      text = "";
    	x = 0.335 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.308 * safezoneH;
      sizeEx = 0.035;
      onLBSelChanged = "call life_fnc_kiufrludoegoawr;";
    };
    class RscText_1002: Life_RscText
    {
    	idc = 1002;
    	text = "List of Jobs"; //--- ToDo: Localize;
    	x = 0.335 * safezoneW + safezoneX;
    	y = 0.335 * safezoneH + safezoneY;
    	w = 0.0825 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscStructuredText_1100: Life_RscStructuredText
    {
    	idc = 1100;
      text = "";
    	x = 0.489687 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.308 * safezoneH;
    };
    class RscText_1003: Life_RscText
    {
    	idc = 1003;
    	text = "Additional Information"; //--- ToDo: Localize;
    	x = 0.489687 * safezoneW + safezoneX;
    	y = 0.335 * safezoneH + safezoneY;
    	w = 0.170156 * safezoneW;
    	h = 0.022 * safezoneH;
    };
  };
};
