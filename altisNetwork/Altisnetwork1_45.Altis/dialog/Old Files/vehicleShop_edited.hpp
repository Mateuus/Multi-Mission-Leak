class Life_Vehicle_Shop_v2 
{
    idd = -1;
    name="life_vehicle_shop";
    movingEnabled = 0;
    enableSimulation = 1;
    onLoad = "ctrlShow [2330,false];";
    class controlsBackground {
        class Title: Life_RscTitle
        {
	        idc = -1;
            text = "";
	        x = 0.4407 * safezoneW + safezoneX;
	        y = 0.247 * safezoneH + safezoneY;
	        w = 0.119715 * safezoneW;
	        h = 0.042 * safezoneH;
        };
        class VehicleTitleBox: Life_RscText
        {
	        idc = -1;
	        text = "$STR_GUI_ShopStock";
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.3843])", "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.7019])", "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.8862])", "(profileNamespace getVariable ['GUI_BCG_RGB_A',0.7])"};
	        x = 0.306552 * safezoneW + safezoneX;
	        y = 0.251 * safezoneH + safezoneY;
	        w = 0.118669 * safezoneW;
	        h = 0.037 * safezoneH;
        };
        class VehicleInfoHeader: Life_RscText
        {
	        idc = -1;
            text = "$STR_GUI_VehInfo";
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.3843])", "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.7019])", "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.8862])", "(profileNamespace getVariable ['GUI_BCG_RGB_A',0.7])"};
	        x = 0.574985 * safezoneW + safezoneX;
	        y = 0.252 * safezoneH + safezoneY;
	        w = 0.119192 * safezoneW;
	        h = 0.036 * safezoneH;
        };
        class CloseBtn: Life_RscButtonMenu
        {
		    idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
	        x = 0.438086 * safezoneW + safezoneX;
	        y = 0.489 * safezoneH + safezoneY;
	        w = 0.0515953 * safezoneW;
	        h = 0.066 * safezoneH;
        };
        class RentCar: Life_RscButtonMenu
        {
	        idc = -1;
            text = "$STR_Global_RentVeh";
            onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
	        x = 0.438086 * safezoneW + safezoneX;
	        y = 0.401 * safezoneH + safezoneY;
	        w = 0.0515953 * safezoneW;
	        h = 0.066 * safezoneH;
        };
        class BuyCar: Life_RscButtonMenu
        {
	        idc = -1;
            text = "$STR_Global_Buy";
            onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";
	        x = 0.438086 * safezoneW + safezoneX;
	        y = 0.313 * safezoneH + safezoneY;
	        w = 0.0515953 * safezoneW;
	        h = 0.066 * safezoneH;
        };
    };
	class controls 
	{
        class VehicleList: Life_RscListBox
        {
	        idc = -1;
            text = "";
            colorBackground[] = {0.1,0.1,0.1,0.9};
            onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
	        x = 0.303938 * safezoneW + safezoneX;
	        y = 0.313 * safezoneH + safezoneY;
	        w = 0.123829 * safezoneW;
	        h = 0.396 * safezoneH;
        };
        class ColorList: Life_RscCombo
        {
	        idc = -1;
	        x = 0.303938 * safezoneW + safezoneX;
	        y = 0.731 * safezoneH + safezoneY;
	        w = 0.123829 * safezoneW;
	        h = 0.022 * safezoneH;
        };
        class vehicleInfomationList: Life_RscStructuredText
        {
	        idc = -1;
            text = "";
	        x = 0.500001 * safezoneW + safezoneX;
	        y = 0.313 * safezoneH + safezoneY;
	        w = 0.196062 * safezoneW;
	        h = 0.396 * safezoneH;
        };
    };   
};