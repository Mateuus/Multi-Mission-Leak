class life_wantedadd2 {
idd = 9900;
name= "life_wantedadd2";
movingEnable = false;
enableSimulation = true;
onLoad = "[] spawn life_fnc_wantedadd2;";

class controlsBackground {
class Life_RscTitleBackground:Life_RscText {
idc = -1;
x = 0.1;
y = 0.2;
w = 0.8;
h = (1 / 25);
};

class MainBackground: Life_RscPicture {
text = "textures\FahndungsWantedplus.paa";
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
idc = 2901;
text = "Kriminelle Verwalten";
x = 0.1;
y = 0.2;
w = 0.6;
h = (1 / 25);
};

class PlayerList_Admin : Life_RscListBox
{
idc = 9902;
text = "";
sizeEx = 0.035;
//colorBackground[] = {0,0,0,0};
onLBSelChanged = "[_this] spawn life_fnc_adminQuery";

x = 0.12; y = 0.25;
w = 0.30; h = 0.4;
};


class RSUCombo_2101: Life_RscListBox
{
idc = 9991;
text = "";
sizeEx = 0.035;
x = 0.42;
y = 0.25;
w = 0.6;
h = 0.4;
// onLBSelChanged="call fnc_Cmb_changed;";
//--- action/function to call when listbox or combobox has been changed

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


class Adminwanted : Life_RscButtonInvisible {
idc = -1;
text = "";
onButtonClick = "[] call life_fnc_wanted2;";
x = 0.285;
y = 0.72;
w = 0.07;
h = 0.10;
};


};
};