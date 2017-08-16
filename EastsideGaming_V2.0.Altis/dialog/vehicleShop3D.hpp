class Life_Vehicle_Shop_v2_3D {
    idd = 2300;
    name="life_vehicle_shop";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "ctrlShow [2330,false];";
    onUnLoad = "[] call life_fnc_vehicleShopEnd3DPreview";

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_klein_menu.paa";
        	x = -0.015625 * safezoneW + safezoneX;
        	y = 0.038 * safezoneH + safezoneY;
        	w = 0.319688 * safezoneW;
        	h = 0.605 * safezoneH;
        };
        class RentCar: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Mieten"; //--- ToDo: Localize;
          onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
        	x = 0.0204687 * safezoneW + safezoneX;
        	y = 0.599 * safezoneH + safezoneY;
        	w = 0.118594 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t font='PuristaBold' size='1.5'>Fahrzeugshop</t>"; //--- ToDo: Localize;
        	x = 0.04625 * safezoneW + safezoneX;
        	y = 0.06 * safezoneH + safezoneY;
        	w = 0.201094 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class btnClose: ESG_RscCloseButton
        {
        	idc = -1;
        	x = 0.247344 * safezoneW + safezoneX;
        	y = 0.049 * safezoneH + safezoneY;
        	w = 0.020625 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
          onButtonClick = "closeDialog 0;";
        };
        class BuyCar: Life_RscButtonMenu
        {
        	idc = 2309;
        	text = "Kaufen"; //--- ToDo: Localize;
          onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";
        	x = 0.144219 * safezoneW + safezoneX;
        	y = 0.599 * safezoneH + safezoneY;
        	w = 0.118594 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
    };

    class controls {
        class VehicleList: Life_RscListbox
        {
          idc = 2302;
          text = "";
          sizeEx = 0.04;
          colorBackground[] = {0.1,0.1,0.1,0.9};
          onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
        	x = 0.0153125 * safezoneW + safezoneX;
        	y = 0.115 * safezoneH + safezoneY;
        	w = 0.252656 * safezoneW;
        	h = 0.231 * safezoneH;
        };
        class ColorList: Life_RscCombo
        {
          idc = 2304;
          onLBSelChanged = "[] call life_fnc_vehicleColor3DRefresh;";
        	x = 0.0153125 * safezoneW + safezoneX;
        	y = 0.357 * safezoneH + safezoneY;
        	w = 0.175313 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class vehicleInformationList: Life_RscStructuredText
        {
          idc = 2303;
          text = "";
          sizeEx = 0.035;
        	x = 0.0153125 * safezoneW + safezoneX;
        	y = 0.401 * safezoneH + safezoneY;
        	w = 0.252656 * safezoneW;
        	h = 0.176 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
    };
};
