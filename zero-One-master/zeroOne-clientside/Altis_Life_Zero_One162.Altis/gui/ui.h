class vvFSSiaym
{
 idd=-1;
 movingEnable=0;
 fadein=0;
 duration = 99999999999999;
 fadeout=0;
 name="vvFSSiaym";
 onLoad="uiNamespace setVariable ['vvFSSiaym',_this select 0];";
 objects[]={};
 class controlsBackground
 {
 class RscControlsGroup_2300: ZKCZxrrxp
 {
 idc = -1;
 text = "";
 x = 0.9 * safezoneW + safezoneX;
 y = 0.8 * safezoneH + safezoneY;
 w = 0.0925 * safezoneW;
 h = 0.25 * safezoneH;
 class controls
 {
 class hud: aAX
 {
 idc = -1;
 text = "Resources\Textures\Icons\hud.paa";
 x = 0 * safezoneW;
 y = -4.17233e-008 * safezoneH;
 w = 0.0925 * safezoneW;
 h = 0.18 * safezoneH;
 };

 class waterText: EPFMAm
 {
 idc = 23505;
 text = "100";
 sizeEx = 0.04;
 x = 0.002349 * safezoneW;
 y = 0.0042 * safezoneH;
 w = 0.026 * safezoneW;
 h = 0.025 * safezoneH;
 colorBackground[] = {0.118,0.49,0.859,0.91};
 };
 class foodText: EPFMAm
 {
 idc = 23506;
 text = "100";
 sizeEx = 0.04;
 x = 0.002349 * safezoneW;
 y = 0.046 * safezoneH;
 w = 0.026 * safezoneW;
 h = 0.025 * safezoneH;
 colorBackground[] = {0.282,0.655,0.137,0.91};
 };
 class lebenText: EPFMAm
 {
 idc = 23507;
 text = "100";
 sizeEx = 0.04;
 x = 0.002349 * safezoneW;
 y = 0.089 * safezoneH;
 w = 0.026 * safezoneW;
 h = 0.025 * safezoneH;
 colorBackground[] = {0.863,0.078,0.188,0.91};
 };
 class ausdauerText: EPFMAm
 {
 idc = 23508;
 text = "100";
 sizeEx = 0.04;
 x = 0.002349 * safezoneW;
 y = 0.1325 * safezoneH;
 w = 0.026 * safezoneW;
 h = 0.025 * safezoneH;
 colorBackground[] = {1,0.776,0,0.91};
 };

 class water: JXoNTXt
 {
 idc = 23500;
 x = 0 * safezoneW;
 y = 0.032 * safezoneH;
 w = 0.0925 * safezoneW;
 h = 0.01 * safezoneH;
 colorbar[] = {0.118,0.49,0.859,0.91};
 colorFrame[] = {0,0,0,0};
 };
 class food: JXoNTXt
 {
 idc = 23501;
 x = 0 * safezoneW;
 y = 0.0745 * safezoneH;
 w = 0.0925 * safezoneW;
 h = 0.01 * safezoneH;
 colorbar[] = {0.282,0.655,0.137,0.91};
 colorFrame[] = {0,0,0,0};
 };
 class leben: JXoNTXt
 {
 idc = 23502;
 x = 0 * safezoneW;
 y = 0.117 * safezoneH;
 w = 0.0929 * safezoneW;
 h = 0.01 * safezoneH;
 colorbar[] = {0.863,0.078,0.188,0.91};
 colorFrame[] = {0,0,0,0};
 };
 class ausdauer: JXoNTXt
 {
 idc = 23503;
 x = 0 * safezoneW;
 y = 0.162 * safezoneH;
 w = 0.0925 * safezoneW;
 h = 0.01 * safezoneH;
 colorbar[] = {1,0.776,0,0.91};
 colorFrame[] = {0,0,0,0};
 };
 };
 };

 class Logo: aAX
 {
 idc = -1;
 text = "Resources\Textures\Icons\zero-one.paa";
 x = 0.00504147 * safezoneW + safezoneX;
 y = 0.895 * safezoneH + safezoneY;
 w = 0.159844 * safezoneW;
 h = 0.066 * safezoneH;
 };

 class PlayerID: EPFMAm
 {
 idc = 23504;
 text = "";
 sizeEx = 0.037;
 colorText[] = {1,1,1,0.45};
 x = 0.00504147 * safezoneW + safezoneX;
 y = 0.895 * safezoneH + safezoneY;
 w = 0.159844 * safezoneW;
 h = 0.165 * safezoneH;
 };
 };
};
