/*
    ArmA.Network
    Copyright (c) ArmA.Network 2014 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/

class life_spawn_selection 
{
	idd = 38500;
	movingEnabled = 0;
	enableSimulation = 1;

	class controlsBackground 
	{
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.0720312 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.253 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	class controls 
	{	
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "Select a Spawnpoint"; //--- ToDo: Localize;
			x = 0.0720312 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.7};
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			x = 0.0771875 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.143 * safezoneH;
			onLBSelChanged = "_this call life_fnc_wrugaswubaswu;";
			sizeEx = "0.8 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Spawn"; //--- ToDo: Localize;
			x = 0.0771875 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onButtonClick = "call life_fnc_crucenarethuz;";
			class Attributes
			{
				align = "center";
			};
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Selected:"; //--- ToDo: Localize;
			x = 0.0771875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};		