class xgEiRkRKE
{
 idd = 2650;
 name = "xgEiRkRKE";
 movingEnabled = 0;
 enableSimulation = 1;

 class controlsBackground {

 class background: aAX
 {
 idc = 1200;
 text = "Resources\Textures\Icons\interaction.jpg";
 x = 0.405693 * safezoneW + safezoneX;
 y = 0.238001 * safezoneH + safezoneY;
 w = 0.188906 * safezoneW;
 h = 0.518727 * safezoneH;
 };
 };

 class controls
 {

 class percentageEdit : bWuKznMkb
 {
 idc = 2652;
 text = "";
 onSliderPosChanged = "[_this select 1] call zero_fnc_UEiZq;";
 
 x = 0.4125 * safezoneW + safezoneX;
 y = 0.48 * safezoneH + safezoneY;
 w = 0.175 * safezoneW;
 h = 0.02 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class payTicket: MCHU {
 idc = 2567;
 text = "$STR_Ticket_GiveTicket_Percentage";
 onButtonClick = "[0] spawn zero_fnc_QGGzC";
 x = 0.4125 * safezoneW + safezoneX;
 y = 0.54 * safezoneH + safezoneY;
 w = 0.1 * safezoneW;
 h = 0.04 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class AbortButton: MCHU
 {
 idc = -1;
 onButtonClick = "closeDialog 0; DXi = nil; KmSS = nil;";
 x = 0.570811 * safezoneW + safezoneX;
 y = 0.254004 * safezoneH + safezoneY;
 w = 0.0135473 * safezoneW;
 h = 0.0249968 * safezoneH;
 colorBackground[] = {-1,-1,-1,0};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0};
 colorBackground2[] = {0.192,0.549,0.906,0};
 color[] = {1,1,1,0};
 colorFocused[] = {0,0,0,0};
 color2[] = {0,0,0,0};
 colorText[] = {1,1,1,0};
 colorDisabled[] = {0,0,0,0};
 };

 class currValue: ssussK
 {
 idc = 2653;
 text = "";
 x = 0.45 * safezoneW + safezoneX;
 y = 0.38 * safezoneH + safezoneY;
 w = 0.1 * safezoneW;
 h = 0.06 * safezoneH;
 };

 class editValue: IkurrfNqo
 {
 idc = 2654;
 text = "1";
 x = 0.4625 * safezoneW + safezoneX;
 y = 0.6 * safezoneH + safezoneY;
 w = 0.075 * safezoneW;
 h = 0.04 * safezoneH;
 };

 class editPercentage: IkurrfNqo
 {
 idc = 2655;
 text = "1";
 x = 0.525 * safezoneW + safezoneX;
 y = 0.548008 * safezoneH + safezoneY;
 w = 0.05 * safezoneW;
 h = 0.024 * safezoneH;
 onKeyUp = "[] call zero_fnc_aub;";
 };

 class giveTicket: MCHU
 {
 idc = -1;
 text = "$STR_Ticket_GiveTicket";
 onButtonClick = "[1] spawn zero_fnc_QGGzC";
 x = 0.4125 * safezoneW + safezoneX;
 y = 0.67502 * safezoneH + safezoneY;
 w = 0.175 * safezoneW;
 h = 0.06 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class bankacc: EPFMAm
 {
 idc = 2656;
 text = "";
 x = 0.407084 * safezoneW + safezoneX;
 y = 0.410496 * safezoneH + safezoneY;
 w = 0.186646 * safezoneW;
 h = 0.0264 * safezoneH;
 };

 };
};

class gCJorZo
{
 idd = 2600;
 name = "gCJorZo";
 movingEnabled = 0;
 enableSimulation = 1;

 class controlsBackground {

 class background: aAX
 {
 idc = 1200;
 text = "Resources\Textures\Icons\interaction.jpg";
 x = 0.405693 * safezoneW + safezoneX;
 y = 0.238001 * safezoneH + safezoneY;
 w = 0.188906 * safezoneW;
 h = 0.518727 * safezoneH;
 };
 };

 class controls
 {
 class InfoMsg : ssussK
 {
 idc = 2601;
 sizeEx = 0.020;
 text = "";
 x = 0.4375 * safezoneW + safezoneX;
 y = 0.36 * safezoneH + safezoneY;
 w = 0.125 * safezoneW;
 h = 0.08 * safezoneH;
 };

 class payTicket: MCHU {
 idc = -1;
 text = "$STR_Ticket_PayTicket";
 onButtonClick = "[] call zero_fnc_FJcxF;";
 x = 0.425 * safezoneW + safezoneX;
 y = 0.52 * safezoneH + safezoneY;
 w = 0.15 * safezoneW;
 h = 0.06 * safezoneH;
 colorBackground[] = {-1,-1,-1,-1};
 colorBackgroundFocused[] = {0.863,0.078,0.235,0.3};
 colorBackground2[] = {0.192,0.549,0.906,0.3};
 color[] = {1,1,1,1};
 colorFocused[] = {0,0,0,1};
 color2[] = {0,0,0,1};
 colorText[] = {1,1,1,1};
 colorDisabled[] = {0,0,0,0.4};
 };

 class refuseTicket : MCHU {
 idc = -1;
 text = "$STR_Ticket_RefuseTicket";
 onButtonClick = "closeDialog 0;";
 x = 0.425 * safezoneW + safezoneX;
 y = 0.64 * safezoneH + safezoneY;
 w = 0.15 * safezoneW;
 h = 0.06 * safezoneH;
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
