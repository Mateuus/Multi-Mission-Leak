class HouseMenu
{
	idd = 12500;
	name = "HouseMenu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscTitleBackground : Life_RscText
		{
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class RscBackground : Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.39172 * safezoneW + safezoneX;
			y = 0.40386 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.066 * safezoneH;
		};
		
		class RscTitleText : Life_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 12501;
			text = "House";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
		};
				
		class RscHouseStatus : Life_RscText
		{
			idc = 12504;
			colorBackground[] = {0, 0, 0, 0};
			text = "Getting status.  Please wait...";
			sizeEx = 0.04;
			
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class RscHouseValue : Life_RscText
		{
			idc = 12508;
			colorBackground[] = {0, 0, 0, 0};
			text = "Loading...";
			sizeEx = 0.04;
			
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
		};	
	};
	
	class Controls
	{
		class BuyHouse : Life_RscButtonMenu
		{
			idc = 12512;
			text = "Buy";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[_house] call life_fnc_buyHouse;";
			x = 0.487734 * safezoneW + safezoneX;
			y = 0.472556 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class SellHouse : Life_RscButtonMenu
		{
			idc = 12516;
			text = "Sell";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "createDialog ""life_housesale_menu""";
			x = 0.487734 * safezoneW + safezoneX;
			y = 0.472556 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CreateGang : Life_RscButtonMenu
		{
			idc = 12518;
			text = "New Gang";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[_house] call life_fnc_createGang;";
			x = 0.424297 * safezoneW + safezoneX;
			y = 0.472556 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Close : Life_RscButtonMenu
		{
			idc = -1;
			text = "Close";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "closeDialog 0;";
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.472555 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};