class ymenu {

	idd = 90000;
	name= "ymenu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.462 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "Player Menu"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class adminmenu: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Admin Menu"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; call life_fnc_pucra;";
		};
		class economy: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Economy"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; call life_fnc_dychk;";
		};
		class gangmenu: Life_RscButtonMenu
		{
			idc = 2402;
			text = "Gang"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gangLeader""}) then {closeDialog 0; createDialog ""Life_Create_Gang_Diag"";} else {closeDialog 0; [] spawn life_fnc_hucruphu;};};";
		};
		class skillsmenu: Life_RscButtonMenu
		{
			idc = 2403;
			text = "Skills"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; createDialog ""life_skillMenu"";";
		};
		class RscButtonMenu_2404: Life_RscButtonMenu
		{
			idc = 2404;
			text = "Info"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; [0] spawn life_fnc_hunubrecr;";
		};
		class RscButtonMenu_2405: Life_RscButtonMenu
		{
			idc = 2405;
			text = "Health"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; [] spawn life_fnc_swetupruswazu;";
		};
		class government: Life_RscButtonMenu
		{
			idc = 2406;
			text = "Government"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; call life_fnc_gawrutaha;";
		};
		class RscButtonMenu_2407: Life_RscButtonMenu
		{
			idc = 2407;
			text = "Messaging"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;call life_fnc_juweghygs;";
		};
		class syncdata: Life_RscButtonMenu
		{
			idc = 2408;
			text = "Sync Data"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] call life_fnc_pawrahuza;";
		};
		class RscButtonMenu_2409: Life_RscButtonMenu
		{
			idc = 2409;
			text = "Close"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class RscButtonMenu_2410: Life_RscButtonMenu
		{
			idc = 2410;
			text = "Settings"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; call life_fnc_vuwufefatr;";
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.099 * safezoneH;
			sizeEx = 0.035;
		};
		class RscListbox_1501: Life_RscListbox
		{
			idc = 1501;
			text = "";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.154 * safezoneH;
			sizeEx = 0.035;
		};
		class RscButtonMenu_2411: RscButtonMenu
		{
			idc = 2411;
			text = "Use"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_tupuhacuyu;";
		};
		class RscButtonMenu_2412: RscButtonMenu
		{
			idc = 2412;
			text = "Remove"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_crufuhujeh;";
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Cash on Hand: $0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Items on You"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1004: Life_RscText
		{
			idc = 1004;
			text = "Training and Licenses"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = "Info<br/>Civs: 70<br/>TSO: 20<br/>EMS: 9"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class backup: Life_RscButtonMenu
		{
			idc = 2413;
			text = "Backup"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; call life_fnc_cheswecrat";
		};
		class wantedlist: Life_RscButtonMenu
		{
			idc = 2414;
			text = "TSO Server"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; [] spawn life_fnc_tsoDatabaseOpen;";
		};
		class RscButtonMenu_2415: Life_RscButtonMenu
		{
			idc = 2415;
			text = "Checkpoints"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class news: Life_RscButtonMenu
		{
			idc = 2416;
			text = "Government"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; call life_fnc_gawrutaha;";
		};
		class keychain: Life_RscButtonMenu
		{
			idc = 2417;
			text = "Key Chain"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; call life_fnc_yakechanes;";
		};
	};
};
