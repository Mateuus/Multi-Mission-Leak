class Life_impound_menu
{
	idd = 2800;
	name="life_vehicle_shop";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";

	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\UI\back_garage.paa";
			idc = -1;
			x = 0.0978125 * safezoneW + safezoneX;
			y = -0.05 * safezoneH + safezoneY;
			w = 0.825 * safezoneW;
			h = 1.1 * safezoneH;
		};
	};

	class controls
	{

		class CloseBtn : Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "$STR_Global_Close";

			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class RentCar : Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_unimpound;";
			x = 0.295812 * safezoneW + safezoneX;
			y = 0.72275 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.03245 * safezoneH;
			tooltip = "$STR_Global_Retrieve";

			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};

		class BuyCar : life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_sellGarage; closeDialog 0;";
			x = 0.445138 * safezoneW + safezoneX;
			y = 0.72275 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.03245 * safezoneH;
			tooltip = "$STR_Global_Sell";

			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class VehicleList : Life_RscListBox
		{
			idc = 2802;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0};
			onLBSelChanged = "_this call life_fnc_garageLBChange;";

			x = 0.298906 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.33 * safezoneH;
		};

		class vehicleInfomationList : Life_RscStructuredText
		{
			idc = 2803;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0};

			x = 0.479375 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.33 * safezoneH;
		};

		class MainHideText : Life_RscText
		{
			idc = 2811;
			text = "$STR_ANOTF_QueryGarage";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};