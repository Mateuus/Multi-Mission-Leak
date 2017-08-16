#define INFINITE 1e+1000
#define ST_RIGHT 0x01
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
        class statusBarCash {
		idc = 555557;
		shadow = 2;
		font = "PuristaSemibold";
		size = 0.05;
		type = 13;
		style = 1;
		text="";
		x = 0.928976 * safezoneW + safezoneX;
		y = 0.874046 * safezoneH + safezoneY;
		w = 0.0694073 * safezoneW;
		h = 0.0308038 * safezoneH;
		colorBackground[] = {0,0,0,0.3};
        class Attributes {
			align="center";
			color = "#CCCCCC";//#5fe60c
        };
	};
	class CASH_ICON: life_RscPicture
	{
		idc = 555558;
		text = "icons\money.paa"; //--- ToDo: Localize;
		x = 0.90478 * safezoneW + safezoneX;
		y = 0.874046 * safezoneH + safezoneY;
		w = 0.0206109 * safezoneW;
		h = 0.0299478 * safezoneH;
	};

    //----------------

	class statusBarHealth {
		idc = 555559;
		shadow = 2;
		font = "PuristaSemibold";
		size = 0.05;
		type = 13;
		style = 1;
		text="";
		x = 0.928976 * safezoneW + safezoneX;
		y = 0.83004 * safezoneH + safezoneY;
		w = 0.0694073 * safezoneW;
		h = 0.0308038 * safezoneH;
		colorBackground[] = {0,0,0,0.3};
        class Attributes {
			align="center";
			color = "#e6260c";//#5fe60c
        };
	};
	class HEALTH_ICON: life_RscPicture
	{
		idc = 555560;
		text = "icons\Statusbar\damage.paa"; //--- ToDo: Localize;
		x = 0.904876 * safezoneW + safezoneX;
		y = 0.83004 * safezoneH + safezoneY;
		w = 0.0206109 * safezoneW;
		h = 0.0299478 * safezoneH;
	};

    //----------------

	class statusBarDrink {
		idc = 555561;
		shadow = 2;
		font = "PuristaSemibold";
		size = 0.05;
		type = 13;
		style = 1;
		text="";
		x = 0.928976 * safezoneW + safezoneX;
		y = 0.786035 * safezoneH + safezoneY;
		w = 0.0694073 * safezoneW;
		h = 0.0308038 * safezoneH;
		colorBackground[] = {0,0,0,0.3};
        class Attributes {
			align="center";
			color = "#0c5fe6";//#5fe60c
        };
	};
	class DRINK_ICON: life_RscPicture
	{
		idc = 555562;
		text = "icons\Statusbar\thirst.paa"; //--- ToDo: Localize;
		x = 0.904876 * safezoneW + safezoneX;
		y = 0.786035 * safezoneH + safezoneY;
		w = 0.0206109 * safezoneW;
		h = 0.0299478 * safezoneH;
	};

    //----------------

	class statusBarFood {
		idc = 555563;
		shadow = 2;
		font = "PuristaSemibold";
		size = 0.05;
		type = 13;
		style = 1;
		text="";
		x = 0.928976 * safezoneW + safezoneX;
		y = 0.74203 * safezoneH + safezoneY;
		w = 0.0694073 * safezoneW;
		h = 0.0308038 * safezoneH;
		colorBackground[] = {0,0,0,0.3};
        class Attributes {
			align="center";
			color = "#5fe60c";//#5fe60c
        };
	};
	class FOOD_ICON: life_RscPicture
	{
		idc = 555564;
		text = "icons\Statusbar\hunger.paa"; //--- ToDo: Localize;
		x = 0.904876 * safezoneW + safezoneX;
		y = 0.74203 * safezoneH + safezoneY;
		w = 0.0206109 * safezoneW;
		h = 0.0299478 * safezoneH;
	};
    };
};
