/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/

class paintball_scoreboard
 {
	idd = 2900;
	name= "paintball_scoreboard";
	movingEnable = false;
	enableSimulation = true;	
	
	class controlsBackground
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_paintballBoard.paa";
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.847 * safezoneH;
		};
	};
	
	class controls 
	{	
		class RscText_1002: EMonkeys_RscText
		{
			idc = 1002;
			text = "Spielername";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1004: EMonkeys_RscText
		{
			idc = 1004;
			text = "Abschüsse";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1005: EMonkeys_RscText
		{
			idc = 1005;
			text = "Tode";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscStructuredText_1100: EMonkeys_RscStructuredText
		{
			idc = 1100;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.462 * safezoneH;
		};
		class RscStructuredText_1101: EMonkeys_RscStructuredText
		{
			idc = 1101;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.462 * safezoneH;
		};
		class RscStructuredText_1102: EMonkeys_RscStructuredText
		{
			idc = 1102;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.462 * safezoneH;
		};
		class RscButton_1600: EMonkeys_RscButtonMenu
		{
			idc = 1600;
			text = "";
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
	};
};
	