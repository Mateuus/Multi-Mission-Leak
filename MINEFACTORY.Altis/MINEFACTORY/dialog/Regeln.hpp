/*###############################
#	(c) 2016 PierreAmyf     	#
#								#
#	Author: PierreAmyf		    #
#	Lizenz: Lizenz.txt Lesen!	#
###############################*/

class Regeln
{
	idd = 621000;
	name = "regeln";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[0] spawn life_fnc_regeln;";

	class controlsBackground
	{
		class background: RscText
		{
			idc = 1000;
			x = 0.253646 * safezoneW + safezoneX;
			y = 0.236103 * safezoneH + safezoneY;
			w = 0.504167 * safezoneW;
			h = 0.593768 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	class controls
	{
		class InfoText: life_RscStructuredText
		{
			idc = 621002;
			text = "";
			x = 0.385417 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.338021 * safezoneW;
			h = 0.494807 * safezoneH;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			colorBackground[] = {0,0,0,0.4};
		};
		
		class InfoList: life_RscListBox
		{
			idc = 621003;
			onLBSelChanged = "[1] call life_fnc_regeln;";

			x = 0.276563 * safezoneW + safezoneX;
			y = 0.291081 * safezoneH + safezoneY;
			w = 0.0973958 * safezoneW;
			h = 0.494807 * safezoneH;
			sizeEx =  0.035;
			//colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0.4};
		};
		class RscButtonMenu_2400: RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = 2400;
			text = "Schliessen"; //--- ToDo: ;
			x = 0.253646 * safezoneW + safezoneX;
			y = 0.796884 * safezoneH + safezoneY;
			w = 0.0802083 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
	};
};