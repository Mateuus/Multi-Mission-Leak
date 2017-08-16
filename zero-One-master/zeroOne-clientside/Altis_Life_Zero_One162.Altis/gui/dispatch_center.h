class JeEED {
 idd = 4000;
 name= "JeEED";
 movingEnable = 0;
 enableSimulation = 1;
 onLoad = "[0] spawn zero_fnc_cNF;";

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


 class dispatchSearchbar: IkurrfNqo
 {
 idc = 4002;
 text = "";
 onKeyUp = "if(ctrlText 4002 != """") then {[0,6] call zero_fnc_ffrj;} else {[0,ncNQ] call zero_fnc_ffrj;};";
 tooltip = "$STR_CELL_Search_Tooltip";
 x = 0.221506 * safezoneW + safezoneX;
 y = 0.19207 * safezoneH + safezoneY;
 w = 0.139238 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class filter_tab_menu: nCAG
 {
 idc = 4003;
 tooltip = "$STR_PM_DispatchCenter_filter_tooltip";
 colorBackground[] = {0,0,0,0.7};
 onLBSelChanged = "_this call zero_fnc_ffrj";
 x = 0.221506 * safezoneW + safezoneX;
 y = 0.247059 * safezoneH + safezoneY;
 w = 0.139238 * safezoneW;
 h = 0.0330121 * safezoneH;
 };

 class DispatchList : ZaMJRapk
 {
 idc = 4004;
 text = "";
 sizeEx = 0.035;
 onLBSelChanged = "[_this] call zero_fnc_xKzXfq";
 x = 0.221506 * safezoneW + safezoneX;
 y = 0.290733 * safezoneH + safezoneY;
 w = 0.139238 * safezoneW;
 h = 0.539198 * safezoneH;
 };

 class show_selc_dispatch : uuiMHz
 {
 idc = 4015;
 x = 0.376233 * safezoneW + safezoneX;
 y = 0.61004 * safezoneH + safezoneY;
 w = 0.402244 * safezoneW;
 h = 0.220081 * safezoneH;

 class HScrollbar : HScrollbar
 {
 height = 0;
 };

 class controls
 {
 class drawDispatchText : ssussK {
 idc = 4005;
 text = "";
 sizeEx = 0.035;
 colorBackground[] = {0.28,0.28,0.28,0.28};
 shadow = 0;
 x = 0;
 y = 0;
 w = 0.983;
 h = 1.5;
 };
 };
 };

 class drawMap: Cccrn
 {
 idc = 4006;
 maxSatelliteAlpha = 0.75;
 alphaFadeStartScale = 1.15;
 alphaFadeEndScale = 1.29;
 x = 0.597996 * safezoneW + safezoneX;
 y = 0.1921 * safezoneH + safezoneY;
 w = 0.180494 * safezoneW;
 h = 0.396146 * safezoneH;
 };

 class senderName: EPFMAm
 {
 idc = 4007;
 colorBackground[] = {0,0,0,0.7};
 text = "";
 x = 0.376216 * safezoneW + safezoneX;
 y = 0.1921 * safezoneH + safezoneY;
 w = 0.216593 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class senderTime: EPFMAm
 {
 idc = 4008;
 colorBackground[] = {0,0,0,0.7};
 text = "";
 x = 0.376233 * safezoneW + safezoneX;
 y = 0.257911 * safezoneH + safezoneY;
 w = 0.216593 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class senderDitsance: EPFMAm
 {
 idc = 4009;
 colorBackground[] = {0,0,0,0.7};
 text = "";
 x = 0.376233 * safezoneW + safezoneX;
 y = 0.323935 * safezoneH + safezoneY;
 w = 0.216593 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class dispatchMapHandle: MCHU
 {
 idc = 4010;
 text = "";
 onButtonClick = "[] call zero_fnc_onBeTCLT;";
 x = 0.376233 * safezoneW + safezoneX;
 y = 0.378956 * safezoneH + safezoneY;
 w = 0.216593 * safezoneW;
 h = 0.0330121 * safezoneH;
 colorBackground[] = {0,0,0,1};
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

 class dispatchDelete: MCHU
 {
 idc = 4011;
 text = "$STR_PM_DispatchCenter_Delte";
 onButtonClick = "[] call zero_fnc_cJwmb;";
 x = 0.376233 * safezoneW + safezoneX;
 y = 0.422972 * safezoneH + safezoneY;
 w = 0.216593 * safezoneW;
 h = 0.0330121 * safezoneH;
 colorBackground[] = {0,0,0,1};
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

 class cost_message: IkurrfNqo
 {
 idc = 4016;
 text = "";
 x = 0.376233 * safezoneW + safezoneX;
 y = 0.466988 * safezoneH + safezoneY;
 w = 0.216593 * safezoneW;
 h = 0.0770283 * safezoneH;
 };

 class reply_dropdown: nCAG
 {
 idc = 4013;
 colorBackground[] = {0,0,0,0.7};
 x = 0.376233 * safezoneW + safezoneX;
 y = 0.55502 * safezoneH + safezoneY;
 w = 0.165023 * safezoneW;
 h = 0.0330121 * safezoneH;
 };

 class send_btn: MCHU
 {
 idc = 4014;
 text = "$STR_CELL_Send";
 x = 0.546413 * safezoneW + safezoneX;
 y = 0.55502 * safezoneH + safezoneY;
 w = 0.0464128 * safezoneW;
 h = 0.0330121 * safezoneH;
 onButtonClick = "[] call zero_fnc_ciiX;";
 colorBackground[] = {0,0,0,1};
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

 class closebtn: MCHU
 {
 idc = 4012;
 text = "$STR_Global_Close";
 onButtonClick = "closeDialog 0;";
 x = 0.762799 * safezoneW + safezoneX;
 y = 0.125642 * safezoneH + safezoneY;
 w = 0.013464 * safezoneW;
 h = 0.0260056 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.192,0.549,0.906,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0.0};
 class Attributes {
 align = "center";
 };
 };

 class btn_home: MCHU
 {
 idc = 2405;
 x = 0.230497 * safezoneW + safezoneX;
 y = 0.11772 * safezoneH + safezoneY;
 w = 0.0790564 * safezoneW;
 h = 0.0440272 * safezoneH;
 tooltip = "$STR_PM_Haupt";
 onButtonClick = "closeDialog 0; closeDialog 0; [] spawn zero_fnc_IFXrAr";
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.192,0.549,0.906,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0.0};
 class Attributes {
 align = "center";
 };
 };
 };
};
