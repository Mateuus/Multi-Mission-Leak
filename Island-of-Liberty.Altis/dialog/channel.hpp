class channel{
idd = 9000;
name= "channel";
movingEnable = false;
enableSimulation = true;

class controlsBackground {
class Life_RscTitleBackground:Life_RscText {
colorBackground[] = {0.09,0.55,0,1};
idc = -1;
x = 0.1;
y = 0.2;
w = 0.6;
h = (1 / 25);
};

class MainBackground:Life_RscText {
colorBackground[] = {0, 0, 0, 0.7};
idc = -1;
x = 0.1;
y = 0.24;
w = 0.6;
h = 0.24;
};
};

class controls {


class Title : Life_RscTitle {
colorBackground[] = {0, 0, 0, 0};
idc = -1;
text = "Channel 7 News (CH7) ";
x = 0.1;
y = 0.2;
w = 0.6;
h = (1 / 25);
};

class Channel7NewsEditText : Life_RscStructuredText
{
idc = -1;
text = "Nachricht:"; //--- ToDo: Localize;
x = 0.1;
y = 0.28;
w = 0.2;
h = 0.1;
};

class Channel7Edit : Life_RscEdit
{
idc = 9001;
text = "";
sizeEx = 0.04;
x = 0.2875;
y = 0.28;
w = 0.4;
h = 0.04;
};

class Channel7Description : Life_RscStructuredText
{
idc = -1;
text = "Diese News erhealt jeder Spieler! Bitte achte darauf was du schreibst."; //--- ToDo: Localize;
x = 0.15;
y = 0.34;
w = 0.5;
h = 0.1;
};

class CloseButtonKey : Life_RscButtonMenu {
idc = -1;
text = "$STR_Global_Close";
onButtonClick = "closeDialog 0;";
x = 0.0947396;
y = 0.491785;
w = 0.1625;
h = 0.04;
};

class SendButtonKey : Life_RscButtonMenu {
idc = 9005;
text = "Senden";
onButtonClick = "[] call life_fnc_sendChannel; closeDialog 0;";
x = 0.261131;
y = 0.491582;
w = 0.1625;
h = 0.04;
};
};
}; 