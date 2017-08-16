class PjGnb {
 idd = 2700;
 name= "ZZyTl";
 movingEnable = 0;
 enableSimulation = 1;
 onLoad = "[] spawn zero_fnc_RUB;";

 class controlsBackground {

 class Background: aAX
 {
 idc = 1200;
 text = "Resources\Textures\Icons\background.jpg";
 x = 0.215941 * safezoneW + safezoneX;
 y = 0.113221 * safezoneH + safezoneY;
 w = 0.566481 * safezoneW;
 h = 0.739284 * safezoneH;
 };
 };

 class controls {


 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "$STR_Keys_Title";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class KeyChainList : ZaMJRapk
 {
 idc = 2701;
 text = "";
 sizeEx = 0.035;

 x = 0.221523 * safezoneW + safezoneX;
 y = 0.246907 * safezoneH + safezoneY;
 w = 0.556953 * safezoneW;
 h = 0.429158 * safezoneH;
 colorBackground[] = {0,0,0,0};
 };

 class NearPlayers : nCAG
 {

 idc = 2702;

 x = 0.225 * safezoneW + safezoneX;
 y = 0.72 * safezoneH + safezoneY;
 w = 0.545811 * safezoneW;
 h = 0.04 * safezoneH;
 colorBackground[] = {0.063,0.071,0.098,0.3};
 colorActive[] = {0.863,0.078,0.235,1};
 };

 class DropKey : MCHU
 {
 idc = -1;
 text = "$STR_Keys_DropKey";
 onButtonClick = "[] spawn zero_fnc_WOD";
 x = 0.225 * safezoneW + safezoneX;
 y = 0.78 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
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

 class GiveKey : MCHU
 {
 idc = 2703;
 text = "$STR_Keys_GiveKey";
 onButtonClick = "[] call zero_fnc_vQc";
 x = 0.3625 * safezoneW + safezoneX;
 y = 0.78 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
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


 class schluessel: EPFMAm
 {
 idc = 1001;
 text = "Deine Schluessel:";
 x = 0.221523 * safezoneW + safezoneX;
 y = 0.191887 * safezoneH + safezoneY;
 w = 0.268163 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class refreshPlayer : MCHU
 {
 idc = -1;
 text = "$STR_pKey_Update";
 onButtonClick = "[] call zero_fnc_VgttB;";
 x = 0.510405 * safezoneW + safezoneX;
 y = 0.78 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
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

 class CloseButtonKey : MCHU
 {
 idc = -1;
 onButtonClick = "closeDialog 0;";
 x = 0.760866 * safezoneW + safezoneX;
 y = 0.125 * safezoneH + safezoneY;
 w = 0.0133688 * safezoneW;
 h = 0.026 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 colorDisabled[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,1};
 colorBackgroundFocused[] = {-1,-1,-1,0};
 colorBackground2[] = {-1,-1,-1,0};
 };

 class btn_home: MCHU
 {
 idc = 2404;
 x = 0.234609 * safezoneW + safezoneX;
 y = 0.118741 * safezoneH + safezoneY;
 w = 0.0721976 * safezoneW;
 h = 0.0440162 * safezoneH;
 tooltip = "$STR_PM_Haupt";
 onButtonClick = "closeDialog 0; closeDialog 0; [] spawn zero_fnc_IFXrAr";
 colorBackground[] = {0,0,0,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.192,0.549,0.906,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 };
 };
};
