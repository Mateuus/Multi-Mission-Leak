class life_vehicle_shop_v2
{
	idd = 2300;
	name="life_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	
	class controlsBackground
	{
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.118517 * safezoneW + safezoneX;
			y = 0.159067 * safezoneH + safezoneY;
			w = 0.15981 * safezoneW;
			h = 0.626876 * safezoneH;
		};
		
		class VehicleTitleBox : Life_RscText
		{
			idc = -1;
			colorBackground[] = {1,0.537,0,0.5};
			text = "$STR_GUI_ShopStock";
			x = 0.118517 * safezoneW + safezoneX;
			y = 0.137072 * safezoneH + safezoneY;
			w = 0.15981 * safezoneW;
			h = 0.0219957 * safezoneH;
		};
		
		class CloseBtn : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.118517 * safezoneW + safezoneX;
			y = 0.829935 * safezoneH + safezoneY;
			w = 0.0721724 * safezoneW;
			h = 0.0219957 * safezoneH;
		};
		
		class RentCar : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_RentVeh";
			onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
			x = 0.206155 * safezoneW + safezoneX;
			y = 0.796941 * safezoneH + safezoneY;
			w = 0.0721724 * safezoneW;
			h = 0.0219957 * safezoneH;
		};
		
		class BuyCar : Life_RscButtonMenu 
		{
			idc = 2309;
			text = "$STR_Global_Buy";
			onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";
			x = 0.118517 * safezoneW + safezoneX;
			y = 0.796941 * safezoneH + safezoneY;
			w = 0.0721724 * safezoneW;
			h = 0.0219957 * safezoneH;
		};
	};
	
	class controls
	{
		class VehicleList : Life_RscListBox
		{
			idc = 2302;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
			
			//Position & height
			x = 0.118517 * safezoneW + safezoneX;
			y = 0.159067 * safezoneH + safezoneY;
			w = 0.15981 * safezoneW;
			h = 0.60488 * safezoneH;
		};
		
		class ColorList : Life_RscCombo
		{
			idc = 2304;
			x = 0.118517 * safezoneW + safezoneX;
			y = 0.763948 * safezoneH + safezoneY;
			w = 0.15981 * safezoneW;
			h = 0.0219957 * safezoneH;
		};
		
		class vehicleInfomationList : Life_RscStructuredText
		{
			idc = 2303;
			text = "";
			sizeEx = 0.035;
			
			x = 0.706207 * safezoneW + safezoneX;
			y = 0.390022 * safezoneH + safezoneY;
			w = 0.180431 * safezoneW;
			h = 0.318937 * safezoneH;
		};
	};
};