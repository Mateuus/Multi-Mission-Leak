class AXA
{
 idd = 38500;
 movingEnabled = 0;
 enableSimulation = 1;

 class controlsBackground
 {
 class background: aAX
 {
 idc = 1201;
 text = "Resources\Textures\Icons\join.jpg";
 x = -2.45869e-008 * safezoneW + safezoneX;
 y = -1.63913e-008 * safezoneH + safezoneY;
 w = 1 * safezoneW;
 h = 1 * safezoneH;
 };

 class Title : nRBjiSC
 {
 colorBackground[] = {0,0,0,0};
 idc = -1;
 text = "$STR_Spawn_Title";
 x = 0.1 * safezoneW + safezoneX;
 y = 0.2 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
 h = 0.04 * safezoneH;

 class Attributes {
 align = "center";
 };
 };

 class SpawnPointTitle : Title
 {
 idc = 38501;
 style = 1;
 text = "";

 x = 0.4625 * safezoneW + safezoneX;
 y = 0.2 * safezoneH + safezoneY;
 w = 0.1625 * safezoneW;
 h = 0.04 * safezoneH;
 };

 class MapView : Cccrn
 {
 idc = 38502;
 x = 0.253139 * safezoneW + safezoneX;
 y = 0.26 * safezoneH + safezoneY;
 w = 0.375 * safezoneW;
 h = 0.54 * safezoneH;
 colorBackground[] = {0,0.467,0,0.4};
 maxSatelliteAlpha = 0.75;
 alphaFadeStartScale = 1.15;
 alphaFadeEndScale = 1.29;
 };
 };

 class controls
 {
 class SpawnPointList: CPmaa
 {
 idc = 38510;
 text = "";
 sizeEx = 0.041;
 coloumns[] = {0,0,0.9};
 drawSideArrows = 0;
 idcLeft = -1;
 idcRight = -1;
 rowHeight = 0.050;
 x = 0.100086 * safezoneW + safezoneX;
 y = 0.259912 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
 h = 0.48 * safezoneH;
 onLBSelChanged = "_this call zero_fnc_kdYpf;";
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.75,0.75,0.75,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorDisabled[] = {0,0,0,0};
 };

 class spawnButton : MCHU
 {
 idc = -1;
 text = "AUF DIE INSEL";
 onButtonClick = "[] call zero_fnc_hWuAePCSv;";
 x = 0.1 * safezoneW + safezoneX;
 y = 0.76 * safezoneH + safezoneY;
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

 class trenn: ZaMJRapk
 {
 idc = 1501;
 x = 0.236912 * safezoneW + safezoneX;
 y = 0.279001 * safezoneH + safezoneY;
 w = 0.00212538 * safezoneW;
 h = 0.504 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };
 };
};
