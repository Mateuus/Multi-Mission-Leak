class Life_impound_menu
{
	idd = 2800;
	name="life_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class hintergrund: Life_RscPicture
		{
			idc = -1;
			text = "images\garage_gui.paa";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.484688 * safezoneW;
			h = 0.836 * safezoneH;
		};

		class text_garage: Life_RscText
		{
			idc = 2801;
			text = "Garage";
			style = 2;
			x = 0.418021 * safezoneW + safezoneX;
			y = 0.40563 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.055 * safezoneH;
			sizeEx = 0.05;
		};

		class text_fahrzeuglistbox: Life_RscText
		{
			idc = -1;
			text = "Typ";
			sizeEx = 0.04;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class VehicleInfoHeader : Life_RscText
		{
			idc = -1;
			sizeEx = 0.04;
			text = "Informationen";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CloseBtn : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.749408 * safezoneH + safezoneY;
			w = 0.0175002 * safezoneW;
			h = 0.0255925 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class RentCar : CloseBtn
		{
			idc = -1;
			text = "$STR_Global_Retrieve";
			onButtonClick = "[] call life_fnc_unimpound;";
			x = 0.663073 * safezoneW + safezoneX;
			y = 0.675074 * safezoneH + safezoneY;
			w = 0.0602603 * safezoneW;
			h = 0.0210741 * safezoneH;
		};
		
		class BuyCar : CloseBtn
		{
			idc = -1;
			text = "$STR_Global_Sell";
			onButtonClick = "[] spawn life_fnc_sellGarage;";
			x = 0.662812 * safezoneW + safezoneX;
			y = 0.630148 * safezoneH + safezoneY;
			w = 0.0602603 * safezoneW;
			h = 0.0210741 * safezoneH;
		};
	};
	
	class controls
	{
		class VehicleList : Life_RscListBox
		{
			idc = 2802;
			text = "";
			sizeEx = 0.03;
			colorBackground[] = {0.1,0.1,0.1,0};
			onLBSelChanged = "_this call life_fnc_garageLBChange;";	
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.242 * safezoneH;
		};
		
		class vehicleInfomationList : Life_RscStructuredText
		{
			idc = 2803;
			text = "";
			size = 0.03;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.242 * safezoneH;
		};
	};
};