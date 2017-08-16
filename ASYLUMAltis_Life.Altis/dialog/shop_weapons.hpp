class life_weapon_shop
{
	idd = 39400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscTitleBackground : Life_RscText
		{
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.2887 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Mainbackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.308 * safezoneH;
		};
		
		class Title : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 39401;
			text = "";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.2887 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class WeaponHeader : Life_RscTitle
		{
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			text = "Weapons";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class AmmoHeader : Life_RscTitle
		{
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			text = "Ammo / Optics";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls
	{
		class itemList : Life_RscListBox
		{
			idc = 39403;
			onLBSelChanged = "_this call life_fnc_weaponShopSelection";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.201 * safezoneH;
		};
		
		class magList : Life_RscListBox
		{
			idc = 39404;
			onLBSelChanged = "_this call life_fnc_weaponShopSelection";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.201 * safezoneH;
		};
		
		class ButtonBuyWeapon : Life_RscButtonMenu
		{
			idc = 39405;
			text = "Buy Weapon";
			onButtonClick = "[true] spawn life_fnc_weaponShopBuySell";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.565 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonBuyAddon : Life_RscButtonMenu
		{
			idc = 39406;
			text = "Buy Addon";
			onButtonClick = "[false] spawn life_fnc_weaponShopBuySell";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.565 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonClose : life_RscButtonMenu 
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class RscText_1003: Life_RscStructuredText
		{
			idc = 39410;
			text = "";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.011 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		
		class RscText_1004: Life_RscStructuredText
		{
			idc = 39411;
			text = "";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.011 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
			class Attributes {
				align = "right";
			};
		};
	};
};
