/*
	Author: DerOnkel
	E-Monkeys.com | Avanix-Gaming.de
	
	Descripttion: GUI Menu for Medicl System
*/

class EMonkeys_medsys
{
	idd = 112112;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_medicSystem.paa";
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.814 * safezoneH;
		};
	};
	
	class controls
	{
		
		class BandageButton: EMonkeys_RscButtonMenu
		{
			idc = 11203;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.442187 * safezoneW + safezoneX;
			y = 0.453704 * safezoneH + safezoneY;
			w = 0.0896875 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class ChestCompressionsButton: EMonkeys_RscButtonMenu
		{
			idc = 11204;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.442187 * safezoneW + safezoneX;
			y = 0.486111 * safezoneH + safezoneY;
			w = 0.0896875 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		class ReviveButton: EMonkeys_RscButtonMenu
		{
			idc = 11205;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.442187 * safezoneW + safezoneX;
			y = 0.517593 * safezoneH + safezoneY;
			w = 0.0902083 * safezoneW;
			h = 0.0188889 * safezoneH;
		};
		class AbortButton: EMonkeys_RscButtonMenu
		{
			idc = 11206;
			text = "";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.337963 * safezoneH + safezoneY;
			w = 0.0110417 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
	};
};
