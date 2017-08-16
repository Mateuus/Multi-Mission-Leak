class tuztucBtz {
 idd = 3000;
 name= "tuztucBtz";
 movingEnable = 0;
 enableSimulation = 1;
 onLoad = "[0] spawn zero_fnc_rrEYhtDV";

 class controlsBackground {

 class Background: aAX
 {
 idc = 1200;
 text = "Resources\Textures\Icons\background.jpg";
 x = 0.214633 * safezoneW + safezoneX;
 y = 0.113195 * safezoneH + safezoneY;
 w = 0.566586 * safezoneW;
 h = 0.746476 * safezoneH;
 };
 };

 class controls {

 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Messenger";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class player_search: IkurrfNqo
 {
 idc = 3001;
 tooltip = "$STR_CELL_Search_Tooltip";
 text = "";
 x = 0.221659 * safezoneW + safezoneX;
 y = 0.192 * safezoneH + safezoneY;
 w = 0.164943 * safezoneW;
 h = 0.033 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {-1,-1,-1,0};
 colorBackground2[] = {-1,-1,-1,0};
 onKeyUp = "[] call zero_fnc_rdARDs;";
 };

 class player_list: ZaMJRapk
 {
 idc = 3002;
 sizeEx = 0.035;
 x = 0.221659 * safezoneW + safezoneX;
 y = 0.236 * safezoneH + safezoneY;
 w = 0.164943 * safezoneW;
 h = 0.561 * safezoneH;
 onLBSelChanged = "[] call zero_fnc_sfeEfBSd;";
 };

 class refresh_btn: MCHU
 {
 idc = 3009;
 tooltip = "$STR_CELL_Refresh_Tooltip";
 text = "$STR_Global_Refresh";
 x = 0.221659 * safezoneW + safezoneX;
 y = 0.808012 * safezoneH + safezoneY;
 w = 0.164943 * safezoneW;
 h = 0.033 * safezoneH;
 colorBackground[] = {0,0,0,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 onButtonClick = "[] call zero_fnc_oFo; [1] call zero_fnc_rrEYhtDV;";

 class Attributes {
 align = "center";
 };
 };

 class inbox_title: EPFMAm
 {
 idc = -1;
 text = "$STR_CELL_Messages";
 x = 0.40722 * safezoneW + safezoneX;
 y = 0.203 * safezoneH + safezoneY;
 w = 0.365967 * safezoneW;
 h = 0.022 * safezoneH;
 colorBackground[] = {0.863,0.078,0.231,0.3};
 };

 class msg_listbox: ZaMJRapk
 {
 idc = 3006;
 sizeEx = 0.035;
 x = 0.40722 * safezoneW + safezoneX;
 y = 0.236 * safezoneH + safezoneY;
 w = 0.365967 * safezoneW;
 h = 0.121 * safezoneH;
 onLBSelChanged = "[] call zero_fnc_Eea;";
 };

 class show_msg_title: EPFMAm
 {
 idc = -1;
 text = "$STR_CELL_Message_title";
 x = 0.407192 * safezoneW + safezoneX;
 y = 0.368036 * safezoneH + safezoneY;
 w = 0.314423 * safezoneW;
 h = 0.022 * safezoneH;
 colorBackground[] = {0.863,0.078,0.231,0.3};
 };

 class Delte_btn: MCHU
 {
 idc = -1;
 tooltip = "$STR_CELL_Delete_Tooltip";
 text = "$STR_Cell_Delte";
 x = 0.726797 * safezoneW + safezoneX;
 y = 0.368 * safezoneH + safezoneY;
 w = 0.0463902 * safezoneW;
 h = 0.022 * safezoneH;
 colorBackground[] = {0.192,0.549,0.906,1};
 onButtonClick = "[] call zero_fnc_gqDzDxGD";

 class Attributes {
 align = "center";
 };
 };

 class show_selc_msg : uuiMHz
 {
 x = 0.40722 * safezoneW + safezoneX;
 y = 0.401 * safezoneH + safezoneY;
 w = 0.365967 * safezoneW;
 h = 0.286 * safezoneH;
 class HScrollbar : HScrollbar
 {
 height = 0;
 };
 class controls
 {
 class showMSG : ssussK
 {
 idc = 3008;
 text = "";
 sizeEx = 0.035;
 colorBackground[] = {0.28,0.28,0.28,0.28};
 shadow = 0;
 x = 0;
 y = 0;
 w = 0.355967 * safezoneW;
 h = 1.5;
 };
 };
 };

 class new_message_title: EPFMAm
 {
 idc = -1;
 text = "$STR_CELL_Title_Edit";
 x = 0.40722 * safezoneW + safezoneX;
 y = 0.698 * safezoneH + safezoneY;
 w = 0.365967 * safezoneW;
 h = 0.022 * safezoneH;
 colorBackground[] = {0.863,0.078,0.231,0.3};
 };

 class message_edit: IkurrfNqo
 {
 idc = 3003;
 text = "";
 x = 0.40722 * safezoneW + safezoneX;
 y = 0.730979 * safezoneH + safezoneY;
 w = 0.365967 * safezoneW;
 h = 0.066 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {-1,-1,-1,0};
 colorBackground2[] = {-1,-1,-1,0};
 };

 class position_toggle_text: EPFMAm
 {
 idc = 3007;
 text = "Position Senden";
 x = 0.40722 * safezoneW + safezoneX;
 y = 0.808 * safezoneH + safezoneY;
 w = 0.0927805 * safezoneW;
 h = 0.033 * safezoneH;
 colorBackground[] = {0,0,0,0};
 tooltip = "$STR_CELL_Pos_Tooltip";
 };


 class position_toggle: ryeG
 {
 idc = 3004;
 x = 0.5 * safezoneW + safezoneX;
 y = 0.808 * safezoneH + safezoneY;
 w = 0.0206235 * safezoneW;
 h = 0.0329893 * safezoneH;
 tooltip = "$STR_CELL_Pos_Tooltip";
 color[] = {0.863,0.078,0.231,1};
 colorFocused[] = {0.863,0.078,0.231,1};
 colorHover[] = {0.863,0.078,0.231,1};
 colorPressed[] = {0.863,0.078,0.231,1};
 colorDisabled[] = {0.863,0.078,0.231,1};
 colorBackground[] = {0, 0, 0, 0};
 colorBackgroundFocused[] = {0, 0, 0, 0};
 colorBackgroundHover[] = {0, 0, 0, 0};
 colorBackgroundPressed[] = {0, 0, 0, 0};
 colorBackgroundDisabled[] = {0, 0, 0, 0};
 };

 class trenn : ZaMJRapk
 {
 idc = 1502;
 x = 0.395864 * safezoneW + safezoneX;
 y = 0.194 * safezoneH + safezoneY;
 w = 0.00212358 * safezoneW;
 h = 0.649 * safezoneH;
 colorBackground[] = {0.863,0.078,0.231,0.3};
 };

 class to_list: nCAG
 {
 idc = 3005;
 x = 0.525773 * safezoneW + safezoneX;
 y = 0.807989 * safezoneH + safezoneY;
 w = 0.180406 * safezoneW;
 h = 0.033 * safezoneH;
 colorBackground[] = {0.863,0.078,0.231,0};
 tooltip = "$STR_CELL_Tolist_Tooltip";
 onLBSelChanged = "[_this select 1] call zero_fnc_kIB;";
 };

 class send_button: MCHU
 {
 idc = 3010;
 text = "$STR_CELL_Send";
 onButtonClick = "[] call zero_fnc_xnlHnCs;";
 x = 0.711333 * safezoneW + safezoneX;
 y = 0.808 * safezoneH + safezoneY;
 w = 0.0618536 * safezoneW;
 h = 0.033 * safezoneH;
 colorBackground[] = {0.192,0.549,0.906,1};

 class Attributes {
 align = "center";
 };
 };

 class CloseButtonKey : MCHU
 {
 idc = -1;
 onButtonClick = "closeDialog 0;";
 x = 0.760866 * safezoneW + safezoneX;
 y = 0.125 * safezoneH + safezoneY;
 w = 0.0133688 * safezoneW;
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
 idc = 2402;
 x = 0.231968 * safezoneW + safezoneX;
 y = 0.12 * safezoneH + safezoneY;
 w = 0.0757969 * safezoneW;
 h = 0.039 * safezoneH;
 tooltip = "$STR_PM_Haupt";
 onButtonClick = "closeDialog 0; closeDialog 0; [] spawn zero_fnc_IFXrAr";
 colorBackground[] = {-1,-1,-1,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 colorDisabled[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,1};
 colorBackgroundFocused[] = {-1,-1,-1,0};
 colorBackground2[] = {-1,-1,-1,0};
 };
 };

};
