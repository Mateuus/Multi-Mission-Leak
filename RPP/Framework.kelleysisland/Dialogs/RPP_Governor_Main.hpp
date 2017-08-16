class RPP_Vote_Governor
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_Vote_Governor', (_this select 0)]";
	
	class Controls
	{

		class background: RPP_RscPicture
		{
			idc = 1800;
			text = "#(argb,8,8,3)color(0,0,0,0.8)";
			x = 0.35 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.34 * safezoneH;
		};
		class vote_log: RPP_RscListbox
		{
			idc = 1500;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.2 * safezoneH;
		};
		class RscButton_1600: RPP_RscButton
		{
			idc = 1600;
			text = "Laws"; //--- ToDo: Localize;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class RscButton_1601: RPP_RscButton
		{
			idc = 1601;
			text = "Body Guards"; //--- ToDo: Localize;
			x = 0.55 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class RscButton_1602: RPP_RscButton
		{
			idc = 1602;
			text = "Prices"; //--- ToDo: Localize;
			x = 0.4625 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class player_list: RPP_RscCombo
		{
			idc = 2100;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class RscButton_1603: RPP_RscButton
		{
			idc = 1603;
			text = "Vote For Governor"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class RscText_1000: RPP_RscText
		{
			idc = 1000;
			text = "Current Governor: Conner™ - Freelance Developer"; //--- ToDo: Localize;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.425 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class RscText_1001: RPP_RscText
		{
			idc = 1001;
			text = "Votting Logs"; //--- ToDo: Localize;
			x = 0.4625 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class Header: RPP_RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
			x = 0.35 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.06 * safezoneH;
		};
		class RscText_1002: RPP_RscText
		{
			idc = 1002;
			text = "Governor System"; //--- ToDo: Localize;
			x = 0.35 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.1 * safezoneH;
		};
	};
};
