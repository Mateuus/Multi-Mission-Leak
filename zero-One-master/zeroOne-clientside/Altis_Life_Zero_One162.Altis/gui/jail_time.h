class QRkRhOx
{
 idd = 26500;
 name = "QRkRhOx";
 movingEnabled = 0;
 enableSimulation = 1;

 class controlsBackground {
 class background : aAX
 {
 idc = -1;
 text = "Resources\Textures\Icons\interaction.jpg";
 x = 0.402589 * safezoneW + safezoneX;
 y = 0.27 * safezoneH + safezoneY;
 w = 0.188907 * safezoneW;
 h = 0.519 * safezoneH;
 };

 class trenn : ZaMJRapk
 {
 idc = -1;
 x = 0.412374 * safezoneW + safezoneX;
 y = 0.456 * safezoneH + safezoneY;
 w = 0.170098 * safezoneW;
 h = 0.0055 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };
 };

 class controls
 {

 class InfoMsg : ssussK
 {
 idc = 2601;
 sizeEx = 0.020;
 text = "$STR_Jail_Arrest_Time";
 x = 0.412374 * safezoneW + safezoneX;
 y = 0.379 * safezoneH + safezoneY;
 w = 0.170098 * safezoneW;
 h = 0.044 * safezoneH;
 };

 class moneyEdit : IkurrfNqo
 {
 idc = 1400;
 text = "15";
 sizeEx = 0.030;
 x = 0.412374 * safezoneW + safezoneX;
 y = 0.5 * safezoneH + safezoneY;
 w = 0.170098 * safezoneW;
 h = 0.044 * safezoneH;
 };

 class payTicket: MCHU
 {
 idc = 2402;
 text = "Ok";
 onButtonClick="[] spawn zero_fnc_NwAAdSTtT;";
 x = 0.412374 * safezoneW + safezoneX;
 y = 0.61 * safezoneH + safezoneY;
 w = 0.170098 * safezoneW;
 h = 0.044 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorDisabled[] = {0,0,0,0.4};
 class Attributes {
 align = "center";
 };
 };

 class CloseButtonKey : MCHU
 {
 idc = 2400;
 onButtonClick = "closeDialog 0;";
 x = 0.566765 * safezoneW + safezoneX;
 y = 0.284 * safezoneH + safezoneY;
 w = 0.0144981 * safezoneW;
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
