class ES_impound_menu
{
	idd = 2800;
	name="ES_vehicle_shop";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	
	class controlsBackground
	{
		class BGpic: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\menu_garage.jpg";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.479531 * safezoneW;
			h = 0.066 * safezoneH;
		};

		class MB: ES_RscText
		{
			idc = -1;
			x = 0.257331 * safezoneW + safezoneX;
			y = 0.229574 * safezoneH + safezoneY;
			w = 0.479531 * safezoneW;
			h = 0.594 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};

		class VehicleTitleBox: ES_RscText
		{
			idc = -1;
			text = "$STR_GUI_YourVeh";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};

		class VehicleInfoHeader: ES_RscText
		{
			idc = 2830;
			text = "$STR_GUI_VehInfo";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};

		class CloseBtn: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Schließen"; //--- ToDo: Localize;
		};

		class RentCar: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Retrieve";
			onButtonClick = "[] call ES_fnc_unimpound; closeDialog 0;";
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class BuyCar: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Sell";
			onButtonClick = "[] call ES_fnc_sellGarage; closeDialog 0;";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,-1,-1,1};
		};
	};
	class controls
	{
		class VehicleList: ES_RscListbox
		{
			idc = 2802;
			text = "";
			sizeEx = 0.04;
			onLBSelChanged = "_this call ES_fnc_garageLBChange;";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.495 * safezoneH;
		};

		class vehicleInformationList: ES_RscStructuredText
		{
			idc = 2803;
			text = "";
			sizeEx = 0.035;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.495 * safezoneH;
		};
	};
};
