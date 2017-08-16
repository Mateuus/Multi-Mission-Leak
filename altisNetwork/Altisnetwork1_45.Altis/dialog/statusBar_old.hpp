#define ST_CENTER 0x02

class osefStatusBar {
	idd = -1;
	onLoad = "uiNamespace setVariable ['osefStatusBar', _this select 0]";
	onUnload = "uiNamespace setVariable ['osefStatusBar', objNull]";
	onDestroy = "uiNamespace setVariable ['osefStatusBar', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1000;
            x = safezoneX;
            y = safezoneY + safezoneH - 0.037;
            w = safezoneW;
            h = 0.06;
			shadow = 2;
			colorBackground[] = { 0, 0, 0, 0.8 };  // uncomment and increase 4th number to have a background
			font = "PuristaSemibold";
			size = 0.035;
			type = 13;
			style = 2;
			text="";
			class Attributes {
				align="center";
				color = "#FFFFF";
			};
		};
	};
};
