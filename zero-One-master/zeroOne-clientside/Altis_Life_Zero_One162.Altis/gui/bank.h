
class lHCVZn {
 idd = 2700;
 name= "miKkXf";
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
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };

 class trenn_1: ZaMJRapk
 {
 idc = 1500;
 x = 0.25 * safezoneW + safezoneX;
 y = 0.38 * safezoneH + safezoneY;
 w = 0.5 * safezoneW;
 h = 0.0055 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };
 class trenn_2: ZaMJRapk
 {
 idc = 1502;
 x = 0.25 * safezoneW + safezoneX;
 y = 0.44 * safezoneH + safezoneY;
 w = 0.5 * safezoneW;
 h = 0.0055 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };
 class trenn_3: ZaMJRapk
 {
 idc = 1501;
 x = 0.498879 * safezoneW + safezoneX;
 y = 0.453 * safezoneH + safezoneY;
 w = 0.00312431 * safezoneW;
 h = 0.18 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };
 class trenn_4: ZaMJRapk
 {
 idc = 1503;
 x = 0.25 * safezoneW + safezoneX;
 y = 0.64 * safezoneH + safezoneY;
 w = 0.5 * safezoneW;
 h = 0.0055 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };
 class trenn_5: ZaMJRapk
 {
 idc = 1504;
 x = 0.25 * safezoneW + safezoneX;
 y = 0.76 * safezoneH + safezoneY;
 w = 0.5 * safezoneW;
 h = 0.0055 * safezoneH;
 colorBackground[] = {0.863,0.078,0.235,0.3};
 };
 };

 class controls {

 class CashTitle: ssussK
 {
 idc = 2701;

 x = 0.325 * safezoneW + safezoneX;
 y = 0.22 * safezoneH + safezoneY;
 w = 0.35 * safezoneW;
 h = 0.14 * safezoneH;
 };
 class Title: nRBjiSC
 {
 idc = -1;

 text = "$STR_ATM_Title";
 x = 0.304992 * safezoneW + safezoneX;
 y = 0.118856 * safezoneH + safezoneY;
 w = 0.17018 * safezoneW;
 h = 0.0440162 * safezoneH;
 };
 class MaxButtWith : MCHU
 {
 idc = -1;
 text = "Max.";
 onButtonClick = "if (([2, 0] call zero_fnc_JNHrfnI) > 999999) then {ctrlSetText[2702,str(999999)];} else {ctrlSetText[2702,str(([2, 0] call zero_fnc_JNHrfnI))];};";
 x = 0.325 * safezoneW + safezoneX;
 y = 0.48 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
 h = 0.04 * safezoneH;
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
 class WithdrawButton: MCHU
 {
 onButtonClick = "[] call zero_fnc_daWK";

 idc = 1004;
 text = "$STR_ATM_Withdraw";
 x = 0.325 * safezoneW + safezoneX;
 y = 0.56 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
 h = 0.04 * safezoneH;
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
 class MaxButtDep : MCHU
 {
 idc = -1;
 text = "Max.";
 onButtonClick = "if (([3, 0] call zero_fnc_JNHrfnI) > 999999) then {ctrlSetText[2702,str(999999)];} else {ctrlSetText[2702,str(([3, 0] call zero_fnc_JNHrfnI))];};";
 x = 0.55 * safezoneW + safezoneX;
 y = 0.48 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
 h = 0.04 * safezoneH;
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
 class DepositButton: MCHU
 {
 onButtonClick = "[] call zero_fnc_vvwnr";

 idc = 1005;
 text = "$STR_ATM_Deposit";
 x = 0.55 * safezoneW + safezoneX;
 y = 0.56 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
 h = 0.04 * safezoneH;
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
 class moneyEdit: IkurrfNqo
 {
 idc = 2702;

 text = "100";
 x = 0.325525 * safezoneW + safezoneX;
 y = 0.393 * safezoneH + safezoneY;
 w = 0.35 * safezoneW;
 h = 0.04 * safezoneH;
 colorBackground[] = {0.063,0.071,0.098,0.3};
 colorActive[] = {0.863,0.078,0.235,1};
 };
 class PlayerList: nCAG
 {
 idc = 2703;

 x = 0.3 * safezoneW + safezoneX;
 y = 0.68 * safezoneH + safezoneY;
 w = 0.175 * safezoneW;
 h = 0.04 * safezoneH;
 colorBackground[] = {0.063,0.071,0.098,0.3};
 colorActive[] = {0.863,0.078,0.235,1};
 };
 class TransferButton: MCHU
 {
 onButtonClick = "[] call zero_fnc_wHLkZRwH";

 idc = 1008;
 text = "$STR_ATM_Transfer";
 x = 0.55 * safezoneW + safezoneX;
 y = 0.68 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
 h = 0.04 * safezoneH;
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
 class GangDeposit: MCHU
 {
 idc = 2705;
 onButtonClick = "[] call zero_fnc_lxBmc";
 lineSpacing = 2;
 text = "$STR_pInAct_DepositToGang";
 x = 0.4375 * safezoneW + safezoneX;
 y = 0.8 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
 h = 0.04 * safezoneH;
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
 class CloseButtonKey: MCHU
 {
 onButtonClick = "closeDialog 0;";
 idc = 1010;
 x = 0.761963 * safezoneW + safezoneX;
 y = 0.123738 * safezoneH + safezoneY;
 w = 0.013551 * safezoneW;
 h = 0.0289943 * safezoneH;
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
