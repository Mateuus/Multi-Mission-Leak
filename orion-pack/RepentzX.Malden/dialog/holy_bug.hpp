/*
 *
 *	@File:		holy_bug.hpp
 *	@Autor: 	AustrianNoob
 *	@Date:		02.11.2016
 *
 *	You are not allowed to use this script or remove the credits of the script without the permission of the author.
 *	WERTE:
 *	-0.712121 //SafezoneX
 *	2.42424 //SafezoneW
 * 	-0.409091 //SafezoneY
 * 	1.81818 //SafezoneH
 *
 * P.Feld IDC: 1350
 * N.Feld IDC: 1351
 * TITEL IDC: 1352
 * BESCHREIBUNG IDC: 1353
 *
 * hint format ["safezoneX: %1 \n safezoneW: %2 \n safezoneY: %3 \n safezoneH:  %4",safezoneX,safezoneW,safezoneY,safezoneH]; 
 */
class holy_bug
{
    idd = 1349;
	name = "holy_bug";
    movingEnable = false;
    enableSimulation = true; //Default: true
	onLoad = "[0] spawn life_fnc_holy_bug"; //[0] execVM 'holy_bug.sqf';
	class controlsBackground
	{
		class TITEL: Life_RscStructuredText
		{
			idc = -1;
			text = ""; 
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.272 * safezoneH + safezoneY;
			w = 0.225 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class TEXTBOX: Life_RscText
		{
			idc = -1;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.3 * safezoneH + safezoneY;
			w = 0.225 * safezoneW;
			h = 0.46 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			colorActive[] = {0,0,0,0.7};
		};
		class hinweis1: Life_RscStructuredText
		{
			idc = 1354;
			text = "Do not abuse this"; 
			x = 0.39 * safezoneW + safezoneX;
			y = 0.688 * safezoneH + safezoneY;
			w = 0.22 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
		};
	};
	class controls //Buttonsshit
	{
		class TITEL: Life_RscStructuredText
		{
			idc = -1;
			text = "ALRPG Bugtracker"; 
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.272 * safezoneH + safezoneY;
			w = 0.225 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Player name:"; 
			x = 0.39 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_1002: Life_RscText
		{
			idc = -1;
			text = "PlayerUID:"; 
			x = 0.39 * safezoneW + safezoneX;
			y = 0.344 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class PLAYERID: Life_RscStructuredText
		{
			idc = 1350;
			text = "000000000000000000000000"; 
			x = 0.4725 * safezoneW + safezoneX;
			y = 0.344 * safezoneH + safezoneY;
			w = 0.19179 * safezoneW;
			h = 0.0198 * safezoneH;
			colorText[] = {1,1,1,1};
			tooltip = "Steam64ID"; 
		};
		class NAME: Life_RscStructuredText
		{
			idc = 1351;
			text = "Holy_f0rest.Stewart"; 
			x = 0.4725 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.19179 * safezoneW;
			h = 0.0198 * safezoneH;
			colorText[] = {1,1,1,1};
			tooltip = "PlayerName"; 
		};
		class KURZT: Life_RscText
		{
			idc = -1;
			text = "Title*:"; 
			x = 0.39 * safezoneW + safezoneX;
			y = 0.396 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class BESCHREIBUNGT: Life_RscText
		{
			idc = -1;
			text = "description of bug*:";
			x = 0.39 * safezoneW + safezoneX;
			y = 0.46 * safezoneH + safezoneY;
			w = 0.1598124 * safezoneW;
			h = 0.0176 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class KURZF: Life_RscEdit
		{
			idc = 1352;
			text = "Please enter title"; 
			x = 0.395 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.210254 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			colorActive[] = {0,0,0,0.7};
			tooltip = "Title of the message"; 
		};
		class BESCHREIBUNG: Life_RscEdit
		{
			idc = 1353;
			text = "Please enter a description"; 
			x = 0.395 * safezoneW + safezoneX;
			y = 0.484 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.1 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			colorActive[] = {0,0,0,0.7};
			tooltip = "Description of the bug"; 
		};
		class CLOSEIT: Life_RscButton
		{
			idc = -1;
			text = "Cancel"; 
			x = 0.42 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.160267 * safezoneW;
			h = 0.0264 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
			tooltip = "Exit this Dialog";
			action = "closeDialog 0";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class SENDEN: Life_RscButton
		{
			idc = -1;
			text = "Submit bug message"; 
			x = 0.42 * safezoneW + safezoneX;
			y = 0.604 * safezoneH + safezoneY;
			w = 0.160267 * safezoneW;
			h = 0.0264 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
			tooltip = "Sends the message"; 
			action = "[1] spawn life_fnc_holy_bug";// [1] execVM 'holy_bug.sqf';
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
	};
};