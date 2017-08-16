class PSjSFwvPv
{
 idd = 2400;
 name= "PSjSFwvPv";
 movingEnable = 0;
 enableSimulation = 1;

 class controlsBackground
 {

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

 class controls
 {

 class Title : nRBjiSC
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Markt";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };

 class ButtonClose : MCHU
 {
 idc = -1;
 onButtonClick = "closeDialog 0;";
 x = 0.763534 * safezoneW + safezoneX;
 y = 0.124737 * safezoneH + safezoneY;
 w = 0.013551 * safezoneW;
 h = 0.0289943 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
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

 class shop_inv_text: EPFMAm
 {
 idc = 1000;
 text = "LADEN INVENTAR";
 x = 0.227101 * safezoneW + safezoneX;
 y = 0.175016 * safezoneH + safezoneY;
 w = 0.262407 * safezoneW;
 h = 0.04 * safezoneH;
 };

 class player_inv_text: EPFMAm
 {
 idc = 1001;
 text = "DEIN INVENTAR";
 x = 0.5188 * safezoneW + safezoneX;
 y = 0.175016 * safezoneH + safezoneY;
 w = 0.262407 * safezoneW;
 h = 0.04 * safezoneH;
 };

 class trenn: ZaMJRapk
 {
 idc = 1500;
 x = 0.5003 * safezoneW + safezoneX;
 y = 0.201998 * safezoneH + safezoneY;
 w = 0.00212358 * safezoneW;
 h = 0.62 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };

 class itemList : ZaMJRapk
 {
 idc = 2401;
 text = "";
 sizeEx = 0.030;
 x = 0.230122 * safezoneW + safezoneX;
 y = 0.219001 * safezoneH + safezoneY;
 w = 0.250524 * safezoneW;
 h = 0.52 * safezoneH;
 };

 class pItemlist : ZaMJRapk
 {
 idc = 2402;
 text = "";
 sizeEx = 0.030;
 x = 0.521322 * safezoneW + safezoneX;
 y = 0.219001 * safezoneH + safezoneY;
 w = 0.25 * safezoneW;
 h = 0.52 * safezoneH;
 };

 class ButtonAddG : MCHU
 {
 idc = -1;
 text = "$STR_VS_BuyItem";
 onButtonClick = "if(!isNil 'IbjHs' && servertime - IbjHs < 1) exitWith {hint localize 'STR_NOTF_Buy_Virt_Stop';}; if(isNil 'IbjHs') then {IbjHs = servertime;}; IbjHs = servertime; [false] spawn zero_fnc_vnaISsfV;";
 x = 0.230211 * safezoneW + safezoneX;
 y = 0.8 * safezoneH + safezoneY;
 w = 0.1125 * safezoneW;
 h = 0.04 * safezoneH;
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

 class ButtonBuyGang: MCHU
 {
 idc = 2406;
 text = "Gang kaufen";
 onButtonClick = "if(!isNil 'IbjHs' && servertime - IbjHs < 1) exitWith {hint localize 'STR_NOTF_Buy_Virt_Stop';}; if(isNil 'IbjHs') then {IbjHs = servertime;}; IbjHs = servertime; [true] spawn zero_fnc_vnaISsfV;";
 x = 0.368 * safezoneW + safezoneX;
 y = 0.8 * safezoneH + safezoneY;
 w = 0.1125 * safezoneW;
 h = 0.04 * safezoneH;
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

 class ButtonRemoveG : MCHU
 {
 idc = -1;
 text = "$STR_VS_SellItem";
 onButtonClick = "if(!isNil 'IbjHs' && servertime - IbjHs < 1) exitWith {hint localize 'STR_NOTF_Buy_Virt_Stop';}; if(isNil 'IbjHs') then {IbjHs = servertime;}; IbjHs = servertime; [0] call zero_fnc_LLttDe";
 x = 0.521846 * safezoneW + safezoneX;
 y = 0.8 * safezoneH + safezoneY;
 w = 0.1125 * safezoneW;
 h = 0.04 * safezoneH;
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

 class ButtonRemoveGAll : MCHU
 {
 idc = -1;
 text = "$STR_VS_SellItem_All";
 sizeEx = 0.02;
 onButtonClick = "if(!isNil 'IbjHs' && servertime - IbjHs < 1) exitWith {hint localize 'STR_NOTF_Buy_Virt_Stop';}; if(isNil 'IbjHs') then {IbjHs = servertime;}; IbjHs = servertime; [1] call zero_fnc_LLttDe";
 x = 0.659873 * safezoneW + safezoneX;
 y = 0.8 * safezoneH + safezoneY;
 w = 0.1125 * safezoneW;
 h = 0.04 * safezoneH;
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

 class buyEdit : IkurrfNqo
 {
 idc = 2404;
 text = "1";
 sizeEx = 0.04;
 x = 0.230887 * safezoneW + safezoneX;
 y = 0.749007 * safezoneH + safezoneY;
 w = 0.249911 * safezoneW;
 h = 0.04 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 };
 class sellEdit : IkurrfNqo
 {
 idc = 2405;
 text = "1";
 sizeEx = 0.04;
 x = 0.522419 * safezoneW + safezoneX;
 y = 0.750007 * safezoneH + safezoneY;
 w = 0.249911 * safezoneW;
 h = 0.04 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 };
 };
};
