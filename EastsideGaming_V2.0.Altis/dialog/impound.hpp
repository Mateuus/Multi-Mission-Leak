class Life_impound_menu {
    idd = 2800;
    name="life_vehicle_shop";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "ctrlShow [2330,false];";

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_menu.paa";
        	x = 0.17 * safezoneW + safezoneX;
        	y = 0.115 * safezoneH + safezoneY;
        	w = 0.665156 * safezoneW;
        	h = 0.693 * safezoneH;
        };
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Garage</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class btn_close: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Schliessen"; //--- ToDo: Localize;
        	x = 0.180312 * safezoneW + safezoneX;
        	y = 0.753 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "closeDialog 0;";
        };
        class VehicleTitleBox: Life_RscTitle
        {
        	idc = -1;
        	text = "Deine eingeparkten Fahrzeuge"; //--- ToDo: Localize;
        	x = 0.175156 * safezoneW + safezoneX;
        	y = 0.214 * safezoneH + safezoneY;
        	w = 0.159844 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class Trenner: Life_RscText
        {
        	idc = -1;
        	x = 0.479375 * safezoneW + safezoneX;
        	y = 0.225 * safezoneH + safezoneY;
        	w = 0.004125 * safezoneW;
        	h = 0.528 * safezoneH;
        	colorText[] = {0.753,0.145,0.145,1};
        	colorBackground[] = {0.753,0.145,0.145,1};
        };
        class VehicleInfoHeader: Life_RscTitle
        {
        	idc = -1;
        	text = "Fahrzeuginformationen"; //--- ToDo: Localize;
        	x = 0.5 * safezoneW + safezoneX;
        	y = 0.214 * safezoneH + safezoneY;
        	w = 0.159844 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class RetrieveCar: Life_RscButtonMenu
        {
        	idc = 2400;
        	text = "Fahrzeug Ausparken"; //--- ToDo: Localize;
        	x = 0.685625 * safezoneW + safezoneX;
        	y = 0.753 * safezoneH + safezoneY;
        	w = 0.139219 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "[] call life_fnc_unimpound;";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class SellCar: Life_RscButtonMenu
        {
        	idc = 2401;
        	text = "Fahrzeug Verkaufen"; //--- ToDo: Localize;
        	x = 0.536094 * safezoneW + safezoneX;
        	y = 0.753 * safezoneH + safezoneY;
        	w = 0.139219 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.7};
          onButtonClick = "[] call life_fnc_sellGarage; closeDialog 0;";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
    };

    class controls {
        class VehicleList: Life_RscListbox
        {
          idc = 2802;
          text = "";
          sizeEx = 0.04;
          colorBackground[] = {0.1,0.1,0.1,0.9};
          onLBSelChanged = "_this call life_fnc_garageLBChange;";
        	x = 0.180312 * safezoneW + safezoneX;
        	y = 0.247 * safezoneH + safezoneY;
        	w = 0.28875 * safezoneW;
        	h = 0.484 * safezoneH;
        };
        class VehicleInformationList: Life_RscStructuredText
        {
          idc = 2803;
          text = "";
          sizeEx = 0.035;
        	x = 0.505156 * safezoneW + safezoneX;
        	y = 0.247 * safezoneH + safezoneY;
        	w = 0.314531 * safezoneW;
        	h = 0.484 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class MainBackgroundHider: Life_RscText
        {
        	idc = 2810;
        	x = 0.17 * safezoneW + safezoneX;
        	y = 0.192 * safezoneH + safezoneY;
        	w = 0.665156 * safezoneW;
        	h = 0.616 * safezoneH;
        	colorBackground[] = {0,0,0,1};
        };
        class MeinHideText: Life_RscText
        {
          idc = 2811;
          text = "$STR_ANOTF_QueryGarage";
          sizeEx = 0.06;
        	x = 0.319531 * safezoneW + safezoneX;
        	y = 0.357 * safezoneH + safezoneY;
        	w = 0.360937 * safezoneW;
        	h = 0.143 * safezoneH;
        };
    };
};
