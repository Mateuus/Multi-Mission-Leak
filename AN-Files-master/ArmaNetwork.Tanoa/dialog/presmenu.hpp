class president_menu
{
  idd = 50300;
  name = "president_menu";
	movingEnabled = 0;
	enableSimulation = 1;

  class controlsBackground {
    class RscPicture_1200: Life_RscPicture
    {
    	idc = -1;
    	text = "\sndimg\sahrani\icons\angovmenu.paa";
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.181 * safezoneH + safezoneY;
    	w = 0.37125 * safezoneW;
    	h = 0.638 * safezoneH;
    };
  };
  class controls {
    class createlawsbutton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.5 * safezoneW + safezoneX;
    	y = 0.379 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.033 * safezoneH;
      onButtonClick = "closeDialog 0; [] call life_fnc_maruhebra;";
    };
    class settaxlaw: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.5 * safezoneW + safezoneX;
    	y = 0.423 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.033 * safezoneH;
      onButtonClick = "closeDialog 0; createDialog ""adjust_taxes"";";
    };
    class publicannouncementb: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.5 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0; createDialog ""public_announcement"";";
    };
    class pardonbutton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.5 * safezoneW + safezoneX;
    	y = 0.522 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class declaremartiallawb: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.5 * safezoneW + safezoneX;
    	y = 0.566 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class leaveofficebutton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.5 * safezoneW + safezoneX;
    	y = 0.61 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class closebutton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.775 * safezoneH + safezoneY;
    	w = 0.221719 * safezoneW;
    	h = 0.044 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
    class governmentfunds: Life_RscStructuredText
    {
    	idc = 2407;
    	text = "";
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class popularity: Life_RscStructuredText
    {
    	idc = 2408;
    	text = "";
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.5 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class currenttaxes: Life_RscStructuredText
    {
    	idc = 2409;
    	text = "";
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.423 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.033 * safezoneH;
    };
  };
};

class togglelaw_menu
{
  idd = 50400;
  name = "togglelaw_menu";
	movingEnabled = 0;
	enableSimulation = 1;

  class controlsBackground {
    class RscPicture_1200: Life_RscPicture
    {
    	idc = -1;
    	text = "\sndimg\sahrani\icons\angovlaw.paa";
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.181 * safezoneH + safezoneY;
    	w = 0.37125 * safezoneW;
    	h = 0.638 * safezoneH;
    };
  };

  class controls {
    class healthtoggle: Life_RscStructuredText
    {
    	idc = 3003;
    	text = "YES"; //--- ToDo: Localize;
    	x = 0.463906 * safezoneW + safezoneX;
    	y = 0.39 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class weedtoggle: Life_RscStructuredText
    {
    	idc = 3004;
    	text = "YES"; //--- ToDo: Localize;
    	x = 0.463906 * safezoneW + safezoneX;
    	y = 0.434 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class paytoggle: Life_RscStructuredText
    {
    	idc = 3005;
    	text = "YES"; //--- ToDo: Localize;
    	x = 0.463906 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class penaltytoggle: Life_RscStructuredText
    {
    	idc = 3006;
    	text = "YES"; //--- ToDo: Localize;
    	x = 0.463906 * safezoneW + safezoneX;
    	y = 0.544 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class essentialstoggle: Life_RscStructuredText
    {
    	idc = 3007;
    	text = "YES"; //--- ToDo: Localize;
    	x = 0.463906 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class banktaxestoggle: Life_RscStructuredText
    {
    	idc = 3008;
    	text = "YES"; //--- ToDo: Localize;
    	x = 0.463906 * safezoneW + safezoneX;
    	y = 0.643 * safezoneH + safezoneY;
    	w = 0.0515625 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class healthfunding: Life_RscStructuredText
    {
    	idc = 2406;
    	text = " $500000"; //--- ToDo: Localize;
    	x = 0.520625 * safezoneW + safezoneX;
    	y = 0.39 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class weedfunding: Life_RscStructuredText
    {
    	idc = 2407;
    	text = " $500000"; //--- ToDo: Localize;
    	x = 0.520625 * safezoneW + safezoneX;
    	y = 0.434 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class increasedpayfunding: Life_RscStructuredText
    {
    	idc = 2408;
    	text = " $500000"; //--- ToDo: Localize;
    	x = 0.520625 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class penaltyfunding: Life_RscStructuredText
    {
    	idc = 2409;
    	text = " $500000"; //--- ToDo: Localize;
    	x = 0.520625 * safezoneW + safezoneX;
    	y = 0.544 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class essentialsfunding: Life_RscStructuredText
    {
    	idc = 2410;
    	text = " $500000"; //--- ToDo: Localize;
    	x = 0.520625 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class banktaxesfunding: Life_RscStructuredText
    {
    	idc = 2411;
    	text = " $500000"; //--- ToDo: Localize;
    	x = 0.520625 * safezoneW + safezoneX;
    	y = 0.643 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class closebutton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.775 * safezoneH + safezoneY;
    	w = 0.211406 * safezoneW;
    	h = 0.044 * safezoneH;
      onButtonClick = "closeDialog 0";
    };
    class healthcarebutton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.603125 * safezoneW + safezoneX;
    	y = 0.39 * safezoneH + safezoneY;
    	w = 0.061875 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[3,500000] call life_fnc_masefaju;";
    };
    class legmaributton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.603125 * safezoneW + safezoneX;
    	y = 0.445 * safezoneH + safezoneY;
    	w = 0.061875 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[4,100000] call life_fnc_masefaju;";
    };
    class increasedpaybutton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.603125 * safezoneW + safezoneX;
    	y = 0.5 * safezoneH + safezoneY;
    	w = 0.061875 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[5,850000] call life_fnc_masefaju;";
    };
    class deathpenaltybutton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.603125 * safezoneW + safezoneX;
    	y = 0.555 * safezoneH + safezoneY;
    	w = 0.061875 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[6,900000] call life_fnc_masefaju;";
    };
    class freeessentials: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.603125 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.061875 * safezoneW;
    	h = 0.033 * safezoneH;
      onButtonClick = "[7,750000] call life_fnc_masefaju;";
    };
    class lowertaxesbutton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.603125 * safezoneW + safezoneX;
    	y = 0.643 * safezoneH + safezoneY;
    	w = 0.061875 * safezoneW;
    	h = 0.033 * safezoneH;
      onButtonClick = "[8,850000] call life_fnc_masefaju;";
    };
  };
};

class adjust_taxes
{
  idd = 50500;
  name = "adjust_taxes";
	movingEnabled = 0;
	enableSimulation = 1;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.340156 * safezoneW + safezoneX;
    	y = 0.379 * safezoneH + safezoneY;
    	w = 0.309375 * safezoneW;
    	h = 0.209 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Adjust Taxes"; //--- ToDo: Localize;
    	x = 0.340156 * safezoneW + safezoneX;
    	y = 0.346 * safezoneH + safezoneY;
    	w = 0.309375 * safezoneW;
    	h = 0.033 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
  };
  class controls {
    class RscStructuredText_1100: Life_RscStructuredText
    {
    	idc = -1;
    	text = "Adjust the taxes here. Enter a number between 0 and 99. <br/> - Server Administration"; //--- ToDo: Localize;
    	x = 0.345312 * safezoneW + safezoneX;
    	y = 0.39 * safezoneH + safezoneY;
    	w = 0.299062 * safezoneW;
    	h = 0.077 * safezoneH;
    };
    class RscEdit_1400: Life_RscEdit
    {
    	idc = 1400;
      text = "";
    	x = 0.350469 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.28875 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = -1;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.340156 * safezoneW + safezoneX;
    	y = 0.588 * safezoneH + safezoneY;
    	w = 0.309375 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = -1;
    	text = "Adjust Taxes"; //--- ToDo: Localize;
    	x = 0.417499 * safezoneW + safezoneX;
    	y = 0.533 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[] call life_fnc_zepruvus;";
    };
  };
};

class public_announcement
{
  idd = 50600;
  name = "public_announcement";
	movingEnabled = 0;
	enableSimulation = 1;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
    	x = 0.340156 * safezoneW + safezoneX;
    	y = 0.379 * safezoneH + safezoneY;
    	w = 0.309375 * safezoneW;
    	h = 0.209 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Public Announcement"; //--- ToDo: Localize;
    	x = 0.340156 * safezoneW + safezoneX;
    	y = 0.346 * safezoneH + safezoneY;
    	w = 0.309375 * safezoneW;
    	h = 0.033 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
  };

  class controls {
    class RscStructuredText_1100: Life_RscStructuredText
    {
    	idc = 1100;
    	text = "Send out a Public Announcement. Remember, No Troll Messages! <br/>- Server Administration";
    	x = 0.345312 * safezoneW + safezoneX;
    	y = 0.39 * safezoneH + safezoneY;
    	w = 0.299062 * safezoneW;
    	h = 0.077 * safezoneH;
    };
    class RscEdit_1400: Life_RscEdit
    {
    	idc = 1400;
      text = "";
    	x = 0.350469 * safezoneW + safezoneX;
    	y = 0.478 * safezoneH + safezoneY;
    	w = 0.28875 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.340156 * safezoneW + safezoneX;
    	y = 0.588 * safezoneH + safezoneY;
    	w = 0.309375 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Send Public Announcement"; //--- ToDo: Localize;
    	x = 0.417499 * safezoneW + safezoneX;
    	y = 0.533 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[(ctrlText 1400)] call life_fnc_frusagabr;";
    };
  };
};

class civ_govmenu
{
  idd = 50700;
  name = "civ_govmenu";
	movingEnabled = 0;
	enableSimulation = 1;

  class controlsBackground {
    class RscPicture_1200: Life_RscPicture
    {
    	idc = -1;
    	text = "\sndimg\sahrani\icons\angovcivmenu.paa";
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.181 * safezoneH + safezoneY;
    	w = 0.37125 * safezoneW;
    	h = 0.638 * safezoneH;
    };
  };
  class controls {
    class lawslistbox: Life_RscListbox
    {
    	idc = 1500;
      text = "";
    	x = 0.329843 * safezoneW + safezoneX;
    	y = 0.599 * safezoneH + safezoneY;
    	w = 0.340312 * safezoneW;
    	h = 0.154 * safezoneH;
    	colorBackground[] = {0,0,0,0};
    	colorActive[] = {0,0,0,0};
      sizeEx = 0.04;
    };
    class supportbutton: Life_RscButtonInvisible
    {
    	idc = 2400;
      text = "";
    	x = 0.577344 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.0825 * safezoneW;
    	h = 0.033 * safezoneH;
      onButtonClick = "[0] call life_fnc_buduferac;";
    };
    class opposebutton: Life_RscButtonInvisible
    {
    	idc = 2401;
      text = "";
    	x = 0.577344 * safezoneW + safezoneX;
    	y = 0.555 * safezoneH + safezoneY;
    	w = 0.0825 * safezoneW;
    	h = 0.033 * safezoneH;
      onButtonClick = "[1] call life_fnc_buduferac;";
    };
    class closebutton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.775 * safezoneH + safezoneY;
    	w = 0.360937 * safezoneW;
    	h = 0.044 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
    class RscButtonMenu_2403: Life_RscStructuredText
    {
    	idc = 2403;
    	text = "John Doe"; //--- ToDo: Localize;
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.379 * safezoneH + safezoneY;
    	w = 0.185625 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2404: Life_RscStructuredText
    {
    	idc = 2404;
    	text = "Yes"; //--- ToDo: Localize;
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.43 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2405: Life_RscStructuredText
    {
    	idc = 2405;
    	text = "14 Days"; //--- ToDo: Localize;
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.485 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2406: Life_RscStructuredText
    {
    	idc = 2406;
    	text = "15 percent"; //--- ToDo: Localize;
    	x = 0.329844 * safezoneW + safezoneX;
    	y = 0.535 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
    };
  };
};

class angovcand_menu
{
	idd = 6800;
	name= "angovcand_menu";
	movingEnable = 0;
	enableSimulation = 1;

  class controlsBackground {
    class RscPicture_1200: Life_RscPicture
    {
    	idc = -1;
    	text = "\sndimg\sahrani\icons\angovcand.paa";
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.181 * safezoneH + safezoneY;
    	w = 0.37125 * safezoneW;
    	h = 0.638 * safezoneH;
    };
  };
  class controls {
    class investamount: Life_RscEdit
    {
    	idc = 6802;
      text = "1";
    	x = 0.336615 * safezoneW + safezoneX;
    	y = 0.436111 * safezoneH + safezoneY;
    	w = 0.319687 * safezoneW;
    	h = 0.033 * safezoneH;
      colorBackground[] = {0,0,0,0};
    };
    class policydescription: Life_RscEdit
    {
    	idc = 6804;
      text = "";
      style = 16;
    	x = 0.335 * safezoneW + safezoneX;
    	y = 0.533 * safezoneH + safezoneY;
    	w = 0.319687 * safezoneW;
    	h = 0.165 * safezoneH;
      colorBackground[] = {0,0,0,0};
    };
    class sendcandbutton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.587656 * safezoneW + safezoneX;
    	y = 0.72 * safezoneH + safezoneY;
    	w = 0.0825 * safezoneW;
    	h = 0.033 * safezoneH;
      onButtonClick = "[] call life_fnc_puhuqust;";
    };
    class closebutton: Life_RscButtonInvisible
    {
    	idc = -1;
      text = "";
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.775 * safezoneH + safezoneY;
    	w = 0.242344 * safezoneW;
    	h = 0.044 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
  };
};

class angovvote_menu
{
	idd = 6900;
	name= "angovvote_menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class RscPicture_1200: Life_RscPicture
		{
			idc = -1;
			text = "\sndimg\sahrani\icons\angovvoting.paa";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.638 * safezoneH;
		};
	};
	class controls {
		class candidatelist: Life_RscListbox
		{
			idc = 6902;
			text = "";
			x = 0.332937 * safezoneW + safezoneX;
			y = 0.3625 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.38225 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
			sizeEx = 0.04;
			onLBSelChanged = "[false,_this] call life_fnc_trespuse";
		};
		class infostructured: Life_RscStructuredText
		{
			idc = 6903;
			text = "";
			x = 0.467 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.20295 * safezoneW;
			h = 0.374 * safezoneH;
		};
		class votebutton: Life_RscButtonInvisible
		{
			idc = 6905;
			text = "";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "life_voted = true; [true,lbData[6902,(lbCurSel 6902)]] call life_fnc_trespuse; closeDialog 0;";
		};
		class closebutton: Life_RscButtonInvisible
		{
			idc = -1;
			text = "";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
	};
};
