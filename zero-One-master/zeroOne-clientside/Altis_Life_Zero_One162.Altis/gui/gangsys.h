class XuOgQzcOU
{
 idd = 3100;
 name= "XuOgQzcOU";
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

 class title_text: EPFMAm
 {
 idc = -1;
 text = "Gang Erstellen";
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
 text = "Gang System";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };
 };

 class controls
 {
 class Info_text: ssussK
 {
 idc = 3102;
 sizeEx = 0.035;
 color[] = {0.95, 0.95, 0.95, 1};
 x = 0.221474 * safezoneW + safezoneX;
 y = 0.247093 * safezoneH + safezoneY;
 w = 0.263052 * safezoneW;
 h = 0.593781 * safezoneH;
 colorBackground[] = {0,0,0,0};
 };
 class Auswahl_menu: ZaMJRapk
 {
 idc = 3103;
 sizeEx = 0.04;
 onMouseButtonDblClick = "[] spawn zero_fnc_SIhwW;";
 x = 0.494842 * safezoneW + safezoneX;
 y = 0.247093 * safezoneH + safezoneY;
 w = 0.273368 * safezoneW;
 h = 0.593781 * safezoneH;
 colorSelect[] = {0,0,0,1};
 colorSelect2[] = {0,1,0,1};
 colorBackground[] = {0,0,0,0};
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

 };
};

class MDdjNKKV
{
 idd = 3200;
 name= "MDdjNKKV";
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

 class title : ssussK
 {
 idc = -1;
 text = "Gangsystem";
 x = 0.221474 * safezoneW + safezoneX;
 y = 0.181118 * safezoneH + safezoneY;
 w = 0.55147 * safezoneW;
 h = 0.0549797 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,1};
 };
 class Title1 : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Gang System";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };
 };
 class controls
 {
 class RscEdit_1400: IkurrfNqo
 {
 idc = 3201;
 text = "";
 x = 0.381369 * safezoneW + safezoneX;
 y = 0.478008 * safezoneH + safezoneY;
 w = 0.226947 * safezoneW;
 h = 0.0439838 * safezoneH;
 colorBackground[] = {0,0,0,0};
 };
 class RscStructuredText_1100: ssussK
 {
 idc = 3202;
 text = "";
 x = 0.381369 * safezoneW + safezoneX;
 y = 0.335061 * safezoneH + safezoneY;
 w = 0.226947 * safezoneW;
 h = 0.120955 * safezoneH;
 };
 class RscButtonMenu_2401: MCHU
 {
 idc = 3203;
 text = "Bestätigen";
 x = 0.381369 * safezoneW + safezoneX;
 y = 0.686931 * safezoneH + safezoneY;
 w = 0.226947 * safezoneW;
 h = 0.0439838 * safezoneH;
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
 class RscStructuredText_1101: ssussK
 {
 idc = 3204;
 text = "";
 x = 0.298843 * safezoneW + safezoneX;
 y = 0.543984 * safezoneH + safezoneY;
 w = 0.407473 * safezoneW;
 h = 0.120955 * safezoneH;
 };
 class RscButtonMenu_2400: MCHU
 {
 idc = 3205;
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
 class home: MCHU
 {
 idc = -1;
 tooltip = "Zurück";
 onButtonClick = "closeDialog 0;";
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
 };
};

class TWXCflNw
{
 idd = 3300;
 name= "TWXCflNw";
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
 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Gang System";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };
 };
 class controls
 {
 class RscStructuredText_1100: ssussK
 {
 idc = 3301;
 text = "";
 x = 0.221474 * safezoneW + safezoneX;
 y = 0.181118 * safezoneH + safezoneY;
 w = 0.55147 * safezoneW;
 h = 0.0549797 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,1};
 };
 class RscListbox_1500: ZaMJRapk
 {
 idc = 3302;
 sizeEx = 0.04;
 colorBackground[] = {-1,-1,-1,0};
 x = 0.221474 * safezoneW + safezoneX;
 y = 0.258089 * safezoneH + safezoneY;
 w = 0.550842 * safezoneW;
 h = 0.527805 * safezoneH;
 };
 class RscButtonMenu_2401: MCHU
 {
 idc = 3304;
 text = "";
 x = 0.221474 * safezoneW + safezoneX;
 y = 0.79689 * safezoneH + safezoneY;
 w = 0.242421 * safezoneW;
 h = 0.0439838 * safezoneH;
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
 class RscButtonMenu_2402: MCHU
 {
 idc = 3303;
 text = "";
 x = 0.530947 * safezoneW + safezoneX;
 y = 0.79689 * safezoneH + safezoneY;
 w = 0.242421 * safezoneW;
 h = 0.0439838 * safezoneH;
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
 class RscButtonMenu_2400: MCHU
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
 class home: MCHU
 {
 idc = -1;
 tooltip = "Zurück";
 onButtonClick = "closeDialog 0;";
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
 };
};
class huWR
{
 idd = 3400;
 name= "huWR";
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
 text = "Gang System";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };
 };

 class controls
 {
 class Player_List_Title: ssussK
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
 class Player_List_Description: ssussK
 {
 idc = 3406;
 sizeEx = 0.035;
 text = ""; 
 x = 0.221474 * safezoneW + safezoneX;
 y = 0.565975 * safezoneH + safezoneY;
 w = 0.257895 * safezoneW;
 h = 0.274899 * safezoneH;
 colorBackground[] = {0,0,0,0};
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
 class Player_List: ZaMJRapk
 {
 idc = 3404;
 sizeEx = 0.04;
 onMouseButtonDblClick = "[] spawn zero_fnc_xRiE;";
 x = 0.221473 * safezoneW + safezoneX;
 y = 0.302073 * safezoneH + safezoneY;
 w = 0.257895 * safezoneW;
 h = 0.252907 * safezoneH;
 colorSelect[] = {0,0,0,1};
 colorSelect2[] = {0,1,0,1};
 colorBackground[] = {0,0,0,0};
 };
 class Member_List: ZaMJRapk
 {
 idc = 3405;
 sizeEx = 0.04;
 onMouseButtonDblClick = "[] spawn zero_fnc_qQXuaB;";
 x = 0.494842 * safezoneW + safezoneX;
 y = 0.302073 * safezoneH + safezoneY;
 w = 0.273368 * safezoneW;
 h = 0.362866 * safezoneH;
 colorSelect[] = {0,0,0,1};
 colorSelect2[] = {0,1,0,1};
 colorBackground[] = {0,0,0,0};
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
 class Attributes {
 align = "center";
 };
 };
 class ButtonConfirm : MCHU
 {
 idc = 3410;
 text = "Änderungen übernehmen";
 onButtonClick = "[] spawn zero_fnc_JKJNbU;";
 x = 0.494842 * safezoneW + safezoneX;
 y = 0.79689 * safezoneH + safezoneY;
 w = 0.273368 * safezoneW;
 h = 0.0439838 * safezoneH;
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
 class ButtonChangeRank : MCHU
 {
 idc = 3407;
 text = "Rangändernung";
 onButtonClick = "[] spawn zero_fnc_mSWaWoNVw;";
 x = 0.494842 * safezoneW + safezoneX;
 y = 0.686931 * safezoneH + safezoneY;
 w = 0.128947 * safezoneW;
 h = 0.0439838 * safezoneH;
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
 class ButtonNachfolger : MCHU
 {
 idc = 3408;
 text = "Nachfolger";
 onButtonClick = "[] spawn zero_fnc_XdLx;";
 x = 0.494842 * safezoneW + safezoneX;
 y = 0.741911 * safezoneH + safezoneY;
 w = 0.128947 * safezoneW;
 h = 0.0439838 * safezoneH;
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
 class ButtonMaxMember : MCHU
 {
 idc = 3409;
 text = "Upgrade";
 onButtonClick = "[] spawn zero_fnc_dzHKdulZq;";
 x = 0.639263 * safezoneW + safezoneX;
 y = 0.686931 * safezoneH + safezoneY;
 w = 0.128947 * safezoneW;
 h = 0.0439838 * safezoneH;
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
 class ButtonOfflineMember : MCHU
 {
 idc = 3411;
 text = "Offline Member";
 onButtonClick = "[] spawn zero_fnc_pjQpbQp;";
 x = 0.639263 * safezoneW + safezoneX;
 y = 0.741911 * safezoneH + safezoneY;
 w = 0.128947 * safezoneW;
 h = 0.0439838 * safezoneH;
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
 class home: MCHU
 {
 idc = -1;
 tooltip = "Zurück";
 onButtonClick = "closeDialog 0;";
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
 };
};
class YUXmcy
{
 idd = 3100;
 name= "YUXmcy";
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
 idc = 3101;
 text = ""; 
 x = 0.221474 * safezoneW + safezoneX;
 y = 0.181118 * safezoneH + safezoneY;
 w = 0.55147 * safezoneW;
 h = 0.0549797 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,1};
 };
 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Gang System";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };
 };

 class controls
 {
 class verwaltung_description: ssussK
 {
 idc = 3102;
 sizeEx = 0.035;
 x = 0.221474 * safezoneW + safezoneX;
 y = 0.269085 * safezoneH + safezoneY;
 w = 0.273368 * safezoneW;
 h = 0.560793 * safezoneH;
 colorBackground[] = {0,0,0,0};
 };
 class auswahl_list: ZaMJRapk
 {
 idc = 3103;
 sizeEx = 0.04;
 onMouseButtonDblClick = "[] spawn zero_fnc_SIhwW;";
 x = 0.505158 * safezoneW + safezoneX;
 y = 0.269085 * safezoneH + safezoneY;
 w = 0.26821 * safezoneW;
 h = 0.285895 * safezoneH;
 colorSelect[] = {0,0,0,1};
 colorSelect2[] = {0,1,0,1};
 colorBackground[] = {0,0,0,0};
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
 class gang_info: ssussK
 {
 idc = 3104;
 sizeEx = 0.035;
 text = "";
 x = 0.505158 * safezoneW + safezoneX;
 y = 0.576972 * safezoneH + safezoneY;
 w = 0.26821 * safezoneW;
 h = 0.252907 * safezoneH;
 colorBackground[] = {0,0,0,0};
 };
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
 };
};
