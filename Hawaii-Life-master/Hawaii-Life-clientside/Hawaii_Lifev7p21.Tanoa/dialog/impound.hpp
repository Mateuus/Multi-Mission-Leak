class Life_impound_menu
{
	idd = 2800;
	name="life_vehicle_shop";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\inventory\back_garage.paa";
			idc = -1;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.531094 * safezoneW;
			h = 0.704 * safezoneH;
		};
	};
	
	class controls
	{
		
		class CloseBtn : Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.748021 * safezoneW + safezoneX;
			y = 0.30663 * safezoneH + safezoneY;
			w = 0.0152084 * safezoneW;
			h = 0.0216666 * safezoneH;
			tooltip = "$STR_Global_Close";
			size = "0.022 * safeZoneH";
			
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
			x = 0.698594 * safezoneW + safezoneX;
			y = 0.663407 * safezoneH + safezoneY;
			w = 0.0646876 * safezoneW;
			h = 0.0198148 * safezoneH;
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
			x = 0.628125 * safezoneW + safezoneX;
			y = 0.662963 * safezoneH + safezoneY;
			w = 0.0646876 * safezoneW;
			h = 0.0198148 * safezoneH;
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
			
			x = 0.242708 * safezoneW + safezoneX;
			y = 0.339815 * safezoneH + safezoneY;
			w = 0.25375 * safezoneW;
			h = 0.316111 * safezoneH;
		};
		
		class vehicleInfomationList : Life_RscStructuredText
		{
			idc = 2803;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0};
			
			x = 0.508854 * safezoneW + safezoneX;
			y = 0.340741 * safezoneH + safezoneY;
			w = 0.25375 * safezoneW;
			h = 0.314259 * safezoneH;
		};
		
		class MainHideText : Life_RscText
		{
			idc = 2811;
			text = "$STR_ANOTF_QueryGarage";
			x = 0.242708 * safezoneW + safezoneX;
			y = 0.481481 * safezoneH + safezoneY;
			w = 0.253229 * safezoneW;
			h = 0.0392593 * safezoneH;
		};
	};
};
