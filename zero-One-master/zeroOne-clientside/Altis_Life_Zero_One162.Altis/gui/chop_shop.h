class Fsg
{
 idd = 39400;
 movingEnabled = 0;
 enableSimulation = 1;

 class controlsBackground
 {
 class background: aAX
 {
 idc = 1200;
 text = "Resources\Textures\Icons\interaction.jpg";
 x = 0.404 * safezoneW + safezoneX;
 y = 0.2692 * safezoneH + safezoneY;
 w = 0.188382 * safezoneW;
 h = 0.52 * safezoneH;
 };

 class Title : nRBjiSC
 {
 colorBackground[] = {0,0,0,0};
 idc = -1;
 text = "Fahrzeuge:";
 x = 0.45 * safezoneW + safezoneX;
 y = 0.34 * safezoneH + safezoneY;
 w = 0.1375 * safezoneW;
 h = 0.04 * safezoneH;
 };

 class priceInfo : ssussK
 {
 idc = 39401;
 text = "";
 sizeEx = 0.035;
 x = 0.410405 * safezoneW + safezoneX;
 y = 0.668 * safezoneH + safezoneY;
 w = 0.175 * safezoneW;
 h = 0.04 * safezoneH;
 };
 };

 class controls
 {
 class vehicleList : ZaMJRapk
 {
 idc = 39402;
 onLBSelChanged = "_this call zero_fnc_SywBIUpP";
 sizeEx = 0.04;
 x = 0.410405 * safezoneW + safezoneX;
 y = 0.38 * safezoneH + safezoneY;
 w = 0.175 * safezoneW;
 h = 0.28 * safezoneH;
 colorBackground[] = {0,0,0,0};
 };

 class BtnSell : MCHU
 {
 idc = -1;
 text = "$STR_Global_Sell";
 onButtonclick = "[] spawn zero_fnc_MShagNMMK;";
 x = 0.410405 * safezoneW + safezoneX;
 y = 0.716 * safezoneH + safezoneY;
 w = 0.175 * safezoneW;
 h = 0.04 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
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

 class BtnClose : MCHU
 {
 idc = -1;
 onButtonClick = "closeDialog 0";
 x = 0.56826 * safezoneW + safezoneX;
 y = 0.284 * safezoneH + safezoneY;
 w = 0.0145946 * safezoneW;
 h = 0.027 * safezoneH;
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
 };
};
