class life_candidate_menu {
	idd = 6800;
	name= "life_candidate_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 0;
			y = 0;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0;
			y = (11 / 250);
			w = 0.6;
			h = 0.77;
		};
	};
	
	class controls {
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Your Candidacy";
			x = 0;
			y = 0;
			w = 0.6;
			h = (1 / 25);
		};
		
		class RscEdit_1400: Life_RscEdit
		{
			idc = 6802;
			text = "0"; //--- ToDo: Localize;
			sizeEx = 0.030;
			x = 0.025;
			y = 0.311899 * safezoneH + safezoneY;
			w = 0.55;
			h = 0.0282151 * safezoneH;
		};
		class RscText_1000: Life_RscText
		{
			idc = -1;
			text = "Investment amount"; //--- ToDo: Localize;
			x = 0.025;
			y = 0.293089 * safezoneH + safezoneY;
			w = 0.55;
			h = 0.0188101 * safezoneH;
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Your policy description"; //--- ToDo: Localize;
			x = 0.025;
			y = 0.358924 * safezoneH + safezoneY;
			w = 0.55;
			h = 0.0188101 * safezoneH;
		};
		class RscEdit_1800: Life_RscEdit
		{
			idc = 6804;
			text = "";
			type = 2; // CT_EDIT
			style = 16; // ST_MULTI
			sizeEx = 0.030;
			x = 0.025;
			y = 0.377734 * safezoneH + safezoneY;
			w = 0.55;
			h = 0.169291 * safezoneH;
		};
		class RscStructuredText_1100: Life_RscTextMulti
		{
			idc = -1;
			text = "Note that you can only submit this once per term, so double check everything before clicking OK."; //--- ToDo: Localize;
			x = 0.025;
			y = 0.565835 * safezoneH + safezoneY;
			w = 0.55;
			h = 0.0658353 * safezoneH;
		};
		class OK_Button: Life_RscButtonMenu
		{
			idc = -1;
			text = "OK"; //--- ToDo: Localize;
			x =  0.6 - ((6.25 / 40) * 2) - 0.015;
			y = 0.8 + 0.025;
			w = (6.25 / 40);
			h = (1 / 25);
			onButtonClick = "[] call life_fnc_newCandidate;";
		};
		class Cancel_Button: Life_RscButtonMenu
		{
			idc = -1;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.6 - (6.25 / 40);
			y = 0.8 + 0.025;
			w = 6.25 / 40;
			h = (1 / 25);
			onButtonClick = "closeDialog 0;";
		};

	};
};