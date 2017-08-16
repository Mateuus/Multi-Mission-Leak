class EMonkeys_Clothing {
	idd = 3100;
	name= "EMonkeys_Clothing";
	movingEnable = true;
	enableSimulation = true;
	//onLoad = "[] execVM 'core\client\keychain\init.sqf'";
	
	class controlsBackground
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_kleidungsShop.paa";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.616 * safezoneH;
		};	
	};
	
	class controls 
	{	
		class ClothingList : EMonkeys_RscListBox 
		{
			idc = 3101;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] call EMonkeys_fnc_changeClothes;";
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
		
		class PriceTag : EMonkeys_RscStructuredText
		{
			idc = 3102;
			text = "";
			sizeEx = 0.035;
			x = 0.40578 * safezoneW + safezoneX;
			y = 0.66963 * safezoneH + safezoneY;
			w = 0.0686458 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class TotalPrice : EMonkeys_RscStructuredText
		{
			idc = 3106;
			text = "";
			sizeEx = 0.035;
			x = 0.484895 * safezoneW + safezoneX;
			y = 0.669445 * safezoneH + safezoneY;
			w = 0.0693751 * safezoneW;
			h = 0.0220001 * safezoneH;
		};
		
		class FilterList : EMonkeys_RscCombo
		{
			idc = 3105;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "_this call EMonkeys_fnc_clothingFilter";
			x = 0.405625 * safezoneW + safezoneX;
			y = 0.703444 * safezoneH + safezoneY;
			w = 0.149062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CloseButtonKey : EMonkeys_RscButtonMenu 
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
		
		class BuyButtonKey : EMonkeys_RscButtonMenu 
		{
			idc = -1;
			text = "";
			onButtonClick = "[] call EMonkeys_fnc_buyClothes;";
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
	};
};