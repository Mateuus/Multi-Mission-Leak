class ES_Vehicle_Shop_v2
{
	idd = 2300;
	name="ES_vehicle_shop";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false]; ";
	onKeyDown = "_this call ES_fnc_vShopCam"; //bei bedarf verlinkung ändern
	
	class controlsBackground
	{
		class ES_RscTitleBackground : ES_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class MainBackground : ES_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.583 * safezoneH;
		};
		
		class SecondBackground : ES_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.583 * safezoneH;
		};
		
		class Title : ES_RscTitle
		{
			idc = 2301;
			text = "";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class VehicleTitleBox : ES_RscText
		{
			idc = -1;
			text = "$STR_GUI_ShopStock";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class VehicleInfoHeader : ES_RscText
		{
			idc = 2330;
			text = "$STR_GUI_VehInfo";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			
			x = 0.83 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CloseBtn : ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			
			x = 0.0307812 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class RentCar : ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_RentVeh";
			onButtonClick = "[false] spawn ES_fnc_vehicleShopBuy;";
			x = 0.0307812 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class BuyCar : ES_RscButtonMenu 
		{
			idc = 2309;
			text = "$STR_Global_Buy";
			onButtonClick = "[true] spawn ES_fnc_vehicleShopBuy;";
			x = 0.0307812 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls
	{
		class VehicleList : ES_RscListBox
		{
			idc = 2302;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call ES_fnc_vehicleShopLBChange";
			
			//Position & height
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.396 * safezoneH;
		};
		
		class ColorList : ES_RscCombo
		{
			idc = 2304;
			x = 0.0307812 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "_this call ES_fnc_vehicleSkinLBChange"; 
		};
		
		class vehicleInfomationList : ES_RscStructuredText
		{
			idc = 2303;
			text = "";
			sizeEx = 0.035;
			
			x = 0.835156 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.253 * safezoneH;
		};
		
		class pictureBackground: ES_RscPicture
		{
			idc = 2305;
			text = "Images\icons\camControl.paa";
			
			x = 0.835156 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.231 * safezoneH;
		};
	};
};