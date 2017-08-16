class patienthistory {
	idd = 15208;
	name= "patienthistory";
	movingEnable = 0;
	enableSimulation = 1;
	class controlsBackground {

		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "";
			x = 0.293749 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.429 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "Patient File"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscPicture_1200: Life_RscPicture
		{
			idc = 1200;
			text = "\sndimg\sahrani\icons\medicalbody.paa";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.44 * safezoneH;
		};
	};
	class controls {
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Close"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class RscPicture_1201: Life_RscPicture
		{
			idc = 1201;
			text = "\sndimg\sahrani\icons\medicaltorso.paa";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class RscPicture_1202: Life_RscPicture
		{
			idc = 1202;
			text = "\sndimg\sahrani\icons\medicalarms.paa";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class RscPicture_1203: Life_RscPicture
		{
			idc = 1203;
			text = "\sndimg\sahrani\icons\medicalhead.paa";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class RscPicture_1204: Life_RscPicture
		{
			idc = 1204;
			text = "\sndimg\sahrani\icons\medicallegs.paa";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "State of Patient"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class stateofbody: Life_RscText
		{
			idc = 1003;
			text = "Alive"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1004: Life_RscText
		{
			idc = 1004;
			text = "Cause of Death"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1005: Life_RscText
		{
			idc = 1005;
			text = "Unknown"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1006: Life_RscText
		{
			idc = 1006;
			text = "Occupation"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class occupation: Life_RscText
		{
			idc = 1007;
			text = "Unknown"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1008: Life_RscText
		{
			idc = 1008;
			text = "Blood Level"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class bloodlevel: Life_RscText
		{
			idc = 1009;
			text = "";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1010: Life_RscText
		{
			idc = 1010;
			text = "Bleed Rate"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class bleedrate: Life_RscText
		{
			idc = 1011;
			text = "";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1012: Life_RscText
		{
			idc = 1012;
			text = "Blood Regen Rate"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class regenrate: Life_RscText
		{
			idc = 1013;
			text = "";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Declare Dead"; //--- ToDo: Localize;
			x = 0.592813 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2402;
			text = "Revive"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class bodycondition {
  idd = 15209;
	name= "bodycondition";
	movingEnable = 0;
	enableSimulation = 1;

  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
      text = "";
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.247 * safezoneH + safezoneY;
    	w = 0.37125 * safezoneW;
    	h = 0.506 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Your Health"; //--- ToDo: Localize;
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.247 * safezoneH + safezoneY;
    	w = 0.37125 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,0.8};
    };
    class medicalbackground: Life_RscPicture
    {
    	idc = 1200;
    	text = "\sndimg\sahrani\icons\medicalbody.paa";
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.28 * safezoneH + safezoneY;
    	w = 0.268125 * safezoneW;
    	h = 0.44 * safezoneH;
    };
  };
  class controls {
    class RscText_1002: Life_RscText
    {
    	idc = 1002;
    	text = "Blood Level"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.28 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscText_1003: Life_RscText
    {
    	idc = 1003;
    	text = "Blood Loss"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.335 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscText_1004: Life_RscText
    {
    	idc = 1004;
    	text = "Blood Regen"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.39 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscText_1005: Life_RscText
    {
    	idc = 1005;
    	text = "Bone Condition"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.445 * safezoneH + safezoneY;
    	w = 0.144375 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscText_1006: Life_RscText
    {
    	idc = 1006;
    	text = "Pain Levels"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.5 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscText_1007: Life_RscText
    {
    	idc = 1007;
    	text = "Hunger"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.555 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscText_1008: Life_RscText
    {
    	idc = 1008;
    	text = "Thirst"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.61 * safezoneH + safezoneY;
    	w = 0.154687 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class medicallegs: Life_RscPicture
    {
    	idc = 1201;
    	text = "\sndimg\sahrani\icons\medicallegs.paa";
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.28 * safezoneH + safezoneY;
    	w = 0.268125 * safezoneW;
    	h = 0.44 * safezoneH;
    };
    class medicaltorso: Life_RscPicture
    {
    	idc = 1202;
    	text = "\sndimg\sahrani\icons\medicaltorso.paa";
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.28 * safezoneH + safezoneY;
    	w = 0.268125 * safezoneW;
    	h = 0.44 * safezoneH;
    };
    class medicalthread: Life_RscPicture
    {
    	idc = 1203;
    	text = "\sndimg\sahrani\icons\medicalhead.paa";
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.28 * safezoneH + safezoneY;
    	w = 0.268125 * safezoneW;
    	h = 0.44 * safezoneH;
    };
    class medicalarms: Life_RscPicture
    {
    	idc = 1204;
    	text = "\sndimg\sahrani\icons\medicalarms.paa";
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.28 * safezoneH + safezoneY;
    	w = 0.268125 * safezoneW;
    	h = 0.44 * safezoneH;
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Use Bandage"; //--- ToDo: Localize;
    	x = 0.572187 * safezoneW + safezoneX;
    	y = 0.291 * safezoneH + safezoneY;
    	w = 0.103125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2401: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Use Tourniquet"; //--- ToDo: Localize;
    	x = 0.572187 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.103125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2402: Life_RscButtonMenu
    {
    	idc = 2402;
    	text = "Transfuse Blood"; //--- ToDo: Localize;
    	x = 0.572187 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.103125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2403: Life_RscButtonMenu
    {
    	idc = 2403;
    	text = "Inject Morphine"; //--- ToDo: Localize;
    	x = 0.572187 * safezoneW + safezoneX;
    	y = 0.39 * safezoneH + safezoneY;
    	w = 0.103125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2404: Life_RscButtonMenu
    {
    	idc = 2404;
    	text = "Inject Adrenaline"; //--- ToDo: Localize;
    	x = 0.572187 * safezoneW + safezoneX;
    	y = 0.423 * safezoneH + safezoneY;
    	w = 0.103125 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class bloodlevel: Life_RscText
    {
    	idc = 1009;
    	text = "N/A"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class bloodloss: Life_RscText
    {
    	idc = 1010;
    	text = "N/A"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class bloodregen: Life_RscText
    {
    	idc = 1011;
    	text = "N/A"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.412 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class bonecondition: Life_RscText
    {
    	idc = 1012;
    	text = "N/A"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.467 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class painlevels: Life_RscText
    {
    	idc = 1013;
    	text = "N/A"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.522 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class hungerlevel: Life_RscText
    {
    	idc = 1014;
    	text = "N/A"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.577 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class thirstlevel: Life_RscText
    {
    	idc = 1015;
    	text = "N/A"; //--- ToDo: Localize;
    	x = 0.319531 * safezoneW + safezoneX;
    	y = 0.632 * safezoneH + safezoneY;
    	w = 0.149531 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscButtonMenu_2405: Life_RscButtonMenu
    {
    	idc = 2405;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.753 * safezoneH + safezoneY;
    	w = 0.37125 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
    };
  };
};
