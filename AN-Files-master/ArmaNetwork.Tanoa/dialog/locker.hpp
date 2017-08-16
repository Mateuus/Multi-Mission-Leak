////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////
class an_lockers
{
	idd = 6985;
	name= "an_lockers";
	movingEnable = 0;
	enableSimulation = 1;

  class controlsBackground {

    class RscPicture_1200: Life_RscPicture
    {
    	idc = -1;
    	text = "\sndimg\sahrani\icons\anlocker.paa";
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.181 * safezoneH + safezoneY;
    	w = 0.37125 * safezoneW;
    	h = 0.638 * safezoneH;
    };
  };
  class controls {
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 1500;
      text = "";
    	x = 0.515469 * safezoneW + safezoneX;
    	y = 0.346 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.363 * safezoneH;
			colorBackground[] = {0,0,0,0};
      sizeEx = 0.04;
    };
    class RscListbox_1501: Life_RscListbox
    {
    	idc = 1501;
      text = "";
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.346 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.363 * safezoneH;
			colorBackground[] = {0,0,0,0};
      sizeEx = 0.04;
    };
    class RscButtonMenu_2400: Life_RscButtonInvisible
    {
    	idc = -1;
    	text = ""; //--- ToDo: Localize;
    	x = 0.489687 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.020625 * safezoneW;
    	h = 0.033 * safezoneH;
      onButtonClick = "[0] call life_fnc_chevuwra;";
    };
    class RscButtonMenu_2401: Life_RscButtonInvisible
    {
    	idc = -1;
    	text = ""; //--- ToDo: Localize;
    	x = 0.489687 * safezoneW + safezoneX;
    	y = 0.533 * safezoneH + safezoneY;
    	w = 0.020625 * safezoneW;
    	h = 0.033 * safezoneH;
      onButtonClick = "[1] call life_fnc_chevuwra;";
    };
    class rentdate: Life_RscStructuredText
    {
    	idc = 2402;
      text = "";
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.731 * safezoneH + safezoneY;
    	w = 0.226875 * safezoneW;
    	h = 0.044 * safezoneH;
    };
    class closebutton: Life_RscButtonInvisible
    {
    	idc = -1;
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.775 * safezoneH + safezoneY;
    	w = 0.226875 * safezoneW;
    	h = 0.044 * safezoneH;
      onButtonClick = "[] call life_fnc_sumepudr";
    };
    class renewrentbutton: Life_RscButtonInvisible
    {
    	idc = 2404;
      text = "";
    	x = 0.551562 * safezoneW + safezoneX;
    	y = 0.731 * safezoneH + safezoneY;
    	w = 0.134062 * safezoneW;
    	h = 0.044 * safezoneH;
    };
  };
};


class an_locker_request
{
	idd = 6432;
	name= "an_locker_request";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class RscPicture_1200: Life_RscPicture
		{
			idc = -1;
			text = "\sndimg\sahrani\icons\anlockerrent.paa";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.638 * safezoneH;
		};
	};
	class controls {
		class signnameedit: Life_RscEdit
		{
			idc = 1400;
		  text = "";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		  sizeEx = 0.1;
		};
		class signbutton: Life_RscButtonInvisible
		{
			idc = -1;
		  text = "";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.044 * safezoneH;
		  onButtonClick = "[2] call life_fnc_yeyevabr;";
		};
		class closebutton: Life_RscButtonInvisible
		{
			idc = -1;
		  text = "";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		  onButtonClick = "closeDialog 0;";
		};
	};
};
