class QLM
{
 name = "QLM";
 idd = 38200;
 fadein=0;
 duration = 99999999999;
 fadeout=0;
 movingEnable = 0;
 onLoad="uiNamespace setVariable ['QLM',_this select 0]";
 objects[]={};

 class controlsBackground
 {
 class background : EPFMAm
 {
 idc = -1;
 colorBackground[] = {0,0,0,0.8};
 x = 0.38140 * safezoneW + safezoneX;
 y = 0.06 * safezoneH + safezoneY;
 w = 0.65; h = 0.05;
 };
 class ProgressBar : JXoNTXt
 {
 idc = 38201;
 x = 0.38140 * safezoneW + safezoneX;
 y = 0.06 * safezoneH + safezoneY;
 w = 0.65; h = 0.05;
 };

 class ProgressText : EPFMAm
 {
 idc = 38202;
 text = "Servicing Chopper (50%)...";
 x = 0.386 * safezoneW + safezoneX;
 y = 0.0635 * safezoneH + safezoneY;
 w = 0.65; h = (1 / 25);
 };
 };
};

class AHt
{
 name = "AHt";
 idd = 38300;
 fadeIn = 1;
 duration = 99999999999;
 fadeout = 1;
 movingEnable = 0;
 onLoad = "uiNamespace setVariable['AHt',_this select 0]";
 objects[] = {};

 class controlsBackground
 {
 class TimerIcon : aAX
 {
 idc = -1;
 text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
 x = 0.00499997 * safezoneW + safezoneX;
 y = 0.291 * safezoneH + safezoneY;
 w = 0.04;
 h = 0.045;
 };

 class TimerText : EPFMAm
 {
 colorBackground[] = {0,0,0,0};
 idc = 38301;
 text = "";
 x = 0.0204688 * safezoneW + safezoneX;
 y = 0.2778 * safezoneH + safezoneY;
 w = 0.09125 * safezoneW;
 h = 0.055 * safezoneH;
 };
 };
};

class qztz
{
 name = "qztz";
 idd = 38400;
 fadeIn = 1;
 duration = 99999999999;
 fadeout = 1;
 movingEnable = 0;
 onLoad = "uiNamespace setVariable['qztz',_this select 0]";
 objects[] = {};

 class controlsBackground
 {
 class TimerText : ssussK
 {
 idc = 38401;
 text = "Du darfst erst in XX.XX Minuten zurück zum Todesort.";
 x = 0.234375 * safezoneW + safezoneX;
 y = 0.024 * safezoneH + safezoneY;
 w = 0.4675 * safezoneW;
 h = 0.034 * safezoneH;
 colorText[] = {1,0,0,1};
 colorBackground[] = {0.733,0.733,0.733,0.5};
 };
 };
};
