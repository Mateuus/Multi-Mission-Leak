class life_wanted_menu {
idd = 2400;
name= "life_wanted_menu";
movingEnable = false;
enableSimulation = true;

class controlsBackground {
class Life_RscTitleBackground:Life_RscText {
idc = -1;
x = 0.1;
y = 0.2;
w = 0.6;
h = (1 / 25);
};

class MainBackground: Life_RscPicture {
text = "textures\FahndungsPC.paa";
idc = -1;
x = -0.2;
y = 0;
w = 1.5;
h = 1;
};
};


class controls {


class Title : Life_RscTitle {
colorBackground[] = {0, 0, 0, 0};
idc = -1;
text = "$STR_Wanted_Title";
x = 0.1;
y = 0.2;
w = 0.6;
h = (1 / 25);
};

class WantedConnection : Title {
idc = 2404;
style = 1;
text = "";
x = -0.02;
};

class WantedList : Life_RscListBox
{
idc = 2401;
text = "";
sizeEx = 0.035;
onLBSelChanged = "[] call life_fnc_wantedInfo";

x = 0.1; y = 0.27;
w = 0.2; h = 0.4;
};

class WantedDetails : Life_RscListBox
{
idc = 2402;
text = "";
sizeEx = 0.035;
colorBackground[] = {0, 0, 0, 0};

x = 0.34;
y = 0.27;
w = 0.36;
h = 0.4;
};

class BountyPrice : Life_RscText
{
idc = 2403;
text = "";
x = 0.75;
y = 0.15;
w = 0.6;
h = 0.6;
};

class CloseButtonKey : Life_RscButtonInvisible {
idc = -1;
text = "";
onButtonClick = "closeDialog 0;";
x = 0.10;
y = 0.72;
w = 0.07;
h = 0.10;
};

class PardonButtonKey : Life_RscButtonInvisible {
idc = 2405;
text = "";
onButtonClick = "[] call life_fnc_pardon;";
x = 0.19;
y = 0.72;
w = 0.07;
h = 0.10;
};
class ButtonWantedAdd : Life_RscButtonInvisible {
idc = 9800;
text = "";
onButtonClick = "createDialog ""life_wantedadd2"";";
x = 0.285;
y = 0.72;
w = 0.07;
h = 0.10;
};
};
};