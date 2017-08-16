class RPP_Laws_Governor
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_Laws_Governor', (_this select 0)]";
	
	class Controls
	{

		class background: RPP_RscPicture
		{
			idc = 1800;
			text = "#(argb,8,8,3)color(0,0,0,0.8)";
			x = 0.35 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.4 * safezoneH;
		};
		class laws: RPP_RscListbox
		{
			idc = 1500;
			onLBSelChanged = "_this call RPP_Goverment_SelectLaw";
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.26 * safezoneH;
		};
		class RscButton_1600: RPP_RscButton
		{
			idc = 1600;
			text = "Add Law"; //--- ToDo: Localize;
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.68 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class Law_edit: RPP_RscEdit
		{
			idc = 1400;
			x = 0.4 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.2375 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class RscButton_1601: RPP_RscButton
		{
			idc = 1601;
			text = "Delete Law"; //--- ToDo: Localize;
			x = 0.4625 * safezoneW + safezoneX;
			y = 0.68 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class RscButton_1602: RPP_RscButton
		{
			idc = 1602;
			text = "Edit Law"; //--- ToDo: Localize;
			x = 0.5625 * safezoneW + safezoneX;
			y = 0.68 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class RscText_1000: RPP_RscText
		{
			idc = 1000;
			text = "Law:"; //--- ToDo: Localize;
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class RscText_1001: RPP_RscText
		{
			idc = 1001;
			text = "Laws"; //--- ToDo: Localize;
			x = 0.475 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.04 * safezoneH;
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
			w = 0.075 * safezoneW;
			h = 0.1 * safezoneH;
		};
	};
};
