////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////
class jail_time
{
	idd = 26500;
	name = "jail_time";
	movingEnabled = 0;
	enableSimulation = 1;

	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			colorActive[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Arrest Menu"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscText_1002: Life_RscText
		{
			idc = -1;
			text = "Do Not Abuse! All Arrests are logged!"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls {
		class RscText_1003: Life_RscText
		{
			idc = -1;
			text = "Arrest Reason:"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1004: Life_RscText
		{
			idc = -1;
			text = "Time in Minutes:"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Arrest_Time: Life_RscEdit
		{
			idc = 1400;
			text = "15";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Arrest_reason: Life_RscEdit
		{
			idc = 1500;
			text = "";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "    Confirm";
			onButtonClick="[] spawn life_fnc_geswusacrefr;";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "  Death Penalty";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2402;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
