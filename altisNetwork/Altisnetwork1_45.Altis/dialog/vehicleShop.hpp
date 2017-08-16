class Life_Vehicle_Shop_v2
{
	idd = 2300;
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	
	class controlsBackground
	{
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;

			text = "Vehicle Shop"; //--- ToDo: Localize;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class VehicleInfoHeader: Life_RscText
		{
			idc = -1;

			text = "Vehicle Information"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class MainBackground: Life_RscText
		{
			idc = -1;

			x = 0.324687 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.451 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};

		class RightSideBG: Life_RscText
		{
			idc = -1;

			x = 0.510313 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class yolobarBG: Life_RscText
		{
			idc = -1;

			x = 0.515469 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.143 * safezoneH;
			colorBackground[] = {0.3,0.3,0.3,0.4};
		};
	};
	
	class controls
	{
	
		
		class CloseBtn: Life_RscButtonMenuIcon
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;
			tooltip = "-1"; //--- ToDo: Localize;
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
			x = 0.675312 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0133854 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};

		
		class RentCar: Life_RscButtonMenu
		{
			onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";

			idc = -1;
			text = "Rent"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class BuyCar: Life_RscButtonMenu
		{
			onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";

			idc = -1;
			text = "Buy"; //--- ToDo: Localize;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

		class VehicleList: Life_RscListBox
		{
			idc = 2302;
			onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
			rowHeight = 0.1;
			sizeEx = 0.03;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {0.3,0.3,0.3,0.4};
		};

		class ColorList: Life_RscCombo
		{
			idc = 2304;
			x = 0.330359 * safezoneW + safezoneX;
			y = 0.6606 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};


		class vehicleInfomationList: Life_RscStructuredText
		{
			idc = 2303;

			x = 0.515469 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0.3,0.3,0.3,0.4};
		};

		class maxSpeedProgress : Life_RscProgress
		{
			idc = 2310;
			text = ""; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class fuelCapacityProgress : Life_RscProgress
		{
			idc = 2312;
			text = ""; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class trunkCapacityProgress : Life_RscProgress
		{
			idc = 2314;
			text = ""; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};

		class armorRatingProgress : Life_RscProgress
		{
			idc = 2316;
			text = ""; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};

		class maxSpeedText: Life_RscStructuredText
		{
			idc = 2311;

			x = 0.520625 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class fuelCapText: Life_RscStructuredText
		{
			idc = 2313;

			x = 0.520625 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class trunkCapText: Life_RscStructuredText
		{
			idc = 2315;

			x = 0.520625 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class armorRatingText: Life_RscStructuredText
		{
			idc = 2317;

			x = 0.520625 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
	};
};