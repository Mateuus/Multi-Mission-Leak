class BzBc{
 idd = 9000;
 name= "BzBc";
 movingEnable = 0;
 enableSimulation = 1;

 class controlsBackground {
 class oIYi:EPFMAm {
 colorBackground[] = {"(missionNamespace getVariable ['ZO_GUI_BCG_RGB_R',0.706])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_G',0.075])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_B',0.216])", "(missionNamespace getVariable ['ZO_GUI_BCG_RGB_A',1])"};
 idc = -1;
 x = 0.1;
 y = 0.2;
 w = 0.6;
 h = (1 / 25);
 };

 class MainBackground:EPFMAm {
 colorBackground[] = {0, 0, 0, 0.7};
 idc = -1;
 x = 0.1;
 y = 0.2 + (11 / 250);
 w = 0.6;
 h = 0.6 - (22 / 250);
 };
 };

 class controls {

 class Title : nRBjiSC {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Channel 7 News (CH7) ";
 x = 0.1;
 y = 0.2;
 w = 0.6;
 h = (1 / 25);
 };

 class Channel7NewsEditText : ssussK
 {
 idc = -1;
 text = "Message to all:";
 x = 0.12;
 y = 0.4;
 w = 0.2;
 h = 0.1;
 };

 class Channel7Edit : IkurrfNqo
 {
 idc = 9001;
 text = "";
 sizeEx = 0.04;
 x = 0.275;
 y = 0.4;
 w = 0.4;
 h = 0.04;
 };

 class Channel7Description : ssussK
 {
 idc = -1;
 text = "This message will be send to all on the server. Pay attention to what you write!";
 x = 0.12;
 y = 0.5;
 w = 0.5;
 h = 0.1;
 };

 class CloseButtonKey : MCHU {
 idc = -1;
 text = "$STR_Global_Close";
 onButtonClick = "closeDialog 0;";
 x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
 y = 0.8 - (1 / 25);
 w = (6.25 / 40);
 h = (1 / 25);
 };

 class SendButtonKey : MCHU {
 idc = 9005;
 text = "Send";
 onButtonClick = "[] call zero_fnc_gjfWlgfwF; closeDialog 0;";
 x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
 y = 0.8 - (1 / 25);
 w = (6.25 / 40);
 h = (1 / 25);
 };
 };
};
