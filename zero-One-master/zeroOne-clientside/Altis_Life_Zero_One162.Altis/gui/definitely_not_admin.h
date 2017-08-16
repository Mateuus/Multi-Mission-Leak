
class wEpyVwW {

 idd = 8000;
 name= "wEpyVwW";
 movingEnable = 0;
 enableSimulation = 1;
 onLoad = "[0] spawn zero_fnc_adminmenu;";

 class controlsBackground {

 class Background: aAX
 {
 idc = -1;
 text = "Resources\Textures\Icons\background.jpg";
 x = 0.215941 * safezoneW + safezoneX;
 y = 0.113221 * safezoneH + safezoneY;
 w = 0.566481 * safezoneW;
 h = 0.739284 * safezoneH;
 };

 class header: EPFMAm
 {
 idc = 8001;
 text = "ADMIN MENU";
 x = 0.304145 * safezoneW + safezoneX;
 y = 0.117804 * safezoneH + safezoneY;
 w = 0.443284 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class linker_trennstrich: ZaMJRapk
 {
 idc = -1;
 x = 0.365984 * safezoneW + safezoneX;
 y = 0.1883 * safezoneH + safezoneY;
 w = 0.00412358 * safezoneW;
 h = 0.660243 * safezoneH;
 colorBackground[] = {0.863,0.078,0.231,0.3};
 };

 class wagerechter_trennstrich: ZaMJRapk
 {
 idc = -1;
 x = 0.556699 * safezoneW + safezoneX;
 y = 0.687069 * safezoneH + safezoneY;
 w = 0.221642 * safezoneW;
 h = 0.011004 * safezoneH;
 colorBackground[] = {0.863,0.078,0.231,0.3};
 };

 class rechter_trennstrich: ZaMJRapk
 {
 idc = -1;
 x = 0.54639 * safezoneW + safezoneX;
 y = 0.1883 * safezoneH + safezoneY;
 w = 0.00412358 * safezoneW;
 h = 0.660243 * safezoneH;
 colorBackground[] = {0.863,0.078,0.231,0.3};
 };
 };

 class controls {

 class playersearch: IkurrfNqo
 {
 text = "";
 idc = 8002;
 sizeEx = 0.035;
 x = 0.221659 * safezoneW + safezoneX;
 y = 0.1883 * safezoneH + safezoneY;
 w = 0.139171 * safezoneW;
 h = 0.0440162 * safezoneH;
 onKeyUp = "if(ctrlText 8002 != """") then {[3] spawn zero_fnc_adminmenu;} else {[4] spawn zero_fnc_adminmenu;};";
 };

 class player_list: ZaMJRapk
 {
 idc = 8003;
 sizeEx = 0.035;
 x = 0.221659 * safezoneW + safezoneX;
 y = 0.235903 * safezoneH + safezoneY;
 w = 0.139171 * safezoneW;
 h = 0.605222 * safezoneH;
 };

 class action_list: ZaMJRapk
 {
 idc = 8004;
 sizeEx = 0.035;
 x = 0.376293 * safezoneW + safezoneX;
 y = 0.1883 * safezoneH + safezoneY;
 w = 0.164943 * safezoneW;
 h = 0.57221 * safezoneH;
 onMouseButtonDblClick = "[] spawn {disableSerialization; call compile (lbData[8004,lbCurSel 8004]);};";
 onLBSelChanged = "BSGXtfeRz = (_this select 1);";
 };

 class action_auswahl: nCAG
 {
 idc = 8005;
 onLBSelChanged = "[1] spawn zero_fnc_adminmenu; lnEQ = (_this select 1);";
 x = 0.376293 * safezoneW + safezoneX;
 y = 0.764097 * safezoneH + safezoneY;
 w = 0.164943 * safezoneW;
 h = 0.0220081 * safezoneH;
 };

 class action_submit: MCHU
 {
 text = "Ausführen";
 idc = 8006;
 x = 0.376293 * safezoneW + safezoneX;
 y = 0.797109 * safezoneH + safezoneY;
 w = 0.164943 * safezoneW;
 h = 0.0440162 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class tele_map: Cccrn
 {
 idc = 8007;
 maxSatelliteAlpha = 0.75;
 alphaFadeStartScale = 1.15;
 alphaFadeEndScale = 1.29;
 x = 0.556699 * safezoneW + safezoneX;
 y = 0.1883 * safezoneH + safezoneY;
 w = 0.221642 * safezoneW;
 h = 0.440162 * safezoneH;
 };

 class teleport_btn: MCHU
 {
 text = "Teleportieren";
 idc = 8008;
 x = 0.556699 * safezoneW + safezoneX;
 y = 0.632048 * safezoneH + safezoneY;
 w = 0.221642 * safezoneW;
 h = 0.0440162 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class btn_1: MCHU
 {
 text = "Costom1";
 idc = 8009;
 x = 0.556699 * safezoneW + safezoneX;
 y = 0.720081 * safezoneH + safezoneY;
 w = 0.103089 * safezoneW;
 h = 0.0330121 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class btn_2: MCHU
 {
 text = "Costom2";
 idc = 8010;
 x = 0.556699 * safezoneW + safezoneX;
 y = 0.764097 * safezoneH + safezoneY;
 w = 0.103089 * safezoneW;
 h = 0.0330121 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class btn_3: MCHU
 {
 text = "Costom3";
 idc = 8011;
 x = 0.556699 * safezoneW + safezoneX;
 y = 0.8113 * safezoneH + safezoneY;
 w = 0.103089 * safezoneW;
 h = 0.0330121 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class btn_4: MCHU
 {
 text = "Costom4";
 idc = 8012;
 x = 0.675252 * safezoneW + safezoneX;
 y = 0.720081 * safezoneH + safezoneY;
 w = 0.103089 * safezoneW;
 h = 0.0330121 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class btn_5: MCHU
 {
 text = "Costom5";
 idc = 8013;
 x = 0.675252 * safezoneW + safezoneX;
 y = 0.764097 * safezoneH + safezoneY;
 w = 0.103089 * safezoneW;
 h = 0.0330121 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class btn_6: MCHU
 {
 text = "Costom6";
 idc = 8014;
 x = 0.675252 * safezoneW + safezoneX;
 y = 0.8113 * safezoneH + safezoneY;
 w = 0.103089 * safezoneW;
 h = 0.0330121 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class close_btn: MCHU
 {
 onButtonClick = "closeDialog 0;";
 idc = -1;
 x = 0.761565 * safezoneW + safezoneX;
 y = 0.124738 * safezoneH + safezoneY;
 w = 0.0129271 * safezoneW;
 h = 0.0270049 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };
 };
};
