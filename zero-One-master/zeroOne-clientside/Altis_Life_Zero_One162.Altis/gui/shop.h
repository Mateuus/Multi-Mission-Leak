class GoS
{
 idd = 3100;
 name= "GoS";
 movingEnabled = 0;
 enableSimulation = 1;

 class controlsBackground
 {
 class Background: aAX
 {
 idc = -1;
 text = "Resources\Textures\Icons\background.jpg";
 x = 0.215941 * safezoneW + safezoneX;
 y = 0.113221 * safezoneH + safezoneY;
 w = 0.566481 * safezoneW;
 h = 0.739284 * safezoneH;
 };
 class menge: EPFMAm
 {
 idc = -1;
 text = "Menge :";
 x = 0.456752 * safezoneW + safezoneX;
 y = 0.72 * safezoneH + safezoneY;
 w = 0.0412358 * safezoneW;
 h = 0.055 * safezoneH;
 };
 class trenn : ZaMJRapk
 {
 idc = -1;
 x = 0.442695 * safezoneW + safezoneX;
 y = 0.179 * safezoneH + safezoneY;
 w = 0.00212358 * safezoneW;
 h = 0.594 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };
 class trenn2 : ZaMJRapk
 {
 idc = 1502;
 x = 0.221659 * safezoneW + safezoneX;
 y = 0.786 * safezoneH + safezoneY;
 w = 0.55467 * safezoneW;
 h = 0.0035 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };
 class trenn3 : ZaMJRapk
 {
 idc = 1502;
 x = 0.442777 * safezoneW + safezoneX;
 y = 0.802 * safezoneH + safezoneY;
 w = 0.00212358 * safezoneW;
 h = 0.033 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };
 };

 class controls
 {
 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = 3101;
 text = "";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class clothing_items: ZaMJRapk
 {
 idc = 3102;
 sizeEx = 0.035;
 onLBSelChanged = "[_this] call zero_fnc_QZL;";
 x = 0.458762 * safezoneW + safezoneX;
 y = 0.189864 * safezoneH + safezoneY;
 w = 0.314423 * safezoneW;
 h = 0.484 * safezoneH;
 colorBackground[] = {0,0,0,0};
 };
 class shop_selection_type: nCAG
 {
 idc = 3103;
 onLBSelChanged = "_this call zero_fnc_mbmMxb";
 x = 0.458764 * safezoneW + safezoneX;
 y = 0.687 * safezoneH + safezoneY;
 w = 0.314423 * safezoneW;
 h = 0.033 * safezoneH;
 colorBackground[] = {0.863,0.078,0.231,0};
 };
 class ButtonBuySell : MCHU
 {
 idc = 3104;
 text = "$STR_Global_Buy";
 onButtonClick = "if(!isNil 'IbjHs' && servertime - IbjHs < 1) exitWith {hint localize 'STR_NOTF_Buy_Virt_Stop';}; if(isNil 'IbjHs') then {IbjHs = servertime;}; IbjHs = servertime; [false] call zero_fnc_cypHXUcvl;";
 x = 0.226813 * safezoneW + safezoneX;
 y = 0.808 * safezoneH + safezoneY;
 w = 0.0927805 * safezoneW;
 h = 0.033 * safezoneH;
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

 class ButtonBuyGang : MCHU
 {
 idc = 3110;
 text = "Gang kaufen";
 onButtonClick = "[true] call zero_fnc_cypHXUcvl;";
 x = 0.325 * safezoneW + safezoneX;
 y = 0.808 * safezoneH + safezoneY;
 w = 0.0927805 * safezoneW;
 h = 0.033 * safezoneH;
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
 x = 0.75993 * safezoneW + safezoneX;
 y = 0.124113 * safezoneH + safezoneY;
 w = 0.0129271 * safezoneW;
 h = 0.028 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.192,0.549,0.906,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 class Attributes {
 align = "center";
 };
 };
 class RscText_1001: ssussK
 {
 idc = 3105;
 text = "";
 sizeEx = 0.015*safezoneH;
 x = 0.45361 * safezoneW + safezoneX;
 y = 0.797 * safezoneH + safezoneY;
 w = 0.319577 * safezoneW;
 h = 0.044 * safezoneH;
 };
 class vasText : nCAG
 {
 idc = 3108;
 onLBSelChanged = "[] call zero_fnc_TvxlnVKLX;";
 x = 0.5 * safezoneW + safezoneX;
 y = 0.731 * safezoneH + safezoneY;
 w = 0.0515447 * safezoneW;
 h = 0.033 * safezoneH;
 colorBackground[] = {0.863,0.078,0.231,0};
 };
 class bild: aAX
 {
 idc = 3109;
 text = "#(argb,8,8,3)color(1,1,1,1)";
 x = 0.226811 * safezoneW + safezoneX;
 y = 0.269101 * safezoneH + safezoneY;
 w = 0.201024 * safezoneW;
 h = 0.418 * safezoneH;
 };
 };
};
