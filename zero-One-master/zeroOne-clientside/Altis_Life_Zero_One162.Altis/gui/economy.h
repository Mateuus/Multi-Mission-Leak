class fagJAcMW {

 name = "fagJAcMW";
 idd = 3000;
 movingEnable = 0;
 enableSimulation = 1;

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
 class RscFrame_1801: cKK
 {
 idc = -1;
 x = 0.221659 * safezoneW + safezoneX;
 y = 0.698073 * safezoneH + safezoneY;
 w = 0.551528 * safezoneW;
 h = 0.143053 * safezoneH;
 };
 class titel: ssussK
 {
 colorBackground[] = {"(missionNamespace getVariable ['ZO_GUI_BCG_RGB_R',0.706])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_G',0.075])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_B',0.216])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_A',1])"};
 idc = 3001;
 text = "";
 x = 0.221659 * safezoneW + safezoneX;
 y = 0.180883 * safezoneH + safezoneY;
 w = 0.551528 * safezoneW;
 h = 0.0550202 * safezoneH;
 };
 };
 class controls {

 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Marktpreise";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class priceList: ZaMJRapk
 {
 idc = 3002;
 sizeEx = 0.035;
 onLBSelChanged = "[] call zero_fnc_NLvhoMat";
 x = 0.221659 * safezoneW + safezoneX;
 y = 0.246907 * safezoneH + safezoneY;
 w = 0.154634 * safezoneW;
 h = 0.440162 * safezoneH;
 };
 class closeButton: MCHU
 {
 idc = -1;
 onButtonClick = "closeDialog 0;";
 x = 0.761823 * safezoneW + safezoneX;
 y = 0.124523 * safezoneH + safezoneY;
 w = 0.0144981 * safezoneW;
 h = 0.0290036 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.75,0.75,0.75,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 };
 class RscStructuredText_1106: ssussK
 {
 idc = 3003;
 text = "";
 x = 0.386572 * safezoneW + safezoneX;
 y = 0.246862 * safezoneH + safezoneY;
 w = 0.386585 * safezoneW;
 h = 0.143053 * safezoneH;
 };
 class RscStructuredText_1107: ssussK
 {
 idc = 3004;
 text = "";
 x = 0.386602 * safezoneW + safezoneX;
 y = 0.400964 * safezoneH + safezoneY;
 w = 0.386585 * safezoneW;
 h = 0.143053 * safezoneH;
 };
 class RscStructuredText_1108: ssussK
 {
 idc = 3005;
 text = "";
 x = 0.386602 * safezoneW + safezoneX;
 y = 0.55502 * safezoneH + safezoneY;
 w = 0.386585 * safezoneW;
 h = 0.132049 * safezoneH;
 };
 class event: ssussK
 {
 idc = 3006;
 text = "";
 x = 0.226813 * safezoneW + safezoneX;
 y = 0.709077 * safezoneH + safezoneY;
 w = 0.541219 * safezoneW;
 h = 0.121044 * safezoneH;
 };

 class home: MCHU
 {
 idc = -1;
 tooltip = "$STR_PM_Haupt";
 onButtonClick = "closeDialog 0; closeDialog 0; [] spawn zero_fnc_IFXrAr";
 x = 0.231143 * safezoneW + safezoneX;
 y = 0.116619 * safezoneH + safezoneY;
 w = 0.0773171 * safezoneW;
 h = 0.0440162 * safezoneH;
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
