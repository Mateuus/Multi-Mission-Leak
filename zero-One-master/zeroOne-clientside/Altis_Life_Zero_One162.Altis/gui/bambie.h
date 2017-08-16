class eTkaec {
 idd = 20000;
 name= "eTkaec";
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

 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "$STR_anf_hilfe";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class text_show: uuiMHz
 {
 idc = -1;
 x = 0.345359 * safezoneW + safezoneX;
 y = 0.181834 * safezoneH + safezoneY;
 w = 0.432995 * safezoneW;
 h = 0.660243 * safezoneH;

 class controls
 {
 class text_bambie: ssussK
 {
 idc = 20001;
 text = "$STR_Global_welcome";
 sizeEx = 0.035;
 colorBackground[] = {0.28,0.28,0.28,0};
 shadow = 0;
 x = 0;
 y = 0;
 w = 0.402995 * safezoneW;
 h = 2.5;
 };
 };
 };

 class btn_1: MCHU
 {
 idc = 20002;
 x = 0.226801 * safezoneW + safezoneX;
 y = 0.191887 * safezoneH + safezoneY;
 w = 0.103094 * safezoneW;
 h = 0.0440162 * safezoneH;
 text = "REGELN";
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class btn_7: MCHU
 {
 idc = 20003;
 x = 0.226801 * safezoneW + safezoneX;
 y = 0.522008 * safezoneH + safezoneY;
 w = 0.103094 * safezoneW;
 h = 0.0440162 * safezoneH;
 text = "STEUERUNG";
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
 idc = 20004;
 x = 0.226801 * safezoneW + safezoneX;
 y = 0.466988 * safezoneH + safezoneY;
 w = 0.103094 * safezoneW;
 h = 0.0440162 * safezoneH;
 text = "SPEICHERN";
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
 idc = 20005;
 x = 0.226801 * safezoneW + safezoneX;
 y = 0.411968 * safezoneH + safezoneY;
 w = 0.103094 * safezoneW;
 h = 0.0440162 * safezoneH;
 text = "LIZENZEN";
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
 idc = 20006;
 x = 0.226801 * safezoneW + safezoneX;
 y = 0.356947 * safezoneH + safezoneY;
 w = 0.103094 * safezoneW;
 h = 0.0440162 * safezoneH;
 text = "GELD VERDIENEN";
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
 idc = 20007;
 x = 0.226801 * safezoneW + safezoneX;
 y = 0.301927 * safezoneH + safezoneY;
 w = 0.103094 * safezoneW;
 h = 0.0440162 * safezoneH;
 text = "ILLEGALES";
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
 idc = 20008;
 x = 0.226801 * safezoneW + safezoneX;
 y = 0.246907 * safezoneH + safezoneY;
 w = 0.103094 * safezoneW;
 h = 0.0440162 * safezoneH;
 text = "SAFEZONE";
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class btn_10: MCHU
 {
 idc = 20012;
 x = 0.226801 * safezoneW + safezoneX;
 y = 0.687069 * safezoneH + safezoneY;
 w = 0.103094 * safezoneW;
 h = 0.0440162 * safezoneH;
 text = "BEWERBEN";
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class btn_9: MCHU
 {
 idc = 20009;
 x = 0.226801 * safezoneW + safezoneX;
 y = 0.632048 * safezoneH + safezoneY;
 w = 0.103094 * safezoneW;
 h = 0.0440162 * safezoneH;
 text = "CLANGRÜNDUNG";
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class btn_8: MCHU
 {
 idc = 20010;
 x = 0.226801 * safezoneW + safezoneX;
 y = 0.577028 * safezoneH + safezoneY;
 w = 0.103094 * safezoneW;
 h = 0.0440162 * safezoneH;
 text = "HAUSKAUF";
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class btn_11: MCHU
 {
 idc = 20011;
 x = 0.226801 * safezoneW + safezoneX;
 y = 0.742089 * safezoneH + safezoneY;
 w = 0.103094 * safezoneW;
 h = 0.0440162 * safezoneH;
 text = "SUPPORT";
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
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
 idc = -1;
 x = 0.230371 * safezoneW + safezoneX;
 y = 0.122163 * safezoneH + safezoneY;
 w = 0.0760931 * safezoneW;
 h = 0.0330766 * safezoneH;
 tooltip = "$STR_PM_Haupt";
 onButtonClick = "closeDialog 0; closeDialog 0; [] spawn zero_fnc_IFXrAr";
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.75,0.75,0.75,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 };

 };
};
