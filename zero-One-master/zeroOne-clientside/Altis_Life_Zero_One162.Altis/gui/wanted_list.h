class MSAB {
 idd = 2400;
 name= "MSAB";
 movingEnable = 0;
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


 class Title : nRBjiSC {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "$STR_Wanted_Title";
 x = 0.3036 * safezoneW + safezoneX;
 y = 0.122853 * safezoneH + safezoneY;
 w = 0.113448 * safezoneW;
 h = 0.0330121 * safezoneH;
 };

 class WantedList : ZaMJRapk
 {
 idc = 2401;
 text = "";
 sizeEx = 0.035;
 colorBackground[] = {0, 0, 0, 0};
 onLBSelChanged = "[] call zero_fnc_gGiKrlvly";

 x = 0.226693 * safezoneW + safezoneX;
 y = 0.224899 * safezoneH + safezoneY;
 w = 0.149545 * safezoneW;
 h = 0.550202 * safezoneH;
 };

 class WantedDetails : ZaMJRapk
 {
 idc = 2402;
 text = "";
 sizeEx = 0.035;
 colorBackground[] = {0, 0, 0, 0};

 x = 0.417492 * safezoneW + safezoneX;
 y = 0.224899 * safezoneH + safezoneY;
 w = 0.350658 * safezoneW;
 h = 0.550202 * safezoneH;
 };

 class BountyPrice : EPFMAm
 {
 idc = 2403;
 text = "";
 x = 0.598052 * safezoneW + safezoneX;
 y = 0.786105 * safezoneH + safezoneY;
 w = 0.170098 * safezoneW;
 h = 0.044 * safezoneH;
 class Attributes {
 align = "center";
 };
 };

 class trenn: ZaMJRapk
 {
 idc = -1;
 x = 0.395294 * safezoneW + safezoneX;
 y = 0.191888 * safezoneH + safezoneY;
 w = 0.00212538 * safezoneW;
 h = 0.616226 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
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
 class Attributes {
 align = "center";
 };
 };

 class PardonButtonKey : MCHU {
 idc = 2405;
 text = "$STR_Wanted_Pardon";
 onButtonClick = "[] call zero_fnc_CeESN; closeDialog 0;";
 x = 0.417492 * safezoneW + safezoneX;
 y = 0.786105 * safezoneH + safezoneY;
 w = 0.149545 * safezoneW;
 h = 0.0440162 * safezoneH;
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

 class UpdateButtonKey : MCHU {
 idc = -1;
 text = "$STR_NOTF_Garage_Update_Button";
 onButtonClick = "if(!isNil 'IbjHs' && servertime - IbjHs < 30) exitWith {hint localize 'STR_NOTF_Garage_Update';}; if(isNil 'IbjHs') then {IbjHs = servertime;}; IbjHs = servertime; [player] remoteExecCall ['zero_fnc_wantedFetch',2];";
 x = 0.226693 * safezoneW + safezoneX;
 y = 0.786105 * safezoneH + safezoneY;
 w = 0.149545 * safezoneW;
 h = 0.0440162 * safezoneH;
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
 };
};
