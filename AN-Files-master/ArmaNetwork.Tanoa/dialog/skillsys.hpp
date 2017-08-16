class life_skillMenu {
	idd = 170000;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_hewas;";

	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.293749 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Skills and Talents"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Close"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Level:"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Available Skillpoints:"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscText_1004: Life_RscText
		{
			idc = 1004;
			text = "Exp Points Till Next Level:"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscText_1005: Life_RscText
		{
			idc = 1005;
			text = "Skills and Talents"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1006: Life_RscText
		{
			idc = 1006;
			text = "Skill Information"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.293747 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.352 * safezoneH;
			onLBSelChanged = "_this call life_fnc_frepefratraxu";
			sizeEx = 0.035;
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Illegal Skills"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "if(life_skillLegal) then {life_skillLegal = false;};[] spawn life_fnc_hewas;";
		};
		class RscButtonMenu_2403: Life_RscButtonMenu
		{
			idc = 2403;
			text = "Legal Skills"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "if(!life_skillLegal) then {life_skillLegal = true;};[] spawn life_fnc_hewas;";
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = "Choose a Talent from the left List, for further information on the selected Talent. You need a minimum of 1 available Skillpoint. You receive at least one Skillpoint on each level up!";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.352 * safezoneH;
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2402;
			text = "Learn/Forget Skill"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_yunabacerayas";
		};
	};
};
