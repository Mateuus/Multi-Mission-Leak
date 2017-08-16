/*
	Author: DerOnkel
	E-Monkeys.com | Avanix-Gaming.de
*/

class EMonkeys_contact_list 
{
	idd = 69500;
	name= "EMonkeys_contact_list";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground 
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_phoneMenu_2.paa";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.314531 * safezoneW;
			h = 0.572 * safezoneH;
		};
	};
	
	class controls 
	{
		class Player_list: EMonkeys_RscListbox
		{
			idc = 69501;
			x = 0.42677 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.14125 * safezoneW;
			h = 0.287407 * safezoneH;
			sizeEx = 0.03;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
	    };
		
		class Change_Playername : EMonkeys_RscEdit 
		{
			idc = 69502;
			text = "";
			sizeEx = 0.03;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.426406 * safezoneW + safezoneX;
			y = 0.608148 * safezoneH + safezoneY;
			w = 0.141094 * safezoneW;
			h = 0.0237407 * safezoneH;
		};
		
		class Change_PlayernameButton : EMonkeys_RscButtonMenu
		{
			idc = 69503;
			text = "";
			onButtonClick = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.426042 * safezoneW + safezoneX;
			y = 0.639815 * safezoneH + safezoneY;
			w = 0.141198 * safezoneW;
			h = 0.0247777 * safezoneH;
		};
		
		class Delete_PlayernameButton : EMonkeys_RscButtonMenu
		{
			idc = 69504;
			text = "";
			onButtonClick = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.426041 * safezoneW + safezoneX;
			y = 0.673148 * safezoneH + safezoneY;
			w = 0.14125 * safezoneW;
			h = 0.0257037 * safezoneH;
		};
	};
};