//Waffenshop/Zubehörladen
class life_weapon_shop
{
	idd = 38400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class titleInfo: Life_RscText
		{
			idc = -1;
			text = "Informationen";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};

		class Title : Life_RscTitle
		{
			idc = 38401;
			text = "";
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class itemInfo : Life_RscStructuredText
		{
			idc = 38404;
			text = "";
			sizeEx = 0.0255;
			colorBackground[] = {0,0,0,0.5};	
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.396 * safezoneH;
		};
	};
	
	class controls
	{
		class itemList : Life_RscListBox
		{
			idc = 38403;
			onLBSelChanged = "_this call life_fnc_weaponShopSelection";
			sizeEx = 0.033;
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.638 * safezoneH;
			colorBackground[] = {0,0,0,0.5};			
		};

		class FilterList : Life_RscCombo
		{
			idc = 38406;
			onLBSelChanged = "_this call life_fnc_weaponShopFilter";
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonBuySell : Life_RscButtonMenu
		{
			idc = 38405;
			text = "$STR_Global_Buy";
			onButtonClick = "[] spawn life_fnc_weaponShopBuySell; true";
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonClose : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.902187 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0464065 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

//Fahrzeugshop
class Life_Vehicle_Shop_v2
{
	idd = 2300;
	name="life_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{			
		class titleBestand: Life_RscText
		{
			idc = 2301;
			text = "Bestand";
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};
			
		class titleInfo: Life_RscText
		{
			idc = -1;
			text = "Informationen";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class RentCar : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_RentVeh";
			onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
			x = 0.139062 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class BuyCar : life_RscButtonMenu 
		{
			idc = 2309;
			text = "$STR_Global_Buy";
			onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CloseBtn : Life_RscButtonMenu
		{
			idc = -1;
			text = "Zurück";
			onButtonClick = "closeDialog 0;";
			x = 0.902187 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0464065 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls
	{
		class VehicleList : Life_RscListBox
		{
			idc = 2302;
			text = "";
			sizeEx = 0.033;
			colorBackground[] = {0,0,0,0.5};
			onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.638 * safezoneH;
		};
		
		class ColorList : Life_RscCombo
		{
			idc = 2304;
			onLBSelChanged = "[] call life_fnc_vehicleShopColorChange";
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {1,1,1,1};
		};
		
		class vehicleInfomationList : Life_RscStructuredText
		{
			idc = 2303;
			text = "";
			sizeEx = 0.0255;
			colorBackground[] = {0,0,0,0.5};	
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.396 * safezoneH;
		};
	};
};

//Kleidungsshop
class Life_Clothing {
	idd = 3100;
	name= "Life_Clothing";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		
		class titleBestand: Life_RscText
		{
			idc = -1;
			text = "Informationen";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};
	};
	
	class controls 
	{
		class Title : Life_RscTitle 
		{
			idc = 3103;
			text = "";
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};

		class ClothingList : Life_RscListBox
		{
			idc = 3101;
			text = "";
			sizeEx = 0.033;
			colorBackground[] = {0,0,0,0.5};
			onLBSelChanged = "[_this] spawn life_fnc_changeClothes;";
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.638 * safezoneH;
		};

		class PriceTag : Life_RscStructuredText
		{
			idc = 3102;
			text = "";
			sizeEx = 0.0255;
			colorBackground[] = {0,0,0,0.5};	
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.396 * safezoneH;
		};

		class FilterList : Life_RscCombo
		{
			idc = 3105;
			onLBSelChanged  = "_this call life_fnc_clothingFilter";
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {1,1,1,1};
		};
		
		class CloseButtonKey : Life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.902187 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0464065 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class BuyButtonKey : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Buy";
			onButtonClick = "[] call life_fnc_buyClothes;";
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};