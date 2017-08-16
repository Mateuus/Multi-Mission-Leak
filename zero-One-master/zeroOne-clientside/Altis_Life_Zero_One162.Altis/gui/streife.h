class qORFSQ
{
 idd = 3400;
 name= "qORFSQ";
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

 class title_text: ssussK
 {
 idc = 3401;
 text = "";
 x = 0.221474 * safezoneW + safezoneX;
 y = 0.181118 * safezoneH + safezoneY;
 w = 0.54884 * safezoneW;
 h = 0.0549797 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,1};
 };

 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Streifen System";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };
 };

 class controls
 {
 class Streife_List_Title: ssussK
 {
 idc = 3402;
 sizeEx = 0.035;
 text = "";
 x = 0.221474 * safezoneW + safezoneX;
 y = 0.247093 * safezoneH + safezoneY;
 w = 0.257895 * safezoneW;
 h = 0.0439838 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,1};
 };
 class Streife_List_Description: ssussK
 {
 idc = 3406;
 sizeEx = 0.035;
 text = "";
 x = 0.221474 * safezoneW + safezoneX;
 y = 0.686931 * safezoneH + safezoneY;
 w = 0.257895 * safezoneW;
 h = 0.153943 * safezoneH;
 };
 class Member_List_Title: ssussK
 {
 idc = 3403;
 sizeEx = 0.035;
 text = "";
 x = 0.494843 * safezoneW + safezoneX;
 y = 0.247093 * safezoneH + safezoneY;
 w = 0.273368 * safezoneW;
 h = 0.0439838 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,1};
 };
 class Streife_List: ZaMJRapk
 {
 idc = 3404;
 sizeEx = 0.04;
 onMouseButtonDblClick = "call zero_fnc_bDqyjubCx;";
 onLBSelChanged = "call zero_fnc_HVhsHS;";
 x = 0.221473 * safezoneW + safezoneX;
 y = 0.302073 * safezoneH + safezoneY;
 w = 0.257895 * safezoneW;
 h = 0.373862 * safezoneH;
 colorSelect[] = {0,0,0,1};
 colorSelect2[] = {0,1,0,1};
 };
 class Member_List: ZaMJRapk
 {
 idc = 3405;
 sizeEx = 0.04;
 onMouseButtonDblClick = "call zero_fnc_yobyOxe";
 x = 0.494842 * safezoneW + safezoneX;
 y = 0.302073 * safezoneH + safezoneY;
 w = 0.273368 * safezoneW;
 h = 0.263903 * safezoneH;
 colorSelect[] = {0,0,0,1};
 colorSelect2[] = {0,1,0,1};
 };
 class Streife_Map: Cccrn
 {
 idc = 3407;
 maxSatelliteAlpha = 0.75;
 alphaFadeStartScale = 1.15;
 alphaFadeEndScale = 1.29;
 x = 0.494842 * safezoneW + safezoneX;
 y = 0.576972 * safezoneH + safezoneY;
 w = 0.273368 * safezoneW;
 h = 0.263903 * safezoneH;
 };
 class ButtonClose : MCHU
 {
 idc = -1;
 onButtonClick = "closeDialog 0;";
 x = 0.759295 * safezoneW + safezoneX;
 y = 0.125 * safezoneH + safezoneY;
 w = 0.0144786 * safezoneW;
 h = 0.026 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 colorDisabled[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,1};
 colorBackgroundFocused[] = {-1,-1,-1,0};
 colorBackground2[] = {-1,-1,-1,0};
 };
 class btn_home: MCHU
 {
 idc = -1;
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
 };
};
