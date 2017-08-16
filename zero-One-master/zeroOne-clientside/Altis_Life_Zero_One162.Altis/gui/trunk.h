class YpvzMtOcv
{
 idd = 3100;
 name= "YpvzMtOcv";
 movingEnabled = 0;
 enableSimulation = 1;

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

 class title_text: EPFMAm
 {
 idc = -1;
 text = "";
 x = 0.227101 * safezoneW + safezoneX;
 y = 0.175016 * safezoneH + safezoneY;
 w = 0.3625 * safezoneW;
 h = 0.04 * safezoneH;
 colorBackground[] = {0,0,0,0};
 };

 class mengebg : EPFMAm
 {
 idc = -1;
 text = "";
 colorBackground[] = {0,0,0,0};
 x = 0.593707 * safezoneW + safezoneX;
 y = 0.175016 * safezoneH + safezoneY;
 w = 0.175 * safezoneW;
 h = 0.04 * safezoneH;
 };
 };

 class controls
 {

 class Anzahl_Menge: ssussK
 {
 idc = 3105;
 text = "";
 color[] = {0.95, 0.95, 0.95, 1};
 sizeEx = 0.015*safezoneH;
 x = 0.226813 * safezoneW + safezoneX;
 y = 0.181078 * safezoneH + safezoneY;
 w = 0.546374 * safezoneW;
 h = 0.0439893 * safezoneH;
 };
 class Fahrzeug_items: ZaMJRapk
 {
 idc = 3102;
 sizeEx = 0.035;
 color[] = {0.95, 0.95, 0.95, 1};
 onLBSelChanged = "_this call zero_fnc_CcwpEIM;";
 onMouseButtonDblClick = "[] call zero_fnc_ATczudu;";
 x = 0.230122 * safezoneW + safezoneX;
 y = 0.219001 * safezoneH + safezoneY;
 w = 0.250524 * safezoneW;
 h = 0.52 * safezoneH;
 colorSelect[] = {0,0,0,1};
 colorSelect2[] = {0,1,0,1};
 };

 class Spieler_items: ZaMJRapk
 {
 idc = 3103;
 sizeEx = 0.035;
 color[] = {0.95, 0.95, 0.95, 1};
 onLBSelChanged = "_this call zero_fnc_CcwpEIM;";
 onMouseButtonDblClick = "[] call zero_fnc_ATczudu;";
 x = 0.521322 * safezoneW + safezoneX;
 y = 0.219001 * safezoneH + safezoneY;
 w = 0.25 * safezoneW;
 h = 0.52 * safezoneH;
 colorSelect[] = {0,0,0,1};
 colorSelect2[] = {0,1,0,1};
 };

 class trenn: ZaMJRapk
 {
 idc = 1500;
 x = 0.5003 * safezoneW + safezoneX;
 y = 0.201998 * safezoneH + safezoneY;
 w = 0.00212358 * safezoneW;
 h = 0.62 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };

 class menge : IkurrfNqo
 {
 idc = 3106;
 text = "1";
 sizeEx = 0.030;
 x = 0.520811 * safezoneW + safezoneX;
 y = 0.76 * safezoneH + safezoneY;
 w = 0.251571 * safezoneW;
 h = 0.0390007 * safezoneH;
 colorBackground[] = {0,0,0,0};
 };

 class ButtonBuySell : MCHU
 {
 idc = 3104;
 text = "Umlagern";
 onButtonClick = "[] call zero_fnc_ATczudu;";
 x = 0.22956 * safezoneW + safezoneX;
 y = 0.759026 * safezoneH + safezoneY;
 w = 0.251571 * safezoneW;
 h = 0.0390007 * safezoneH;
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

 class ButtonClose : MCHU
 {
 idc = -1;
 onButtonClick = "closeDialog 0;";
 x = 0.761963 * safezoneW + safezoneX;
 y = 0.123738 * safezoneH + safezoneY;
 w = 0.013551 * safezoneW;
 h = 0.0289943 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 };
 };
};
