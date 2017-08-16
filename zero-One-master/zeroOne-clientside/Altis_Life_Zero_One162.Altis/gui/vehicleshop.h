class IDozT
{
 idd = 2300;
 name="IDozT";
 movingEnabled = 0;
 enableSimulation = 1;

 class ControlsBackground
 {
 class backgorund: aAX
 {
 idc = 2301;
 text = "Resources\Textures\Images\Fahrzeugshop_default.jpg";
 x = 0.0101566 * safezoneW + safezoneX;
 y = 0.049 * safezoneH + safezoneY;
 w = 0.242344 * safezoneW;
 h = 0.891 * safezoneH;
 };
 
 class prozesssbar: JXoNTXt
 {
 idc = 2305;
 text = "#(argb,8,8,3)color(1,1,1,1)";
 x = 0.0204687 * safezoneW + safezoneX;
 y = 0.1238 * safezoneH + safezoneY;
 w = 0.221719 * safezoneW;
 h = 0.044 * safezoneH;
 };
 };

 class Controls
 {
 class close: MCHU
 {
 idc = 2302;
 x = 0.228802 * safezoneW + safezoneX;
 y = 0.0609259 * safezoneH + safezoneY;
 w = 0.0141666 * safezoneW;
 h = 0.0272221 * safezoneH;
 action = "closeDialog 0; PntTYvdvD = false;";
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.75,0.75,0.75,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 };
 
 class next: MCHU
 {
 idc = 2303;
 x = 0.17 * safezoneW + safezoneX;
 y = 0.874 * safezoneH + safezoneY;
 w = 0.0734375 * safezoneW;
 h = 0.044815 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.75,0.75,0.75,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 };
 
 class back: MCHU
 {
 idc = 2304;
 x = 0.0208329 * safezoneW + safezoneX;
 y = 0.877778 * safezoneH + safezoneY;
 w = 0.0723958 * safezoneW;
 h = 0.0411112 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.75,0.75,0.75,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 };
 
 class prozesssbarText: ssussK
 {
 idc = 2306;
 text = "";
 x = 0.0204687 * safezoneW + safezoneX;
 y = 0.1338 * safezoneH + safezoneY;
 w = 0.221719 * safezoneW;
 h = 0.044 * safezoneH;
 };
 
 class trennung: ZaMJRapk
 {
 idc = -1;
 x = 0.0204687 * safezoneW + safezoneX;
 y = 0.236 * safezoneH + safezoneY;
 w = 0.221719 * safezoneW;
 h = 0.0055 * safezoneH;
 colorBackground[] = {0.863,0.078,0.231,0.3};
 };
 
 class mietpreistext: ssussK
 {
 idc = 2307;
 text = "";
 x = 0.0172687 * safezoneW + safezoneX;
 y = 0.1775 * safezoneH + safezoneY;
 w = 0.113437 * safezoneW;
 h = 0.022 * safezoneH;
 };
 
 class mitpreis: ssussK
 {
 idc = 2308;
 text = "";
 x = 0.133906 * safezoneW + safezoneX;
 y = 0.1775 * safezoneH + safezoneY;
 w = 0.108281 * safezoneW;
 h = 0.022 * safezoneH;
 };
 
 class AuswahlFahrzeugTypundFahrzeug: ZaMJRapk
 {
 idc = 2309;
 x = 0.0204692 * safezoneW + safezoneX;
 y = 0.247 * safezoneH + safezoneY;
 w = 0.221719 * safezoneW;
 h = 0.3146 * safezoneH;
 sizeEx = 0.04;
 onLBSelChanged = "[] spawn zero_fnc_wmkqG;";
 };
 
 class Beschreibung: ssussK
 {
 idc = 2310;
 text = "";
 x = 0.0204687 * safezoneW + safezoneX;
 y = 0.5836 * safezoneH + safezoneY;
 w = 0.221719 * safezoneW;
 h = 0.278 * safezoneH;
 };
 
 class AuswahlFahrzeugSkinUndEffekt: ZaMJRapk
 {
 idc = 2311;
 x = 0.0204688 * safezoneW + safezoneX;
 y = 0.247 * safezoneH + safezoneY;
 w = 0.221719 * safezoneW;
 h = 0.594 * safezoneH;
 sizeEx = 0.04;
 onLBSelChanged = "[] spawn zero_fnc_wmkqG;";
 };
 
 class kaufBericht: EPFMAm
 {
 idc = 2312;
 text = "";
 x = 0.0204687 * safezoneW + safezoneX;
 y = 0.247 * safezoneH + safezoneY;
 w = 0.221719 * safezoneW;
 h = 0.594 * safezoneH;
 };

 class trennung2: ZaMJRapk
 {
 idc = 2313;
 x = 0.0201565 * safezoneW + safezoneX;
 y = 0.56897 * safezoneH + safezoneY;
 w = 0.221719 * safezoneW;
 h = 0.0055 * safezoneH;
 colorBackground[] = {0.863,0.078,0.231,0.3};
 };

 class kaufpreistext: ssussK
 {
 idc = 2314;
 text = "";
 x = 0.0173958 * safezoneW + safezoneX;
 y = 0.203 * safezoneH + safezoneY;
 w = 0.113437 * safezoneW;
 h = 0.022 * safezoneH;
 };

 class kaufpreis: ssussK
 {
 idc = 2315;
 text = "";
 x = 0.133906 * safezoneW + safezoneX;
 y = 0.203 * safezoneH + safezoneY;
 w = 0.108281 * safezoneW;
 h = 0.022 * safezoneH;
 };
 };
};

