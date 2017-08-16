class QgCNT {

 idd = 23423;
 movingEnable = 1;
 enableSimulation = 1;
 fadeout = 1;

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

 class inside_welcome: ssussK
 {
 idc = 1100;
 text = "$STR_Global_willkommen";
 colorBackground[] = {0.28,0.28,0.28,0};
 shadow = 0;
 x = 0.222689 * safezoneW + safezoneX;
 y = 0.181 * safezoneH + safezoneY;
 w = 0.550481 * safezoneW;
 h = 0.649 * safezoneH;
 };

 class btn_close: MCHU
 {
 idc = 2400;
 onButtonClick = "closeDialog 0;";
 x = 0.759697 * safezoneW + safezoneX;
 y = 0.126192 * safezoneH + safezoneY;
 w = 0.0139725 * safezoneW;
 h = 0.0259798 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.2};
 colorBackground2[] = {0.75,0.75,0.75,0.2};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class btn_home: MCHU
 {
 idc = 2402;
 x = 0.230371 * safezoneW + safezoneX;
 y = 0.122163 * safezoneH + safezoneY;
 w = 0.0760931 * safezoneW;
 h = 0.0330766 * safezoneH;
 tooltip = "$STR_PM_Haupt";
 onButtonClick = "closeDialog 0; closeDialog 0; [] spawn zero_fnc_IFXrAr";
 colorBackground[] = {-1,-1,-1,0};
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
