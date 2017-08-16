class life_skillMenu {
	idd = 170000;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_skillMenu;";

	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.396 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TitleHeader: Life_RscText
		{
			idc = -1;
			text = "Skill & Talents";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
	};
	class controls {
		class RscText_1002: Life_RscText
		{
			idc = 170001;
			text = "";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscText_1003: Life_RscText
		{
			idc = 170007;
			text = "";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 170002;
			onLBSelChanged = "[_this] call life_fnc_skillInfo";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.308 * safezoneH;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 170003;
			text = "Choose a Talent from the left List, for further information on the selected Talent. You need a minimum of 1 available Skillpoint. You receive at least one Skillpoint on each level up!";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.308 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 170006;
			onButtonClick = "if(life_skillLegal) then {life_skillLegal = false;};[] spawn life_fnc_skillMenu;";
			text = "Illegal Skills";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2403: Life_RscButtonMenu
		{
			idc = 170005;
			onButtonClick = "if(!life_skillLegal) then {life_skillLegal = true;};[] spawn life_fnc_skillMenu;";
			text = "Legal Skills";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 170004;
			onButtonClick = "[] spawn life_fnc_skillLearn";
			text = "Learn Skill";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = -1;
			text = "Close";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1004: LIfe_RscText
		{
			idc = 170010;
			text = "";
			x = 0.530936 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
	};
};
