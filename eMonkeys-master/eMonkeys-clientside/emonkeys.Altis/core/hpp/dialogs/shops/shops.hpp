class EMonkeys_weapon_shop
{
	idd = 38400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_waffenShop.paa";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.616 * safezoneH;
		};	

		class kaufenbild: EMonkeys_RscPicture
		{
			idc = 38407;
			text = "core\textures\menu_icons\icon_kaufen.paa";
			x = 0.273385 * safezoneW + safezoneX;
			y = 0.508186 * safezoneH + safezoneY;
			w = 0.336094 * safezoneW;
			h = 0.630814 * safezoneH;
		};	

		class verkaufenbild: EMonkeys_RscPicture
		{
			idc = 38408;
			text = "core\textures\menu_icons\icon_verkaufen.paa";
			x = 0.35177 * safezoneW + safezoneX;
			y = 0.501888 * safezoneH + safezoneY;
			w = 0.337241 * safezoneW;
			h = 0.638074 * safezoneH;
		};			
		
		class FilterList : EMonkeys_RscCombo
		{
			idc = 38402;
			onLBSelChanged = "_this call EMonkeys_fnc_weaponShopFilter";
			x = 0.405625 * safezoneW + safezoneX;
			y = 0.703444 * safezoneH + safezoneY;
			w = 0.149062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class itemInfo : EMonkeys_RscStructuredText
		{
			idc = 38404;
			text = "";
			sizeEx = 0.035;
			x = 0.40578 * safezoneW + safezoneX;
			y = 0.66963 * safezoneH + safezoneY;
			w = 0.0686458 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls
	{
		class itemList : EMonkeys_RscListBox
		{
			idc = 38403;
			onLBSelChanged = "_this call EMonkeys_fnc_weaponShopSelection";
			sizeEx = 0.035;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.40625 * safezoneW + safezoneX;
			y = 0.294444 * safezoneH + safezoneY;
			w = 0.185521 * safezoneW;
			h = 0.35037 * safezoneH;
		};
		
		class ButtonBuy : EMonkeys_RscButtonMenu
		{
			idc = 38405;
			text = "";
			onButtonClick = "[] call EMonkeys_fnc_weaponShopBuySell";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.40625 * safezoneW + safezoneX;
			y = 0.738889 * safezoneH + safezoneY;
			w = 0.0714583 * safezoneW;
			h = 0.0207407 * safezoneH;
		};
		
		class ButtonSell : EMonkeys_RscButtonMenu
		{
			idc = 38406;
			text = "";
			onButtonClick = "[] call EMonkeys_fnc_weaponShopBuySell";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.482292 * safezoneW + safezoneX;
			y = 0.738889 * safezoneH + safezoneY;
			w = 0.0719792 * safezoneW;
			h = 0.0207408 * safezoneH;
		};
		
		class ButtonClose : EMonkeys_RscButtonMenu 
		{
			idc = -1;
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
			x = 0.588542 * safezoneW + safezoneX;
			y = 0.225926 * safezoneH + safezoneY;
			w = 0.0110417 * safezoneW;
			h = 0.0216667 * safezoneH;
		};
	};
};
