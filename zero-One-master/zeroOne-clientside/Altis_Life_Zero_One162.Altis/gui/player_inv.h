class cbEPsE {

 idd = 2001;
 movingEnable = 1;
 enableSimulation = 1;

 class controlsBackground {

 class Background: aAX
 {
 idc = -1;
 text = "Resources\Textures\Icons\player_inv.jpg";
 x = 0.215941 * safezoneW + safezoneX;
 y = 0.113221 * safezoneH + safezoneY;
 w = 0.566481 * safezoneW;
 h = 0.739284 * safezoneH;
 };

 class moneyStatusInfo : ssussK
 {
 idc = 2015;
 sizeEx = 0.7;
 text = "";
 x = 0.28538 * safezoneW + safezoneX;
 y = 0.25999 * safezoneH + safezoneY;
 w = 0.15967 * safezoneW;
 h = 0.130818 * safezoneH;
 };

 class PlayersName : EPFMAm
 {
 idc = 2009;
 style = 1;
 text = "";
 sizeEx = 0.040;
 x = 0.645975 * safezoneW + safezoneX;
 y = 0.11794 * safezoneH + safezoneY;
 w = 0.113398 * safezoneW;
 h = 0.0440162 * safezoneH;
 };
 };

 class controls {

 class Button_anfhilfe: MCHU
 {
 idc = 2401;
 x = 0.441474 * safezoneW + safezoneX;
 y = 0.197962 * safezoneH + safezoneY;
 w = 0.0846389 * safezoneW;
 h = 0.0279892 * safezoneH;
 onButtonClick = "closeDialog 0; [] spawn zero_fnc_rkereao;";
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class Button_wilkommen: MCHU
 {
 idc = 2402;
 x = 0.237368 * safezoneW + safezoneX;
 y = 0.197962 * safezoneH + safezoneY;
 w = 0.0752393 * safezoneW;
 h = 0.0279948 * safezoneH;
 onButtonClick = "";
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class button_hauptmenu: MCHU
 {
 idc = 2403;
 x = 0.332852 * safezoneW + safezoneX;
 y = 0.197954 * safezoneH + safezoneY;
 w = 0.088832 * safezoneW;
 h = 0.0270133 * safezoneH;
 onButtonClick = "closeDialog 0; createDialog ""jXih"";";
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class button_ausweis: MCHU
 {
 idc = 2480;
 x = 0.545393 * safezoneW + safezoneX;
 y = 0.197941 * safezoneH + safezoneY;
 w = 0.0851622 * safezoneW;
 h = 0.0280099 * safezoneH;
 onButtonClick = "closedialog 0; [] spawn zero_fnc_aLDqvh";
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class itemList : ZaMJRapk
 {
 idc = 2005;
 sizeEx = 0.04;
 x = 0.477803 * safezoneW + safezoneX;
 y = 0.296093 * safezoneH + safezoneY;
 w = 0.154683 * safezoneW;
 h = 0.31392 * safezoneH;
 colorBackground[] = {0.063,0.071,0.098,0.7};
 };

 class Licenses_Menu : uuiMHz
 {
 idc = -1;
 x = 0.680406 * safezoneW + safezoneX;
 y = 0.753 * safezoneH + safezoneY;
 w = 0.0979349 * safezoneW;
 h = 0.099 * safezoneH;

 class Controls
 {
 class ADaLE : ssussK
 {
 idc = 2014;
 sizeEx = 0.030;
 text = "Hausbesitzerlizenz";
 x = 0;
 y = 0;
 w = 0.23; h = 0.65;
 };
 };
 };

 class moneyEdit : IkurrfNqo
 {
 idc = 2018;

 text = "1";
 x = 0.235166 * safezoneW + safezoneX;
 y = 0.627006 * safezoneH + safezoneY;
 w = 0.207367 * safezoneW;
 h = 0.0380078 * safezoneH;
 colorBackground[] = {0.063,0.071,0.098,1};
 colorActive[] = {0,0,0,0};
 tooltip = "Geldbetrag oder Menge der Items eintragen";
 };

 class NearPlayers : nCAG
 {
 idc = 2022;
 x = 0.234843 * safezoneW + safezoneX;
 y = 0.573092 * safezoneH + safezoneY;
 w = 0.206855 * safezoneW;
 h = 0.0379234 * safezoneH;
 colorBackground[] = {0.063,0.071,0.098,0.3};
 colorActive[] = {0.863,0.078,0.235,1};
 };

 class moneyDrop : MCHU
 {
 idc = 2001;
 onButtonClick = "[] call zero_fnc_XKTsOgg";
 sizeEx = 0.025;
 x = 0.23664 * safezoneW + safezoneX;
 y = 0.682039 * safezoneH + safezoneY;
 w = 0.0770211 * safezoneW;
 h = 0.0309665 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 colorDisabled[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,1};
 colorBackgroundFocused[] = {-1,-1,-1,0};
 colorBackground2[] = {-1,-1,-1,0};
 };

 class refreshPalyer : MCHU
 {
 idc = -1;
 onButtonClick = "[] call zero_fnc_bTZyLfW;";
 x = 0.235782 * safezoneW + safezoneX;
 y = 0.426493 * safezoneH + safezoneY;
 w = 0.204616 * safezoneW;
 h = 0.0450266 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 colorDisabled[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,1};
 colorBackgroundFocused[] = {-1,-1,-1,0};
 colorBackground2[] = {-1,-1,-1,0};
 };

 class itemEdit : IkurrfNqo
 {
 idc = 2010;
 text = "1";
 x = 0.477595 * safezoneW + safezoneX;
 y = 0.626996 * safezoneH + safezoneY;
 w = 0.155856 * safezoneW;
 h = 0.0380036 * safezoneH;
 colorBackground[] = {0.063,0.071,0.098,1};
 colorActive[] = {0,0,0,0};
 tooltip = "Gebe die Anzahl der Items ein";
 };

 class DropButton : MCHU
 {

 idc = 2002;
 onButtonClick = "[] spawn zero_fnc_paG;";

 x = 0.365636 * safezoneW + safezoneX;
 y = 0.68207 * safezoneH + safezoneY;
 w = 0.0770211 * safezoneW;
 h = 0.0309666 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 colorDisabled[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,1};
 colorBackgroundFocused[] = {-1,-1,-1,0};
 colorBackground2[] = {-1,-1,-1,0};
 };

 class UseButton : MCHU
 {

 onButtonClick = "[] call zero_fnc_GgpJn;";

 x = 0.479677 * safezoneW + safezoneX;
 y = 0.683029 * safezoneH + safezoneY;
 w = 0.0644646 * safezoneW;
 h = 0.0299801 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.2};
 colorBackground2[] = {0.75,0.75,0.75,0.2};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};

 };

 class RemoveButton : MCHU
 {

 onButtonClick = "[] call zero_fnc_RTioxbQ;";
 x = 0.566101 * safezoneW + safezoneX;
 y = 0.683074 * safezoneH + safezoneY;
 w = 0.0644644 * safezoneW;
 h = 0.0299802 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.2};
 colorBackground2[] = {0.75,0.75,0.75,0.2};
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

 class ButtonAdminMenu : MCHU
 {
 idc = 2021;
 text = "$STR_PM_AdminMenu";
 onButtonClick = "closedialog 0; createDialog ""wEpyVwW"";";
 x = 0.654702 * safezoneW + safezoneX;
 y = 0.709077 * safezoneH + safezoneY;
 w = 0.118605 * safezoneW;
 h = 0.0220081 * safezoneH;
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

 class ButtonDispatchCenter : MCHU
 {
 idc = 2112;
 text = "$STR_PM_DispatchCenter";
 onButtonClick = "if(""ItemGPS"" in assignedItems player || ""B_UavTerminal"" in assignedItems player) then {closedialog 0; createDialog ""JeEED"";} else {hint localize ""STR_no_item_radio"";};";
 x = 0.649499 * safezoneW + safezoneX;
 y = 0.488996 * safezoneH + safezoneY;
 w = 0.128879 * safezoneW;
 h = 0.0330121 * safezoneH;
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

 class WantedMenuList : MCHU
 {
 idc = 2012;
 text = "Wanted List";
 onButtonClick = "closedialog 0; [] call zero_fnc_fJyqsFM";
 x = 0.649499 * safezoneW + safezoneX;
 y = 0.558029 * safezoneH + safezoneY;
 w = 0.128879 * safezoneW;
 h = 0.0330121 * safezoneH;
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

 class ButtonWantedAdd : MCHU
 {
 idc = 9800;
 text = "Wanted +";
 onButtonClick = "closedialog 0; createDialog ""RYUkJ"";";
 x = 0.649499 * safezoneW + safezoneX;
 y = 0.523008 * safezoneH + safezoneY;
 w = 0.128879 * safezoneW;
 h = 0.0330121 * safezoneH;
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

 class ButtonDesertedVehicle : MCHU
 {
 idc = 2016;
 text = "Verlassene Fzg";
 tooltip = "Zeigt verlassene Fahrzeuge auf der Karte";
 onButtonClick = "[] spawn zero_fnc_IyJvbez";
 x = 0.649889 * safezoneW + safezoneX;
 y = 0.59344 * safezoneH + safezoneY;
 w = 0.128879 * safezoneW;
 h = 0.0330121 * safezoneH;
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

 class ButtonStreifenSys : MCHU
 {
 idc = 2017;
 text = "Streifensystem";
 onButtonClick = "[] spawn zero_fnc_wzw";
 x = 0.649889 * safezoneW + safezoneX;
 y = 0.59344 * safezoneH + safezoneY;
 w = 0.128879 * safezoneW;
 h = 0.0330121 * safezoneH;
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

 class ButtonSettings : MCHU
 {
 idc = -1;
 onButtonClick = "closedialog 0; [] call zero_fnc_fcxl;";
 x = 0.649042 * safezoneW + safezoneX;
 y = 0.274904 * safezoneH + safezoneY;
 w = 0.131184 * safezoneW;
 h = 0.0450036 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class ButtonMyGang : MCHU
 {
 idc = 2011;
 onButtonClick = "if(((group player) getVariable ['HNCqyH',[]]) isEqualTo []) then {[] spawn zero_fnc_xODjDr} else {[] spawn zero_fnc_oJyWKRoog}";
 x = 0.649042 * safezoneW + safezoneX;
 y = 0.327467 * safezoneH + safezoneY;
 w = 0.131184 * safezoneW;
 h = 0.0450036 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };


 class ButtonKeys : MCHU
 {
 idc = 2013;
 onButtonClick = "closedialog 0; createDialog ""PjGnb"";";
 x = 0.649042 * safezoneW + safezoneX;
 y = 0.221349 * safezoneH + safezoneY;
 w = 0.131184 * safezoneW;
 h = 0.0450036 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class ButtonCell : MCHU
 {
 idc = 20010;
 onButtonClick = "if(""ItemGPS"" in assignedItems player || ""B_UavTerminal"" in assignedItems player) then { if(!(player getVariable [""surrender"", false]) && !(player getVariable [""GHdlZHW"", false])) then { closedialog 0; createDialog ""tuztucBtz"";} else { hint localize ""STR_Curr_Surrender""; } } else {hint localize ""STR_no_item_radio"";};";
 x = 0.649042 * safezoneW + safezoneX;
 y = 0.168788 * safezoneH + safezoneY;
 w = 0.131184 * safezoneW;
 h = 0.0450036 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };


 class ButtonSyncData : MCHU
 {
 idc = -1;
 onButtonClick = "[] call zero_fnc_cIoEAF;";
 x = 0.657152 * safezoneW + safezoneX;
 y = 0.639023 * safezoneH + safezoneY;
 w = 0.115843 * safezoneW;
 h = 0.0529885 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.2};
 colorBackground2[] = {0.75,0.75,0.75,0.2};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class button_playerinfo: MCHU
 {
 idc = 2413;
 x = 0.649042 * safezoneW + safezoneX;
 y = 0.379038 * safezoneH + safezoneY;
 w = 0.131184 * safezoneW;
 h = 0.0450036 * safezoneH;
 onButtonClick = "closedialog 0; [] call zero_fnc_ElsWgPPGN;";
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class button_marktpreis: MCHU
 {
 idc = 2414;
 x = 0.649114 * safezoneW + safezoneX;
 y = 0.432236 * safezoneH + safezoneY;
 w = 0.131184 * safezoneW;
 h = 0.0450036 * safezoneH;
 onButtonClick = "closeDialog 0; [] call zero_fnc_EUWU;";
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
