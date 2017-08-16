class cYI
{
 idd = 1000;
 name="cYI";
 movingEnabled = 0;
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
 };

 class controls {

 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Skillsystem";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class btn_home: MCHU
 {
 idc = 2404;
 x = 0.234609 * safezoneW + safezoneX;
 y = 0.118741 * safezoneH + safezoneY;
 w = 0.0721976 * safezoneW;
 h = 0.0440162 * safezoneH;
 tooltip = "$STR_PM_Haupt";
 onButtonClick = "closeDialog 0; closeDialog 0; [] spawn zero_fnc_IFXrAr";
 colorBackground[] = {0,0,0,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.192,0.549,0.906,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 };
 class category: ZaMJRapk
 {
 idc = 1002;
 sizeEx = 0.035;
 onLBSelChanged = "call zero_fnc_lDUaumZ;";
 x = 0.221537 * safezoneW + safezoneX;
 y = 0.225 * safezoneH + safezoneY;
 w = 0.113464 * safezoneW;
 h = 0.121044 * safezoneH;
 };
 class skillList: ZaMJRapk
 {
 idc = 1003;
 sizeEx = 0.035;
 onLBSelChanged = "call zero_fnc_yhjB;";
 x = 0.221474 * safezoneW + safezoneX;
 y = 0.35704 * safezoneH + safezoneY;
 w = 0.113448 * safezoneW;
 h = 0.253 * safezoneH;
 };
 class report: uuiMHz
 {
 x = 0.221513 * safezoneW + safezoneX;
 y = 0.621088 * safezoneH + safezoneY;
 w = 0.113448 * safezoneW;
 h = 0.176065 * safezoneH;

 class VScrollbar : VScrollbar {
 width = 0;
 };
 class controls {
 class showReport : ssussK {
 idc = 1004;
 text = "Beschreibung";
 sizeEx = 0.035;
 colorBackground[] = {0,0,0,0.7};
 shadow = 0;
 x = 0;
 y = 0;
 w = 0.113448 * safezoneW;
 h = 0.22 * safezoneH;
 };
 };
 };

 class currLevel: ssussK
 {
 idc = -1;
 text = "$STR_Skill_Curr_Level";
 x = 0.345291 * safezoneW + safezoneX;
 y = 0.178666 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0660243 * safezoneH;
 colorBackground[] = {0,0,0,0.7};
 class Attributes {
 align = "center";
 };
 };
 class showCurrLevel: ssussK
 {
 idc = 1005;
 text = "<t align='center' size='2'>0</t>";
 x = 0.524701 * safezoneW + safezoneX;
 y = 0.180883 * safezoneH + safezoneY;
 w = 0.252692 * safezoneW;
 h = 0.0660243 * safezoneH;
 colorBackground[] = {0,0,0,0.7};
 class Attributes {
 align = "center";
 };
 };
 class currPoints: ssussK
 {
 idc = -1;
 text = "$STR_Skill_Curr_Points";
 x = 0.345291 * safezoneW + safezoneX;
 y = 0.257891 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0660243 * safezoneH;
 colorBackground[] = {0,0,0,0.7};
 class Attributes {
 align = "center";
 };
 };

 class showCurrPoints: ssussK
 {
 idc = 1006;
 text = "<t align='center' size='2'>0</t>";
 x = 0.525785 * safezoneW + safezoneX;
 y = 0.257884 * safezoneH + safezoneY;
 w = 0.252692 * safezoneW;
 h = 0.0660243 * safezoneH;
 colorBackground[] = {0,0,0,0.7};
 class Attributes {
 align = "center";
 };
 };
 class neededPoints: ssussK
 {
 idc = -1;
 text = "$STR_Skill_Pkt_Left";
 x = 0.345291 * safezoneW + safezoneX;
 y = 0.334939 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0660243 * safezoneH;
 colorBackground[] = {0,0,0,0.7};
 class Attributes {
 align = "center";
 };
 };
 class showNeededPoints: ssussK
 {
 idc = 1007;
 text = "<t align='center' size='2'>0</t>";
 x = 0.525785 * safezoneW + safezoneX;
 y = 0.334912 * safezoneH + safezoneY;
 w = 0.252692 * safezoneW;
 h = 0.0660243 * safezoneH;
 colorBackground[] = {0,0,0,0.7};
 class Attributes {
 align = "center";
 };
 };

 class currAdvantages: ssussK
 {
 idc = 1008;
 text = "$STR_Skill_Curr_Advantage";
 x = 0.345277 * safezoneW + safezoneX;
 y = 0.477984 * safezoneH + safezoneY;
 w = 0.170172 * safezoneW;
 h = 0.319117 * safezoneH;
 colorBackground[] = {0,0,0,0.7};
 class Attributes {
 align = "center";
 };
 };
 class nextAdvantages: ssussK
 {
 idc = 1009;
 text = "$STR_Skill_Next_Advantage";
 x = 0.525823 * safezoneW + safezoneX;
 y = 0.477984 * safezoneH + safezoneY;
 w = 0.25268 * safezoneW;
 h = 0.319117 * safezoneH;
 colorBackground[] = {0,0,0,0.7};
 class Attributes {
 align = "center";
 };
 };
 class maxAdvantages: ssussK
 {
 idc = 1010;
 text = "Level 100 Vorteil";
 x = 0.345291 * safezoneW + safezoneX;
 y = 0.411968 * safezoneH + safezoneY;
 w = 0.433186 * safezoneW;
 h = 0.0550202 * safezoneH;
 colorBackground[] = {0,0,0,0.7};
 class Attributes {
 align = "center";
 };
 };
 class ButtonClose : MCHU
 {
 idc = -1;
 onButtonClick = "closeDialog 0;";
 x = 0.763223 * safezoneW + safezoneX;
 y = 0.129926 * safezoneH + safezoneY;
 w = 0.00933829 * safezoneW;
 h = 0.0190177 * safezoneH;
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
 class overviewButton: MCHU
 {
 idc = -1;
 text = "Übersicht";
 onButtonClick = "[] call zero_fnc_axx";
 x = 0.221537 * safezoneW + safezoneX;
 y = 0.808 * safezoneH + safezoneY;
 w = 0.113448 * safezoneW;
 h = 0.044 * safezoneH;
 colorBackground[] = {0,0,0,0};
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
 };
};
