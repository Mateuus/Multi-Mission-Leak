class uaGJizFeG
{
 idd = 2900;
 name = "uaGJizFeG";
 movingEnabled = 1;
 enableSimulation = 1;

 class controlsBackground
 {

 class Background: aAX
 {
 idc = 1200;
 text = "Resources\Textures\Icons\background.jpg";
 x = 0.214633 * safezoneW + safezoneX;
 y = 0.113195 * safezoneH + safezoneY;
 w = 0.566586 * safezoneW;
 h = 0.746476 * safezoneH;
 };

 class SideChatHeader : EPFMAm
 {
 idc = -1;
 text = "$STR_SM_SC";
 x = 0.231885 * safezoneW + safezoneX;
 y = 0.654019 * safezoneH + safezoneY;
 w = 0.154682 * safezoneW;
 h = 0.033004 * safezoneH;
 };

 };

 class controls
 {

 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Einstellungen";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class VDonFoot : EPFMAm
 {
 idc = -1;
 text = "$STR_SM_onFoot";
 x = 0.231885 * safezoneW + safezoneX;
 y = 0.213965 * safezoneH + safezoneY;
 w = 0.0979651 * safezoneW;
 h = 0.0440054 * safezoneH;
 };

 class VDinCar : EPFMAm
 {
 idc = -1;
 text = "$STR_SM_inCar";
 x = 0.231885 * safezoneW + safezoneX;
 y = 0.345981 * safezoneH + safezoneY;
 w = 0.0979651 * safezoneW;
 h = 0.0550067 * safezoneH;
 };

 class VDinAir : EPFMAm
 {
 idc = -1;
 text = "$STR_SM_inAir";
 x = 0.231885 * safezoneW + safezoneX;
 y = 0.488999 * safezoneH + safezoneY;
 w = 0.0979651 * safezoneW;
 h = 0.0440054 * safezoneH;
 };

 class VD_onfoot_slider : bWuKznMkb
 {
 idc = 2901;
 text = "";
 onSliderPosChanged = "[0,_this select 1] call zero_fnc_cXPKgddKd;";
 tooltip = "$STR_SM_ToolTip1";
 x = 0.340162 * safezoneW + safezoneX;
 y = 0.224966 * safezoneH + safezoneY;
 w = 0.360924 * safezoneW;
 h = 0.0440054 * safezoneH;
 };

 class VD_onfoot_value : EPFMAm
 {
 idc = 2902;
 text = "";
 x = 0.711398 * safezoneW + safezoneX;
 y = 0.224966 * safezoneH + safezoneY;
 w = 0.0670288 * safezoneW;
 h = 0.0440054 * safezoneH;
 };

 class VD_car_slider : bWuKznMkb
 {
 idc = 2911;
 text = "";
 onSliderPosChanged = "[1,_this select 1] call zero_fnc_cXPKgddKd;";
 tooltip = "$STR_SM_ToolTip2";
 x = 0.340162 * safezoneW + safezoneX;
 y = 0.356983 * safezoneH + safezoneY;
 w = 0.360924 * safezoneW;
 h = 0.0440054 * safezoneH;
 };

 class VD_car_value : EPFMAm
 {
 idc = 2912;
 text = "";
 x = 0.711398 * safezoneW + safezoneX;
 y = 0.356983 * safezoneH + safezoneY;
 w = 0.0670288 * safezoneW;
 h = 0.0440054 * safezoneH;
 };

 class VD_air_slider : bWuKznMkb
 {
 idc = 2921;
 text = "";
 onSliderPosChanged = "[2,_this select 1] call zero_fnc_cXPKgddKd;";
 tooltip = "$STR_SM_ToolTip3";
 x = 0.340162 * safezoneW + safezoneX;
 y = 0.488999 * safezoneH + safezoneY;
 w = 0.360924 * safezoneW;
 h = 0.0440054 * safezoneH;
 };

 class VD_air_value : EPFMAm
 {
 idc = 2922;
 text = "";
 x = 0.711398 * safezoneW + safezoneX;
 y = 0.488999 * safezoneH + safezoneY;
 w = 0.0670288 * safezoneW;
 h = 0.0440054 * safezoneH;
 };

 class btn_home: MCHU
 {
 idc = -1;
 tooltip = "$STR_PM_Haupt";
 onButtonClick = "closeDialog 0; closeDialog 0; [] spawn zero_fnc_IFXrAr";
 x = 0.232409 * safezoneW + safezoneX;
 y = 0.118926 * safezoneH + safezoneY;
 w = 0.0773409 * safezoneW;
 h = 0.0440054 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.75,0.75,0.75,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 };

 class SideChatONOFF : sqm
 {
 idc = 2971;
 tooltip = "";
 action = "[] call RAZbpk;";
 sizeEx = 0.04;
 x = 0.422659 * safezoneW + safezoneX;
 y = 0.654019 * safezoneH + safezoneY;
 w = 0.0773409 * safezoneW;
 h = 0.033004 * safezoneH;
 };

 class ButtonClose : MCHU
 {
 idc = -1;
 text = "$STR_Global_Close";
 onButtonClick = "closeDialog 0;";
 x = 0.761911 * safezoneW + safezoneX;
 y = 0.126948 * safezoneH + safezoneY;
 w = 0.0128478 * safezoneW;
 h = 0.0239891 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.75,0.75,0.75,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 };
};
};
