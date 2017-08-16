/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Dialog for blackboard
*/
#define ST_MULTI 0x10

class blackboard
{
	idd = 9000;
	name= "blackboard";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_blackboardMenu.paa";
			x = 0.283369 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.438421 * safezoneW;
			h = 0.836 * safezoneH;
		};
	};

	class controls 
	{	
		class textbox: emonkeys_RscControlsGroup
		{
			x = 0.304 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.391474 * safezoneW;
			h = 0.316 * safezoneH;
			class HScrollbar : HScrollbar 
			{
				height = 0;
			};
			class controls 
			{
				class showText : emonkeys_RscStructuredText 
				{
					idc = 9004;
					text = "Lade News....";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.391474 * safezoneW;
					h = 10.316 * safezoneH;
				};
			};					
		};
		class setbutton: emonkeys_RscButtonMenu
		{
			idc = 9005;
			text = "News erstellen";
			onButtonClick = "closeDialog 0; [1,""""] call EMonkeys_fnc_blackboard;";
			x = 0.304 * safezoneW + safezoneX;
			y = 0.366 * safezoneH + safezoneY;
			w = 0.108316 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class closebutton: emonkeys_RscPictureButton
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_close.paa";
			onButtonClick = "closeDialog 0;";
			x = 0.696 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0154737 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};

class blackboard_menu
{
	idd = 9000;
	name= "blackboard_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscPicture
		{
			idc = 9001;
			text = "core\textures\menu_background\bg_blackboardMenu.paa";
			x = 0.283369 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.438421 * safezoneW;
			h = 0.836 * safezoneH;
		};
	};

	class controls 
	{
		class textbox: emonkeys_RscMessageEdit
		{
			idc = 9004;
			text = "News eingeben...";
			lineSpacing = 1; 
			style = ST_MULTI;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.304 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.391474 * safezoneW;
			h = 0.316 * safezoneH;
		};
		class setbutton: emonkeys_RscButtonMenu
		{
			idc = 9005;
			text = "Speichern";
			onButtonClick = "[2,""""] call EMonkeys_fnc_blackboard;";
			x = 0.304 * safezoneW + safezoneX;
			y = 0.366 * safezoneH + safezoneY;
			w = 0.108316 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class closebutton: emonkeys_RscPictureButton
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_close.paa";
			onButtonClick = "closeDialog 0;";
			x = 0.696 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0154737 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};