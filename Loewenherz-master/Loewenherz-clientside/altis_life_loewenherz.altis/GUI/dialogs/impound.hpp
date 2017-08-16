class lhm_impound_menu
{
	idd = 2800;
	name="lhm_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";

	class controlsBackground
	{
		class VehicleTitleBox : lhm_RscTitle
		{
			idc = -1;
			text = "$STR_GUI_YourVeh";
			x = 0.113802 * safezoneW + safezoneX;
			y = 0.361371 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class VehicleInfoHeader : lhm_RscText
		{
			idc = 2830;
			text = "$STR_GUI_VehInfo";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.626354 * safezoneW + safezoneX;
			y = 0.526629 * safezoneH + safezoneY;
			w = 0.282032 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CloseBtn : lhm_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			sizeEx = 0.05;
			onButtonClick = "closeDialog 0;";
			x = 0.11224 * safezoneW + safezoneX;
			y = 0.724185 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RentCar : lhm_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Retrieve";
			sizeEx = 0.05;
			onButtonClick = "[] call lhm_fnc_unimpound;";
			x = 0.11125 * safezoneW + safezoneX;
			y = 0.661407 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class BuyCar : lhm_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Sell";
			sizeEx = 0.05;
			onButtonClick = "[] spawn lhm_fnc_sellGarage;";
			x = 0.111719 * safezoneW + safezoneX;
			y = 0.691407 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		//class serviceCar : lhm_RscButtonMenu
		//{
		//	idc = -1;
		//	text = "Service";
		//	onButtonClick = "[] call lhm_fnc_serviceVehicle;";
		//	x = 0.4 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
		//	y = 0.9 - (1 / 25);
		//	w = (6.25 / 40);
		//	h = (1 / 25);
		//};


	};

	class controls
	{
		class VehicleList : lhm_RscListBox
		{
			idc = 2802;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call lhm_fnc_garageLBChange;";

			//Position & height
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.163438 * safezoneW;
			h = 0.254852 * safezoneH;
		};

		class vehicleInfomationList : lhm_RscStructuredText
		{
			idc = 2803;
			text = "";
			sizeEx = 0.035;

			x = 0.62375 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.308 * safezoneH;
		};
		
		class SpeedMoving: lhm_RscXSliderH
		{	
			idc = 1911;
			text = "";
			onSliderPosChanged = "LHM_shop_Rotate_speed = (_this select 1) ;";
			tooltip = "Drehgeschwindigkeit einstellen";
			x = 0.415437 * safezoneW + safezoneX;
			y = 0.76488 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.033 * safezoneH;
		};

		//class MainBackgroundHider : lhm_RscText
		//{
		//	colorBackground[] = {0,0,0,1};
		//	idc = 2810;
		//	x = 0.1;
		//	y = 0.2 + (11 / 250);
		//	w = 0.8;
		//	h = 0.7 - (22 / 250);
		//};

	//	class MainHideText : lhm_RscText
	//	{
		//	idc = 2811;
		//	text = "$STR_ANOTF_QueryGarage";
		//	sizeEx = 0.06;
		//	x = 0.24; y = 0.5;
		//	w = 0.6;
		//	h = (1 / 15);
		//};
	};
};