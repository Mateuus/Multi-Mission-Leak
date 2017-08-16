class QvrUEr
{
 idd = 2800;
 name="QvrUEr";
 movingEnabled = 0;
 enableSimulation = 1;
 onLoad = "ctrlShow [2330,false];";

 class controlsBackground
 {
 class Background: aAX
 {
 idc = 1200;
 text = "Resources\Textures\Icons\background.jpg";
 x = 0.215941 * safezoneW + safezoneX;
 y = 0.113221 * safezoneH + safezoneY;
 w = 0.566481 * safezoneW;
 h = 0.739284 * safezoneH;
 };

 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "$STR_pInAct_AccessGarage";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class VehicleTitleBox : EPFMAm
 {
 idc = -1;
 text = "$STR_GUI_YourVeh";
 x = 0.225 * safezoneW + safezoneX;
 y = 0.2 * safezoneH + safezoneY;
 w = 0.175 * safezoneW;
 h = 0.04 * safezoneH;
 };

 class VehicleInfoHeader : EPFMAm
 {
 idc = 2830;
 text = "$STR_GUI_VehInfo";
 x = 0.4625 * safezoneW + safezoneX;
 y = 0.2 * safezoneH + safezoneY;
 w = 0.175 * safezoneW;
 h = 0.04 * safezoneH;
 };

 class CloseBtn : MCHU
 {
 idc = -1;
 onButtonClick = "closeDialog 0;";
 x = 0.760518 * safezoneW + safezoneX;
 y = 0.126 * safezoneH + safezoneY;
 w = 0.014071 * safezoneW;
 h = 0.026 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.75,0.75,0.75,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 class Attributes {
 align = "center";
 };
 };

 class unimpound : MCHU
 {
 idc = -1;
 text = "$STR_Global_Retrieve";
 onButtonClick = "[] spawn zero_fnc_gUpb;";
 x = 0.225 * safezoneW + safezoneX;
 y = 0.8 * safezoneH + safezoneY;
 w = 0.1 * safezoneW;
 h = 0.04 * safezoneH;
 colorBackground[] = {0,0,0,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 class Attributes {
 align = "center";
 };
 };

 class sellCar : MCHU
 {
 idc = -1;
 text = "$STR_Global_Sell";
 onButtonClick = "[] spawn zero_fnc_kZbYKuu;";
 x = 0.3375 * safezoneW + safezoneX;
 y = 0.8 * safezoneH + safezoneY;
 w = 0.1 * safezoneW;
 h = 0.04 * safezoneH;
 colorBackground[] = {0,0,0,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 class Attributes {
 align = "center";
 };
 };
 };

 class controls
 {
 class VehicleList : ZaMJRapk
 {
 idc = 2802;
 text = "";
 sizeEx = 0.04;
 colorBackground[] = {-1,-1,-1,0};
 onLBSelChanged = "_this call zero_fnc_vuI;";
 x = 0.225 * safezoneW + safezoneX;
 y = 0.24 * safezoneH + safezoneY;
 w = 0.2125 * safezoneW;
 h = 0.54 * safezoneH;
 };

 class vehicleInfomationList : ssussK
 {
 idc = 2803;
 text = "";
 sizeEx = 0.035;
 x = 0.465642 * safezoneW + safezoneX;
 y = 0.24 * safezoneH + safezoneY;
 w = 0.302618 * safezoneW;
 h = 0.54 * safezoneH;
 };

 class trenn: ZaMJRapk
 {
 idc = 1501;
 x = 0.453142 * safezoneW + safezoneX;
 y = 0.221 * safezoneH + safezoneY;
 w = 0.00212358 * safezoneW;
 h = 0.6 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };

 class MainHideText : EPFMAm
 {
 idc = 2811;
 text = "$STR_ANOTF_QueryGarage";
 sizeEx = 0.06;
 x = 0.225 * safezoneW + safezoneX;
 y = 0.42 * safezoneH + safezoneY;
 w = 0.425 * safezoneW;
 h = 0.16 * safezoneH;
 };

 class checkCar : MCHU
 {
 idc = -1;
 text = "$STR_NOTF_Garage_Update_Button";
 onButtonClick = "if(!isNil 'IbjHs' && servertime - IbjHs < 30) exitWith {hint localize 'STR_NOTF_Garage_Update';}; if(isNil 'IbjHs') then {IbjHs = servertime;}; IbjHs = servertime; [getPlayerUID player, playerSide, Aeclcw, player] remoteExec ['zero_fnc_getVehicles',2];";
 x = 0.465118 * safezoneW + safezoneX;
 y = 0.8 * safezoneH + safezoneY;
 w = 0.1 * safezoneW;
 h = 0.04 * safezoneH;
 colorBackground[] = {0,0,0,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 class Attributes {
 align = "center";
 };
 };

 class insurance_buy_text: EPFMAm
 {
 idc = 2805;
 text = "Versicherung kaufen";
 x = (0.466118 * safezoneW + safezoneX) + (0.1 * safezoneW);
 y = 0.7925 * safezoneH + safezoneY;
 w = 0.0927805 * safezoneW;
 h = 0.033 * safezoneH;
 colorBackground[] = {0,0,0,0};
 };

 class insurance_buy : ryeG
 {
 idc = 2804;
 x = (0.558898 * safezoneW + safezoneX) + (0.1 * safezoneW);
 y = 0.7925 * safezoneH + safezoneY;
 w = 0.0206235 * safezoneW;
 h = 0.033 * safezoneH;
 tooltip = "Versicherung kaufen";
 color[] = {0.863,0.078,0.231,1};
 colorFocused[] = {0.863,0.078,0.231,1};
 colorHover[] = {0.863,0.078,0.231,1};
 colorPressed[] = {0.863,0.078,0.231,1};
 colorDisabled[] = {0.863,0.078,0.231,1};
 colorBackground[] = {0, 0, 0, 0};
 colorBackgroundFocused[] = {0, 0, 0, 0};
 colorBackgroundHover[] = {0, 0, 0, 0};
 colorBackgroundPressed[] = {0, 0, 0, 0};
 colorBackgroundDisabled[] = {0, 0, 0, 0};
 };
 };
};
