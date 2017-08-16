#define ST_RIGHT 0x01
class live_Anzeige {
    idd = -1;
    onLoad = "uiNamespace setVariable ['live_Anzeige', _this select 0]";
    onUnload = "uiNamespace setVariable ['live_Anzeige', objNull]";
    onDestroy = "uiNamespace setVariable ['live_Anzeige', objNull]";
    fadein = 0;
    fadeout = 0;
    duration = 10e10;
    movingEnable = 0;
    controlsBackground[] = {};
    objects[] = {};
    class controls {
        class statusBarText {
        idc = 555556;
	x = safezoneX + safezoneW - 0.65;
	y = safezoneY + safezoneH - 0.07;
	w = 1.17;
	h = 0.078;
	font = "PuristaSemibold";
	size = 0.045;
	type = 13;
	style = 1;
	text="";
	class Attributes {
	align="left";
	color = "#CCCCCC";//#5fe60c
            };
        };
    };
};