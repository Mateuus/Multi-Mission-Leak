class kGM {

 idd = 35020;
 name= "kGM";
 movingEnable = 0;
 enableSimulation = 1;
 onLoad = "[] spawn zero_fnc_fFq; playMusic 'LeadTrack01_F_EPA';";

 class controlsBackground {
 class background: aAX
 {
 idc = 1201;
 text = "Resources\Textures\Icons\join.jpg";
 x = -2.45869e-008 * safezoneW + safezoneX;
 y = -1.63913e-008 * safezoneH + safezoneY;
 w = 1 * safezoneW;
 h = 1 * safezoneH;
 };
 };

 class controls {
 class ProgressBar : JXoNTXt
 {
 idc = 35021;
 x = 0.00104166 * safezoneW + safezoneX;
 y = 0.00425927 * safezoneH + safezoneY;
 w = 1 * safezoneW;
 h = 0.0055 * safezoneH;
 colorText[] = {0.706,0.075,0.216,1};
 };

 class ProgressText : ssussK
 {
 idc = 35022;
 text = "";
 x = 0.4 * safezoneW + safezoneX;
 y = 0.04 * safezoneH + safezoneY;
 w = 0.2 * safezoneW;
 h = 0.04 * safezoneH;
 };

 class MainTextGroup : uuiMHz {
 idc = -1;
 x = 0.025 * safezoneW + safezoneX;
 y = 0.04 * safezoneH + safezoneY;
 w = 0.250086 * safezoneW;
 h = 0.72 * safezoneH;
 class HScrollbar : HScrollbar {
 height = 0;
 };
 class controls {
 class MainText : ssussK {
 idc = 35023;
 text = "";
 sizeEx = 0.035;
 colorBackground[] = {0.28,0.28,0.28,0};
 shadow = 0;
 x = 0;
 y = 0;
 w = 0.935;
 };
 };
 };

 class continuebtn: MCHU
 {
 idc = 35024;
 text = "AUF DIE INSEL";
 onButtonClick = "closeDialog 0;";
 x = 0.025 * safezoneW + safezoneX;
 y = 0.76 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
 h = 0.04 * safezoneH;
 colorText[] = {0.863,0.078,0.235,1};
 colorBackground[] = {0,0,0,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {0.863,0.078,0.235,1};
 colorFocused[] = {1,1,1,1};
 color2[] = {0.863,0.078,0.235,1};
 colorDisabled[] = {0,0,0,0.4};
 class Attributes {
 align = "center";
 };
 };

 class hilfe: MCHU
 {
 idc = 35025;
 text = "HILFE";
 onButtonClick = "[] spawn zero_fnc_rkereao;";
 x = 0.025 * safezoneW + safezoneX;
 y = 0.84 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
 h = 0.04 * safezoneH;
 colorText[] = {1,1,1,1};
 colorBackground[] = {0,0,0,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {1,1,1,1};
 color2[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 class Attributes {
 align = "center";
 };
 };

 class quit: MCHU
 {
 idc = 35026;
 text = "SERVER VERLASSEN";
 onButtonClick = "[""Disconnect"",true,false] call BIS_fnc_endMission;";
 x = 0.025 * safezoneW + safezoneX;
 y = 0.92 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
 h = 0.04 * safezoneH;
 colorText[] = {1,1,1,1};
 colorBackground[] = {0,0,0,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {1,1,1,1};
 color2[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 class Attributes {
 align = "center";
 };
 };

 class restart_zeiten: ssussK
 {
 idc = 35027;
 x = 0.1635 * safezoneW + safezoneX;
 y = 0.9204 * safezoneH + safezoneY;
 w = 0.45 * safezoneW;
 h = 0.04 * safezoneH;
 class Attributes {
 align = "center";
 };
 };

 class middle_title: ssussK
 {
 idc = 35028;
 x = 0.4125 * safezoneW + safezoneX;
 y = 0.1952 * safezoneH + safezoneY;
 w = 0.175 * safezoneW;
 h = 0.04 * safezoneH;
 class Attributes {
 align = "center";
 };
 };

 class middle_attention: ssussK
 {
 idc = 35029;
 x = 0.4125 * safezoneW + safezoneX;
 y = 0.24 * safezoneH + safezoneY;
 w = 0.175 * safezoneW;
 h = 0.46 * safezoneH;
 };

 class background: ZaMJRapk
 {
 colorBackground[] = {0.863,0.078,0.235,0.3};
 idc = 35030;
 x = 0.403736 * safezoneW + safezoneX;
 y = 0.18 * safezoneH + safezoneY;
 w = 0.193193 * safezoneW;
 h = 0.539 * safezoneH;
 };
 };
};
