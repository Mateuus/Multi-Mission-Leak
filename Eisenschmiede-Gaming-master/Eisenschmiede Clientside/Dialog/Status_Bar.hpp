#define ST_RIGHT 0x01
#define INFINITE 1e+1000

class Status_Bar {
	idd = -1;
	onLoad = "uiNamespace setVariable ['Status_Bar', _this select 0]";
	onUnload = "uiNamespace setVariable ['Status_Bar', objNull]";
	onDestroy = "uiNamespace setVariable ['Status_Bar', objNull]";
	fadein = 0.5;
	fadeout = 0.5;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1000;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.973 * safezoneH + safezoneY;
			w = 0.9 * safezoneW;
			h = 0.1 * safezoneH;
			shadow = 2;
			colorBackground[] = { 1, 0.3, 0, 0.0 };
			font = "EtelkaNarrowMediumPro";
			size = 0.05;
			type = 13;
			style = 1;
			text="";
			class Attributes {
				align="";
				color = "#ffffff";
			};
		};
	};
};

class osefStatusBar {
    idd = -1;
    onLoad = "uiNamespace setVariable ['osefStatusBar', _this select 0]";
    fadein = 0;
    fadeout = 0;
    duration = INFINITE;
    movingEnable = 0;
    controlsBackground[] = {};
    objects[] = {};
    class controls {
        class statusBarText {
			idc = 555556;
			x = safezoneX + safezoneW - 0.75;
			y = safezoneY + safezoneH - 0.08;
			w = 0.72;
			h = 0.056;
			shadow = 2;
			colorBackground[] = { 0, 0, 0, 0.3 };
			font = "PuristaSemibold";
			size = 0.03;
			type = 13;
			style = 1;
			text="";
			class Attributes {
				align="left";
				color = "#CCCCCC";
            };
        };
		
        class statusBarCash {
			idc = 555557;
			x = safezoneX + safezoneW - 0.18;
			y = safezoneY + safezoneH - 0.24;
			w = 0.15;
			h = 0.054;
			shadow = 2;
			colorBackground[] = { 0, 0, 0, 0.3 };
			font = "PuristaSemibold";
			size = 0.03;
			type = 13;
			style = 1;
			text="";
			class Attributes {
				align="left";
				color = "#CCCCCC";
            };
        };
		
        class statusBarBank {
			idc = 555558;
			x = safezoneX + safezoneW - 0.18;
			y = safezoneY + safezoneH - 0.17;
			w = 0.15;
			h = 0.054;
			shadow = 2;
			colorBackground[] = { 0, 0, 0, 0.3 };
			font = "PuristaSemibold";
			size = 0.03;
			type = 13;
			style = 1;
			text="";
			class Attributes {
				align="left";
				color = "#CCCCCC";
            };
        };
    };
};
