class adminMenu {
	idd = 2900;
	name = "adminMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] spawn DS_fnc_adminMenu;";

	class controls
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			moving = true;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class RscListbox_1500: DS_RscListBox
		{
			idc = 1500;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.471 * safezoneH;
			onLBDblClick = "[] spawn DS_fnc_adminSpectate;";
			onLBSelChanged = "[_this] spawn DS_fnc_adminQuery";
		};
		class RscEdit_1400: DS_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.7134 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscCombo_2100: DS_RscCombo
		{
			idc = 2100;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.7398 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "[] call DS_fnc_amUpdatePlayerList;";
		};
		class RscCheckbox_2800: RscCheckbox
		{
			idc = 2800;
			x = 0.405125 * safezoneW + safezoneX;
			y = 0.7112 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			onCheckedChanged = "[] call DS_fnc_amUpdatePlayerList; DS_amShowIcons = !DS_amShowIcons;";
		};
		class RscText_1006: RscText
		{
			idc = 1006;
			text = "Icons"; //--- ToDo: Localize;
			x = 0.414406 * safezoneW + safezoneX;
			y = 0.7112 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscCheckbox_2801: RscCheckBox
		{
			idc = 2801;
			x = 0.379344 * safezoneW + safezoneX;
			y = 0.7398 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			onCheckedChanged = "[] call DS_fnc_amUpdatePlayerList;";
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Breaking NLR"; //--- ToDo: Localize;
			x = 0.388625 * safezoneW + safezoneX;
			y = 0.7398 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscStructuredText_1100: DS_RscStructuredText
		{
			idc = 1100;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.154 * safezoneH;
		};
		class RscButtonMenu_2400: RscButtonMenu
		{
			idc = 2400;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2401: RscButtonMenu
		{
			idc = 2401;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2402: RscButtonMenu
		{
			idc = 2402;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.4516 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2403: RscButtonMenu
		{
			idc = 2403;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.4516 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2404: RscButtonMenu
		{
			idc = 2404;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.4802 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2405: RscButtonMenu
		{
			idc = 2405;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.4802 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2406: RscButtonMenu
		{
			idc = 2406;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.5088 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2407: RscButtonMenu
		{
			idc = 2407;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.5088 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2408: RscButtonMenu
		{
			idc = 2408;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.5374 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2409: RscButtonMenu
		{
			idc = 2409;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.5374 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2410: RscButtonMenu
		{
			idc = 2410;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2411: RscButtonMenu
		{
			idc = 2411;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2412: RscButtonMenu
		{
			idc = 2412;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.5946 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2413: RscButtonMenu
		{
			idc = 2413;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.5946 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2414: RscButtonMenu
		{
			idc = 2414;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.6232 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2415: RscButtonMenu
		{
			idc = 2415;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.6232 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2416: RscButtonMenu
		{
			idc = 2416;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.6562 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2417: RscButtonMenu
		{
			idc = 2417;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.6562 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2418: RscButtonMenu
		{
			idc = 2418;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.6848 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2419: RscButtonMenu
		{
			idc = 2419;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.6848 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2420: RscButtonMenu
		{
			idc = 2420;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.7134 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2421: RscButtonMenu
		{
			idc = 2421;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.7134 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2422: RscButtonMenu
		{
			idc = 2422;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0670311 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2423: RscButtonMenu
		{
			idc = 2423;
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0670311 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2424: RscButtonMenu
		{
			idc = 2424;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0670311 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscEdit_1401: RscEdit
		{
			idc = 1401;
			text = ""; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.3966 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.022 * safezoneH;
		};
		/*
		class RscText_1007: RscText
		{
			idc = 1007;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.6496 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.001 * safezoneH;
			colorBackground[] = {1,1,1,0.6};
		};
		*/
	};
};