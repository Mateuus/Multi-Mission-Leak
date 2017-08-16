
class EMonkeys_impoundmenu_item
{
	name = "EMonkeys_impoundmenu_item";
	idd = 38300;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	objects[]={};

	class controlsBackground 
	{	
		class background : EMonkeys_RscPicture
		{
			idc = 3301;
			text = "core\textures\menu_background\bg_impoundItemMenu.paa";
			x = 0.266407 * safezoneW + safezoneX;
			y = 0.131556 * safezoneH + safezoneY;
			w = 0.478542 * safezoneW;
			h = 0.770926 * safezoneH;
		};
			
		class liste : EMonkeys_RscListBox 
		{
			idc = 3303;
			sizeEx = 0.032;
			font = PuristaSemiBold;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.349479 * safezoneW + safezoneX;
			y = 0.35237 * safezoneH + safezoneY;
			w = 0.305782 * safezoneW;
			h = 0.320852 * safezoneH;
		};
		
		class beschlagnahmen : EMonkeys_RscButtonMenu
		{
			idc = 3305;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.09};
			colorBackground2[] = {0.75,0.75,0.75,0.12};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.542187 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = 0.111563 * safezoneW;
			h = 0.0275555 * safezoneH;
		};
		
		class close : EMonkeys_RscButtonMenu
		{
			idc = 3306;
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.661875 * safezoneW + safezoneX;
			y = 0.269926 * safezoneH + safezoneY;
			w = 0.0139063 * safezoneW;
			h = 0.0238519 * safezoneH;
		};
		
		class anzahl : EMonkeys_RscEdit
		{
			idc = 3307;
			text = "1";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.416979 * safezoneW + safezoneX;
			y = 0.700667 * safezoneH + safezoneY;
			w = 0.0402082 * safezoneW;
			h = 0.0272223 * safezoneH;
		};
	};
};