class jXih {

 idd = 4240;
 name= "jXih";
 movingEnabled = 0;
 enableSimulation = 0;
 onLoad = "[] spawn zero_fnc_lSlwIB;";

 class ControlsBackground
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

 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Bugtracker";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };
 
 class submitframe: cKK
 {
 idc = -1;
 x = 0.244051 * safezoneW + safezoneX;
 y = 0.786 * safezoneH + safezoneY;
 w = 0.510902 * safezoneW;
 h = 0.033 * safezoneH;
 };
 };

 class Controls
 {

 class home: MCHU
 {
 idc = -1;
 tooltip = "$STR_PM_Haupt";
 onButtonClick = "closeDialog 0; closeDialog 0; [] spawn zero_fnc_IFXrAr";
 x = 0.231143 * safezoneW + safezoneX;
 y = 0.116619 * safezoneH + safezoneY;
 w = 0.0773171 * safezoneW;
 h = 0.0440162 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.75,0.75,0.75,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
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

 class name_text: EPFMAm
 {
 idc = 4245;
 text = "Name:";
 x = 0.244128 * safezoneW + safezoneX;
 y = 0.22 * safezoneH + safezoneY;
 w = 0.0524866 * safezoneW;
 h = 0.042 * safezoneH;
 };

 class date_text: EPFMAm
 {
 idc = 4246;
 text = "Thema:";
 x = 0.244128 * safezoneW + safezoneX;
 y = 0.276 * safezoneH + safezoneY;
 w = 0.0852906 * safezoneW;
 h = 0.042 * safezoneH;
 };

 class email_text: EPFMAm
 {
 idc = 4247;
 text = "E-Mail für Nachfragen:";
 x = 0.244128 * safezoneW + safezoneX;
 y = 0.332 * safezoneH + safezoneY;
 w = 0.111534 * safezoneW;
 h = 0.042 * safezoneH;
 };

 class name_edit: IkurrfNqo
 {
 idc = 4241;
 text = "";
 x = 0.368784 * safezoneW + safezoneX;
 y = 0.22 * safezoneH + safezoneY;
 w = 0.387088 * safezoneW;
 h = 0.042 * safezoneH;
 };

 class title_edit: IkurrfNqo
 {
 idc = 4242;
 text = "";
 x = 0.368784 * safezoneW + safezoneX;
 y = 0.276 * safezoneH + safezoneY;
 w = 0.387088 * safezoneW;
 h = 0.042 * safezoneH;
 };

 class email_edit: IkurrfNqo
 {
 idc = 4243;
 text = "";
 x = 0.368784 * safezoneW + safezoneX;
 y = 0.332 * safezoneH + safezoneY;
 w = 0.387088 * safezoneW;
 h = 0.042 * safezoneH;
 };

 class description: EPFMAm
 {
 idc = 4248;
 text = "Beschreibung (Drücke SHIFT + ENTER für einen Absatz):";
 x = 0.244051 * safezoneW + safezoneX;
 y = 0.39 * safezoneH + safezoneY;
 w = 0.8 * safezoneW;
 h = 0.042 * safezoneH;
 };

 class description_edit: JVxVhsJvD
 {
 idc = 4244;
 text = "";
 x = 0.244128 * safezoneW + safezoneX;
 y = 0.4308 * safezoneH + safezoneY;
 w = 0.511744 * safezoneW;
 h = 0.3436 * safezoneH;
 };

 class submit: MCHU
 {
 idc = -1;
 text = "Absenden";
 onButtonClick = "[] spawn zero_fnc_fOlUWr;";
 x = 0.244051 * safezoneW + safezoneX;
 y = 0.786 * safezoneH + safezoneY;
 w = 0.510902 * safezoneW;
 h = 0.033 * safezoneH;
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
