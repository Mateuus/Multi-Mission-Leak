class give_items {
	idd = 57632;
	name= "give_items";
	movingEnable = 0;
	enableSimulation = 1;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
      text = "";
    	x = 0.396875 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.195937 * safezoneW;
    	h = 0.352 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
  };
  class controls {
    class RscText_1001: Life_RscText
    {
    	idc = 1001;
    	text = "Give Items To"; //--- ToDo: Localize;
    	x = 0.396876 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.195937 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 1500;
      text = "";
    	x = 0.407187 * safezoneW + safezoneX;
    	y = 0.412 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.187 * safezoneH;
      sizeEx = 0.035;
    };
    class RscText_1002: RscText
    {
    	idc = 1002;
    	text = "Items in Backpack:"; //--- ToDo: Localize;
    	x = 0.402031 * safezoneW + safezoneX;
    	y = 0.379 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscEdit_1400: Life_RscEdit
    {
    	idc = 1400;
      text = "";
    	x = 0.4175 * safezoneW + safezoneX;
    	y = 0.632 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscText_1003: Life_RscText
    {
    	idc = -1;
    	text = "Amount to Give:"; //--- ToDo: Localize;
    	x = 0.402031 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Give"; //--- ToDo: Localize;
    	x = 0.438125 * safezoneW + safezoneX;
    	y = 0.676 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      class Attributes
      {
        align = "center";
      };
			onButtonClick = "call life_fnc_nuguj";
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = -1;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.396875 * safezoneW + safezoneX;
    	y = 0.709 * safezoneH + safezoneY;
    	w = 0.195937 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
  };
};

class give_money {
	idd = 57633;
	name= "give_money";
	movingEnable = 0;
	enableSimulation = 1;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
      text = "";
    	x = 0.396874 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.195937 * safezoneW;
    	h = 0.22 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
  };
  class controls {
    class RscText_1001: Life_RscText
    {
    	idc = 1001;
    	text = "Give Cash To"; //--- ToDo: Localize;
    	x = 0.396876 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.195937 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
    class RscEdit_1400: Life_RscEdit
    {
    	idc = 1400;
      text = "";
    	x = 0.4175 * safezoneW + safezoneX;
    	y = 0.5 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscText_1003: Life_RscText
    {
    	idc = 1003;
    	text = "Cash Amount to Give:"; //--- ToDo: Localize;
    	x = 0.402031 * safezoneW + safezoneX;
    	y = 0.467 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Hand over"; //--- ToDo: Localize;
    	x = 0.438125 * safezoneW + safezoneX;
    	y = 0.544 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      class Attributes
      {
        align = "center";
      };
			onButtonClick = "call life_fnc_pupet;";
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.396875 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.195937 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
    class RscStructuredText_1100: Life_RscStructuredText
    {
    	idc = 1100;
      text = "";
    	x = 0.407187 * safezoneW + safezoneX;
    	y = 0.401 * safezoneH + safezoneY;
    	w = 0.175313 * safezoneW;
    	h = 0.066 * safezoneH;
    };
  };
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Rath Bone, v1.063, #Penawi)
////////////////////////////////////////////////////////

class give_keys {
	idd = 57635;
	name= "give_keys";
	movingEnable = 0;
	enableSimulation = 1;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
      text = "";
    	x = 0.365937 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.268125 * safezoneW;
    	h = 0.231 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
  };
  class controls {
    class RscText_1001: Life_RscText
    {
    	idc = 1001;
    	text = "Give Keys To"; //--- ToDo: Localize;
    	x = 0.365937 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.268125 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Give Keys"; //--- ToDo: Localize;
    	x = 0.443281 * safezoneW + safezoneX;
    	y = 0.555 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      class Attributes
      {
        align = "center";
      };
			onButtonClick = "call life_fnc_druze;";
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.365937 * safezoneW + safezoneX;
    	y = 0.588 * safezoneH + safezoneY;
    	w = 0.268125 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 1500;
      text = "";
    	x = 0.37625 * safezoneW + safezoneX;
    	y = 0.423 * safezoneH + safezoneY;
    	w = 0.2475 * safezoneW;
    	h = 0.121 * safezoneH;
			sizeEx = 0.03;
    };
    class RscText_1002: Life_RscText
    {
    	idc = -1;
    	text = "Your Vehicles"; //--- ToDo: Localize;
    	x = 0.37625 * safezoneW + safezoneX;
    	y = 0.39 * safezoneH + safezoneY;
    	w = 0.159844 * safezoneW;
    	h = 0.033 * safezoneH;
    };
  };
};
