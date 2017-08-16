class LHM_don_Vehicle_Shop_v2
{
	idd = 2300;
	name="lhm_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	
	
	class controlsBackground
	{
		
		
		
		class Title : lhm_RscTitle
		{
			idc = 2301;
			text = "";
			x = 0.110677 * safezoneW + safezoneX;
			y = 0.32063 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
		};
	
		
		class VehicleInfoHeader : lhm_RscText
		{
			idc = 2330;
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
			onButtonClick = "closeDialog 0;";
			x = 0.11224 * safezoneW + safezoneX;
			y = 0.724185 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class RentCar : lhm_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_RentVeh";
			onButtonClick = "[false] spawn lhm_fnc_donatorvehicleShopBuy;";
			x = 0.111719 * safezoneW + safezoneX;
			y = 0.691407 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class BuyCar : lhm_RscButtonMenu 
		{
			idc = 2309;
			text = "$STR_Global_Buy";
			onButtonClick = "[true] spawn lhm_fnc_donatorvehicleShopBuy;";
			x = 0.11125 * safezoneW + safezoneX;
			y = 0.661407 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls
	{
		class VehicleList : lhm_RscListBox
		{
			idc = 2302;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call lhm_fnc_donatorvehicleShopLBChange";
			
			//Position & height
			x = 0.108652 * safezoneW + safezoneX;
			y = 0.362389 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.253 * safezoneH;
		};
		
		class ColorList : lhm_RscCombo
		{
			onMouseButtonClick ="[] spawn lhm_fnc_vehicleShopDemoSetTexture";
			idc = 2304;
			x = 0.111144 * safezoneW + safezoneX;
			y = 0.622741 * safezoneH + safezoneY;
			w = 0.172709 * safezoneW;
			h = 0.0274445 * safezoneH;
		};
		
		class vehicleInfomationList : lhm_RscStructuredText
		{
			idc = 2303;
			text = "";
			sizeEx = 0.035;
			
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.308 * safezoneH;
		};
		class SpeedMoving: lhm_RscXSliderH
		{	
			idc = 1910;
			text = "";
			onSliderPosChanged = "LHM_shop_Rotate_speed = (_this select 1) ;";
			tooltip = "Drehgeschwindigkeit einstellen";
			x = 0.415437 * safezoneW + safezoneX;
			y = 0.76488 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};