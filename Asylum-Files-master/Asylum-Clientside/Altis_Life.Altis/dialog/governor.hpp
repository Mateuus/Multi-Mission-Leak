/*
	ArmA 3 TAW View Distance Management
	Resource Definesby Sa-Matra
*/
class life_governor_menu 
{
	idd = 1900;
	name= "life_governor_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class TAWVD_RscTitleBackground : life_RscText {
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground : life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.5 - (22 / 250);
		};
		
		class VDonFoot : life_RscText
		{
			idc = -1;
			text = "Sales:";
			
			x = 0.32; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class GasTaxLabel : life_RscText
		{
			idc = -1;
			text = "Fuel:";
			
			x = 0.32; y = 0.305;
			w = 0.275; h = 0.04;
		};
		
		class VDinCar : life_RscText
		{
			idc = -1;
			text = "Land:";
			
			x = 0.32; y = 0.355;
			w = 0.275; h = 0.04;
		};
		
		class VDinAir : life_RscText
		{
			idc = -1;
			text = "Gang:";
			
			x = 0.32; y = 0.405;
			w = 0.275; h = 0.04;
		};

	};
	
	class controls 
	{
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Taxes";
			x = 0.3;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class VD_onfoot_slider : life_RscXSliderH 
		{
			idc = 1901;
			text = "";
			onSliderPosChanged = "[3,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Sales tax as a percentage";
			x = 0.42;
			y = 0.30 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_onfoot_value : life_RscText
		{
			idc = 1902;
			text = "";
			
			x = 0.70; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class gas_slider : life_RscXSliderH 
		{
			idc = 1904;
			text = "";
			onSliderPosChanged = "[6,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Gas tax as a percentage";
			x = 0.42;
			y = 0.35 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class gas_value : life_RscText
		{
			idc = 1905;
			text = "";
			
			x = 0.70; y = 0.31;
			w = 0.275; h = 0.04;
		};
		
		
		class VD_car_slider : life_RscXSliderH 
		{
			idc = 1911;
			text = "";
			onSliderPosChanged = "[4,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Daily tax for home ownership";
			x = 0.42;
			y = 0.40 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_car_value : life_RscText
		{
			idc = 1912;
			text = "";
			
			x = 0.70; y = 0.36;
			w = 0.275; h = 0.04;
		};
		
		class VD_air_slider : life_RscXSliderH 
		{
			idc = 1921;
			text = "";
			onSliderPosChanged = "[5,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Daily tax for gang upkeep, multiplied by member count";
			x = 0.42;
			y = 0.45 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_air_value : life_RscText
		{
			idc = 1922;
			text = "";
			
			x = 0.70; y = 0.41;
			w = 0.275; h = 0.04;
		};
		
		class SideChannelSettings : life_RscText
		{
			idc = -1;
			text = "Law Toggles";
			shadow = 0;
			colorBackground[] = {0.4, 0, 0, 0.7};

			x = 0.30;
			y = 0.5;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MarijuanaONOFF : Life_RscActiveText
		{
			idc = 1926;
			text = "Marijuana...";
			color[] = {1, 0, 0, 1};
			action = "[2] call life_fnc_toggleLaw";
			sizeEx = 0.04;
			
			x = 0.45; y = 0.55;
			w = 0.275; h = 0.04;
		};
		
		class DeathONOFF : Life_RscActiveText
		{
			idc = 1928;
			text = "Death Penalty...";
			color[] = {1, 0, 0, 1};
			action = "[9] call life_fnc_toggleLaw";
			sizeEx = 0.04;
			
			x = 0.45; y = 0.6;
			w = 0.275; h = 0.04;
		};

		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "Close";
			onButtonClick = "closeDialog 0;[] spawn life_fnc_configChanged;publicVariable ""life_configuration"";";
			x = 0.48;
			y = 0.7 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};