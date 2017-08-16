class RPP_BodyGuards_Governor
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_BodyGuards_Governor', (_this select 0)]";
	
	class Controls
	{

		class background: RPP_RscPicture
		{
			idc = 1800;
			text = "#(argb,8,8,3)color(0,0,0,0.8)";
			x = 0.375 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.32 * safezoneH;
		};
		class body_guards: RPP_RscListbox
		{
			idc = 1500;
			x = 0.4 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.18 * safezoneH;
		};
		class RscText_1000: RPP_RscText
		{
			idc = 1000;
			text = "Body Guards"; //--- ToDo: Localize;
			x = 0.475 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class RscButton_1600: RPP_RscButton
		{
			idc = 1600;
			text = "Hire Body Guard"; //--- ToDo: Localize;
			x = 0.4 * safezoneW + safezoneX;
			y = 0.6 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class RscButton_1601: RPP_RscButton
		{
			idc = 1601;
			text = "Fire Body Guard"; //--- ToDo: Localize;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.6 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class playerlist: RPP_RscCombo
		{
			idc = 2100;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class header: RPP_RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
			x = 0.375 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.06 * safezoneH;
		};
		class RscText_1001: RPP_RscText
		{
			idc = 1001;
			text = "Governor System"; //--- ToDo: Localize;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.1 * safezoneH;
		};
	};
};
